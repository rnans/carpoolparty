package su.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import su.adminReserve.model.AdminPoolMasterStatusDTO;
import su.adminReserve.model.AdminPoolMemberStatusDTO;
import su.adminReserve.model.AdminPoolStatusDAO;
import su.member.model.MemberDTO;
import su.pool.model.PoolDAO;
import su.pool.model.PoolDTO;
import su.pool.model.PoolRateAvgDTO;
import su.pool.model.PoolRateDAO;
import su.pool.model.PoolStatusDAO;

@Controller
public class AdminReserveController {
	@Autowired
	private PoolStatusDAO poolStatusDao;
	
	public PoolStatusDAO getPoolStatusDao() {
		return poolStatusDao;
	}
	public void setPoolStatusDao(PoolStatusDAO poolStatusDao) {
		this.poolStatusDao = poolStatusDao;
	}
	@Autowired
	private AdminPoolStatusDAO adminPoolStatusDao;
	
	public AdminPoolStatusDAO getAdminPoolStatusDao() {
		return adminPoolStatusDao;
	}
	public void setAdminPoolStatusDao(AdminPoolStatusDAO adminPoolStatusDao) {
		this.adminPoolStatusDao = adminPoolStatusDao;
	}
	@Autowired
	private PoolDAO poolDao;
	public PoolDAO getPoolDao() {
		return poolDao;
	}
	public void setPoolDao(PoolDAO poolDao) {
		this.poolDao = poolDao;
	}
	@Autowired
	private PoolRateDAO poolRateDao;
	public PoolRateDAO getPoolRateDao() {
		return poolRateDao;
	}
	public void setPoolRateDao(PoolRateDAO poolRateDao) {
		this.poolRateDao = poolRateDao;
	}
	//드라이버 예약관련 리스트
	@RequestMapping("/driverReserveList.do")
   public ModelAndView AdminPoolDriverList(@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt=adminPoolStatusDao.adminPoolDriverTotalCnt();
		int listSize=10;
		int pageSize=5;
		List<AdminPoolMasterStatusDTO> list=adminPoolStatusDao.adminPoolDriverList(cp, listSize);
		String pageStr=
			su.Page.SuPage.makePage("driverReserveList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("admin/driverReserveAdmin");
		return mav;
	}
	//드라이버 예약 글취소

	@RequestMapping("/adminDriverReserveDel.do")
	public ModelAndView adminDriverReserveDel_ok(int idx){
		
		int result=adminPoolStatusDao.adminDriverReserveDel(idx);
		String msg = result>0?"삭제성공!":"삭제실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	//드라이버 예약 등록된게시물 보기

	@RequestMapping("/adminAimidxContent.do")
	public ModelAndView adminAimidxContent(@RequestParam(value="idx")int idx){
PoolDTO dto=poolDao.viewEachContent(idx);
		
		List res=poolRateDao.getListByAimid(dto.getUserid());

		MemberDTO mDTO=poolDao.getAllUserInfo(dto.getUserid());
		
		int pCount=poolStatusDao.getOwnPoolCount(dto.getUserid());
		
		PoolRateAvgDTO avgDTO=new PoolRateAvgDTO();
		
		ModelAndView mav=new ModelAndView();
		
		if(res.isEmpty())
		{
			mav.addObject("msg","등록된 평가가 없습니다.");
		}
		else
		{
			mav.addObject("rDtos",res);
			avgDTO=poolRateDao.getAvrRateByAimid(dto.getUserid());
		}
		
		
		mav.addObject("dto",dto);
		mav.addObject("mDTO",mDTO);
		mav.addObject("pCount",pCount);
		mav.addObject("avg",avgDTO);

		
		mav.setViewName("carpool/poolEachContent");
		
		return mav;
	}
	
	@RequestMapping("/adminDriverReserveSearch.do")
	public ModelAndView adminDriverReserveSearch(@RequestParam(value="cp",defaultValue="1")int cp,HttpServletRequest req){
		String select=req.getParameter("select");
		String search=req.getParameter("search");
		ModelAndView mav=new ModelAndView();
		int totalCnt=0;
		int listSize=10;
		int pageSize=5;
		if(select.equals("masterid")){
			List<AdminPoolMasterStatusDTO> list=adminPoolStatusDao.adminDriveIdrList(cp, listSize, search);
			mav.addObject("list", list);
		}else if(select.equals("aimidx")){
			List<AdminPoolMasterStatusDTO> list=adminPoolStatusDao.adminDriveAimidxrList(cp,listSize, search);
			mav.addObject("list", list);
		}else if(select.equals("status")){
			List<AdminPoolMasterStatusDTO> list=adminPoolStatusDao.adminDriveStatusrList(cp, listSize, search);
			mav.addObject("list", list);
		}
		String pageStr=
			su.Page.SuPage.makePage("adminDriverReserveSearch.do", totalCnt, listSize, pageSize, cp);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("admin/driverReserveSearch");
		return mav;
		
	}
	//사용자 예약 리스트
	@RequestMapping("/memberReserveList.do")
	public ModelAndView memberReserveList(@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt=adminPoolStatusDao.adminPoolMemberTotlCnt();
		int listSize=10;
		int pageSize=5;
		List<AdminPoolMemberStatusDTO> list=adminPoolStatusDao.adminPoolMemberList(cp, listSize);
		String pageStr=
			su.Page.SuPage.makePage("memberReserveList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("admin/memberReserveAdmin");
		return mav;
	}
	//드라이버 예약 글취소
	
	@RequestMapping("/adminMemberReserveDel.do")
	public ModelAndView adminMemberReserveDel_ok(int idx){
		
		int result=adminPoolStatusDao.adminMemberReserveDel(idx);
		String msg = result>0?"삭제성공!":"삭제실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("admin/adminMsg");
		return mav;
	}
}
