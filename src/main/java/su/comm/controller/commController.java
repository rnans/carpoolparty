package su.comm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import su.comm.model.commBBSDTO;
import su.comm.model.commDAO;
import su.comm.model.scheDTO;

import java.util.*;

import javax.servlet.http.HttpSession;


@Controller
public class commController {
	
	
	@Autowired
	private commDAO commDao;			
	public commDAO getCommDao() {
		return commDao;
	}
	public void setCommDao(commDAO commDao) {
		this.commDao = commDao;
	}

	@RequestMapping("comm.do")
	public ModelAndView comm(HttpSession session){
		ModelAndView mav=new ModelAndView();		
		String sid=(String)session.getAttribute("sid");
		String commid=(String)session.getAttribute("commid");
		if(sid==null||sid.equals("")){
            String msg="로그인후 이용 바랍니다.";
            mav.addObject("msg", msg);
            mav.setViewName("csCenter/oneandonefailMsg");
          return mav;
		
		
//			}else if(commid==null||commid.equals("")){
//		   String msg="가입된 커뮤니티가 없습니다.";
//           mav.addObject("msg", msg);
//           mav.setViewName("csCenter/oneandonefailMsg");
//           return mav; 
		}else{			
			List<commBBSDTO> list=commDao.bbsList();			
			mav.addObject("list", list);
			mav.setViewName("comm/comm");
			return mav;
		}
		
		
	}
	
	@RequestMapping("commmsg.do")
	public String commmsg(){
		
		return "comm/commmsg";
		
	}	
	
	@RequestMapping("commWrite.do")
	public ModelAndView commWrite(commBBSDTO dto){					
		
		int count=commDao.commWrite(dto);
		
		String msg=count>0?"글 작성 성공":"글 작성 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commmsg");
		return mav;
		
	}
	
	@RequestMapping("calendar.do")
	public ModelAndView calendar(){
		ModelAndView mav=new ModelAndView();
		List<scheDTO> list=commDao.scheList();			
		mav.addObject("list", list);
		mav.setViewName("comm/calendar");
		return mav;
		
	}	
	
	@RequestMapping("scheWrite.do")
	public String scheWritego(){
		return "comm/scheWrite";
	}
	
	@RequestMapping(value="scheWrite.do", method=RequestMethod.POST)
	public ModelAndView scheWrite(scheDTO dto){
		
		int count=commDao.scheWrite(dto);
		String msg=count>0?"글 작성 성공":"글 작성 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commmsg");
		return mav;
		
	}
	
	@RequestMapping("commMember.do")
	public ModelAndView commMember(){
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("comm/commMember");
		return mav;
		
	}

}
