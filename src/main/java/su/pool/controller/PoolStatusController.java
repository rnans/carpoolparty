package su.pool.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import su.pool.model.PoolDAO;
import su.pool.model.PoolDTO;
import su.pool.model.PoolMasterStatusDTO;
import su.pool.model.PoolMemberStatusDTO;
import su.pool.model.PoolStatusDAO;
import su.pool.model.*;

@Controller
public class PoolStatusController 
{
	
	@Autowired
	private PoolDAO poolDao;
	
	public PoolDAO getPoolDao() {
		return poolDao;
	}

	public void setPoolDao(PoolDAO poolDao) {
		this.poolDao = poolDao;
	}
	
	@Autowired
	private PoolStatusDAO poolStatusDao;
	
	public PoolStatusDAO getPoolStatusDao() {
		return poolStatusDao;
	}

	public void setPoolStatusDao(PoolStatusDAO poolStatusDao) {
		this.poolStatusDao = poolStatusDao;
	}

	@RequestMapping("/reqToMasterPage.do")
	public ModelAndView requestToMasterPage(@RequestParam(value="idx")String idx,@RequestParam(value="cp", defaultValue="1")int cp,HttpSession session)
	{
		String id=(String)session.getAttribute("sid");

		int totalCnt=poolStatusDao.getOwnMemberTotalCnt(id);
		int aimidx=Integer.parseInt(idx);
		
		ModelAndView mav=new ModelAndView();
		
		if(totalCnt==0)
		{
			PoolMemberStatusDTO memberDto=new PoolMemberStatusDTO(id, aimidx);
			PoolMasterStatusDTO masterDto=new PoolMasterStatusDTO(aimidx, "1", id);
			
			int count=poolStatusDao.makeMemberStatus(memberDto);
			int count2=poolStatusDao.reqToMaster(masterDto);
			
			String msg=count+count2>=2?"성공":"실패";
			mav.addObject("msg",msg);
			mav.setViewName("carpool/poolMsg");
		}
		else
		{
			int listSize=10;
			int pageSize=5;
			List<PoolDTO> list=poolStatusDao.viewOwnMemberPoolList(cp,listSize,id);
			String pageStr=
				su.Page.SuPage.makePage("poolList.do", totalCnt, listSize, pageSize, cp);
			
			mav.addObject("list", list);
			mav.addObject("pageStr",pageStr);
			mav.addObject("aimidx",aimidx);
			mav.setViewName("carpool/poolMemberReqList");
		}
		return mav;
	}
	
	
	public ModelAndView requestToMaster(@RequestParam(value="idx")String idx,@RequestParam(value="idx")String aimidx,HttpSession session)
	{
		String id=(String)session.getAttribute("sid");

		int ownidx=Integer.parseInt(idx);
		int addidx=Integer.parseInt(aimidx);
		
		List lists=poolStatusDao.getOwnPoolByIdx(ownidx);
		PoolDateDTO dto=(PoolDateDTO)lists.get(0);
		
		PoolMemberStatusDTO memberDto=new PoolMemberStatusDTO(id, addidx);
		
		int count=poolStatusDao.makeMemberStatus(memberDto);
		
		
		
		int mans=dto.getMannum();
		
		PoolMemberStatusDTO memberDto=new PoolMemberStatusDTO(id, aimidx);
		
		PoolMasterStatusDTO masterDto=new PoolMasterStatusDTO(aimidx, "1", id);
		
		ModelAndView mav=new ModelAndView();
	}
	
	@RequestMapping("/reqToMemberPage.do")
	public ModelAndView requestToMemberPage(@RequestParam(value="cp", defaultValue="1")int cp,HttpSession session)
	{
		String id=(String)session.getAttribute("sid");
		int totalCnt=poolStatusDao.getOwnMasterTotalCnt(id);
		int listSize=10;
		int pageSize=5;
		List<PoolDTO> list=poolStatusDao.viewOwnMasterPoolList(cp,listSize,id);
		String pageStr=
			su.Page.SuPage.makePage("poolList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("carpool/poolMasterReqList");
				
		return mav;
	}
	
	@RequestMapping("/reqToMember.do")
	public ModelAndView requestToMember(@RequestParam(value="idx")int idx, @RequestParam(value="memberid")String memberid, HttpSession session)
	{
		String masterid=(String)session.getAttribute("sid");
		int addidx=idx;
		
		int i_mans=poolDao.viewEachContent(addidx).getMannum();
		String mans=""+i_mans;
		
		int i_nowmans=0;
		i_nowmans++;
		String nowmans=""+i_nowmans;
				
		String status="예약 요청 중";
		String members=memberid;
	
		
		PoolMasterStatusDTO dto=new PoolMasterStatusDTO(addidx, masterid, mans, nowmans, status, members);
		
		ModelAndView mav=new ModelAndView();
		
		return mav;
		
	}
	
	@RequestMapping("/ownMemberPoolList")
	public ModelAndView viewOwnMemberPool(@RequestParam(value="cp", defaultValue="1")int cp, HttpSession session)
	{
		String id=(String)session.getAttribute("sid");
		
		int totalCnt=poolStatusDao.getOwnMemberTotalCnt(id);
		int listSize=10;
		int pageSize=5;
		List<PoolDTO> list=poolStatusDao.viewOwnMemberPoolList(cp,listSize,id);
		String pageStr=
			su.Page.SuPage.makePage("poolList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("carpool/poolList");
		return mav;
	}
	
	@RequestMapping("/ownMasterPoolList")
	public ModelAndView viewOwnMasterPool(@RequestParam(value="cp", defaultValue="1")int cp, HttpSession session)
	{
		String id=(String)session.getAttribute("sid");
		
		int totalCnt=poolStatusDao.getOwnMasterTotalCnt(id);
		int listSize=10;
		int pageSize=5;
		List<PoolDTO> list=poolStatusDao.viewOwnMasterPoolList(cp, listSize, id);
		String pageStr=
			su.Page.SuPage.makePage("poolList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("carpool/poolList");
		return mav;
	}
}