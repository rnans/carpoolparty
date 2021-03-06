package su.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import su.adminMember.model.AdminCarInfoDAO;
import su.adminMember.model.AdminCarInfoDTO;
import su.adminMember.model.AdminMemberDAO;
import su.adminMember.model.AdminMemberDTO;
import su.mypage.model.MyAlarmDTO;
import su.upload.model.UploadDTO;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberDAO adMemberDao;
	
	@Autowired
	private AdminCarInfoDAO adCarInfoDao;
	
	public AdminMemberDAO getAdMemberDao() {
		return adMemberDao;
	}

	public void setAdMemberDao(AdminMemberDAO adMemberDao) {
		this.adMemberDao = adMemberDao;
	}
	
	public AdminCarInfoDAO getAdCarInfoDao() {
		return adCarInfoDao;
	}

	public void setAdCarInfoDao(AdminCarInfoDAO adCarInfoDao) {
		this.adCarInfoDao = adCarInfoDao;
	}
	
	/**회원 검색 아작스처리*/
	@RequestMapping("/memberSearch.do")
	public ModelAndView memberSearchList(@RequestParam(value="cp",defaultValue="1")int cp,HttpServletRequest req){
		
		String select=req.getParameter("select");
		String search=req.getParameter("search");
    	ModelAndView mav=new ModelAndView();
		int idTotalCnt=adMemberDao.memberIdTotalCnt(search);
		int nameTotalCnt=adMemberDao.memberNameTotalCnt(search);
		int sexTotalCnt=adMemberDao.memberSexTotalCnt(search);
		int listSize=15;
		int pageSize=5;
		if(select.equals("id")){
		List<AdminMemberDTO> list=adMemberDao.memberIdSearch(cp, listSize, search);
		
		String pageStr=
				su.Page.SuPage.makePage("memberSearch.do", idTotalCnt, listSize, pageSize, cp);
		mav.addObject("lists", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("admin/memberSearch");
		}else if(select.equals("name")){
			List<AdminMemberDTO> list=adMemberDao.memberNameSearch(cp,listSize,search);
			
			String pageStr=
					su.Page.SuPage.makePage("memberSearch.do", nameTotalCnt, listSize, pageSize, cp);
			mav.addObject("lists", list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("admin/memberSearch");
			
		}else if(select.equals("sex")){
			List<AdminMemberDTO> list=adMemberDao.memberSexSearch(cp,listSize,search);
			
			String pageStr=
					su.Page.SuPage.makePage("memberSearch.do", sexTotalCnt, listSize, pageSize, cp);
			mav.addObject("lists", list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("admin/memberSearch");
		}
		
		
		  return mav;
    }

	/**모든 회원 보기*/
	@RequestMapping("/memberInfo.do")
	public ModelAndView memberInfo(@RequestParam(value="cp", defaultValue="1")int cp){
		
		int totalCnt = adMemberDao.memberTotalCnt();
		int listSize = 15;
		int pageSize = 5;
		
		ModelAndView mav = new ModelAndView();
		List<AdminMemberDTO> list = adMemberDao.memberinfo(cp, listSize);
		String pageStr = su.Page.SuPage.makePage("memberInfo.do", totalCnt, listSize, pageSize, cp);
		mav.addObject("lists", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("admin/memberInfo");
		return mav;
	}

	/**회원삭제*/
	@RequestMapping("/memberDel.do")
	public ModelAndView memberDel(@RequestParam("idx")int idx){
		
		ModelAndView mav = new ModelAndView();
		int count = adMemberDao.memberDel(idx);
		
		String result=count>0?"회원삭제성공":"회원삭제실패";
		mav.addObject("msg", result);
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	
	/**grade 변경*/
	@RequestMapping("/adminAdd.do")
	public ModelAndView adminAdd(@RequestParam(value="idx", required=false)int idx,
			@RequestParam(value="grade", required=false)String grade){
		
		ModelAndView mav = new ModelAndView();
		int count = adMemberDao.adminAdd(idx, grade);
		
		String result = count>0?"등급 변경 성공":"등급 변경 실패";
		mav.addObject("msg", result);
		mav.setViewName("admin/adminMsg");
		
		return mav;
	}
	
	////////////////////////////////////////////등록된 차 관리/////////////////////////////////////////////////
	/**등록된 차 목록보기*/
	@RequestMapping("memberCarInfo.do")
	public ModelAndView memberCarInfo(@RequestParam(value="cp", defaultValue="1")int cp){
		int totalCnt = adCarInfoDao.carInfoTotalCnt();
		int listSize = 20;
		int pageSize = 5;
		
		List<AdminCarInfoDTO> list = adCarInfoDao.memberCarInfo(cp, listSize);
		String pageStr = su.Page.SuPage.makePage("memberCarInfo.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", list);
		
		mav.setViewName("admin/memberCarInfo");
		
		return mav;
	}

	/**등록된 차정보 삭제*/
	@RequestMapping("/memberCarDel.do")
	public ModelAndView memberCarDel(@RequestParam("idx")int idx){
		
		int count = adCarInfoDao.memberCarDel(idx);
		String msg = count>0?"차량 정보 삭제 성공!":"차량 정보 삭제 실패!"; 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");
		
		return mav;
	}

	/**회원 차 승인*/
	@RequestMapping("/memberCarOk.do")
	public ModelAndView memberCarOk(@RequestParam(value="idx",required=false)int idx, 
			@RequestParam(value="confirm",required=false)String confirm){
		
		
		int result = adCarInfoDao.memberCarOk(idx, confirm);
		String msg = result>0?"처리완료!":"처리실패!";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");
		
		return mav;
	}
	
	/**인증사진보기*/
	@RequestMapping("/memberCarPhoto.do")
	public ModelAndView memberCarPhoto(@RequestParam(value="id",required=false)String id){
		List<UploadDTO> list = adCarInfoDao.memberCarPhoto(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", list);
		mav.setViewName("admin/carPhoto");
		
		return mav;
	}
	///////////////////////////////////회원 알림 관리/////////////////////////////////////////
	@RequestMapping(value="memberAlarm.do", method=RequestMethod.GET)
	public ModelAndView memberAlarm(@RequestParam(value="cp", defaultValue="1")int cp){
		
		int totalCnt = adMemberDao.alarmTotalCnt();
		int listSize = 20;
		int pageSize = 5;
		
		List<MyAlarmDTO> list = adMemberDao.memberAlarm(cp, listSize);
		String pageStr = su.Page.SuPage.makePage("memberAlarm.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", list);
		
		mav.setViewName("admin/memberAlarm");
		
		return mav;
	}
}
