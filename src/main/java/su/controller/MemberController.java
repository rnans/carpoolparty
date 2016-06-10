package su.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import su.member.model.MemberDAO;
import su.member.model.MemberDTO;
import su.message.model.MessageDAO;
import su.status.model.StatusDAO;
import su.status.model.StatusDTO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDao;

	public MemberDAO getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	@Autowired
	public MessageDAO messageDao;
	
	public MessageDAO getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDAO messageDao) {
		this.messageDao = messageDao;
	}

	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public String memberJoinForm(){
		
		return "member/memberJoin";
	}
	
	@Autowired
	private StatusDAO statusDao;
	public StatusDAO getStatusDao() {
		return statusDao;
	}

	public void setStatusDao(StatusDAO statusDao) {
		this.statusDao = statusDao;
	}

	/**회원가입*/
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO dto){
		
		ModelAndView mav = new ModelAndView();
		
		int result = memberDao.memberJoin(dto);
		
		String msg = result>0?"카풀서비스 가입에 성공하셨습니다.":"회원가입에 실패하셨습니다.";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", "index.do");
		mav.setViewName("member/memberMsg");
		
		return mav;
		
		
	}
	/**로그인 폼 이동 및 아이디 기억하기*/
	@RequestMapping("/loginForm.do")
	public String loginForm(){
		
		return "member/memberLogin";
	}
	
	/**로그인*/
	@RequestMapping(value="/login.do", method={RequestMethod.GET, RequestMethod.POST})

	public ModelAndView login(@RequestParam(value="id", required=false)String id, 
			StatusDTO sDTO,
			@RequestParam(value="pwd", required=false)String pwd, HttpSession session){
			
		ModelAndView mav = new ModelAndView();
		int result = memberDao.login(id, pwd);
		
		if(result==1){
			List<MemberDTO> dto= memberDao.getUserInfo(id);
			String name = dto.get(0).getName();
			String grade = dto.get(0).getGrade();
			
			session.setAttribute("sname", name);
			session.setAttribute("sid", id);
			session.setAttribute("grade", grade);
			
			sDTO.setUserid(id);
			String userid = (String)session.getAttribute("sid");
			
			int messageNumber=messageDao.messageNumber(userid);
			session.setAttribute("mNum", messageNumber);
			
			int check=statusDao.logincheck(userid);
			if(check==0){
			int count = statusDao.loginStatus(sDTO);
			if(count>0)System.out.println(userid+"님이 로그인");
			}
			
			mav.addObject("name", name);
			mav.setViewName("member/login_ok");
		}else{
			mav.addObject("msg", "아이디가 없거나 비밀번호가 잘못되었습니다.");
			mav.addObject("loc", "loginForm.do");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
	
	/**중복검사*/
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public ModelAndView idCheck(@RequestParam(value="id", required=false) String id){
		
		ModelAndView mav = new ModelAndView();
		
		boolean result = memberDao.idCheck(id);
		
		if(id==null || id.equals("")){
			mav.addObject("msg", "ID를 입력해 주세요.");
			mav.setViewName("member/ajaxMsg");
		}

		for(int i=0;i<id.length();i++){
		char id_s=id.charAt(i);
		
		if(result){	
			mav.addObject("msg", "중복된 ID입니다.");
		}else if((!(id_s>='0' && id_s<='9') && !(id_s>='a' && id_s<='z'))){	
			mav.addObject("msg", "소문자와 숫자로만 아이디를 사용해 주세요.");
		}else if(id.length()<5||id.length()>=12){
			mav.addObject("msg", "5글자에서 12글자 사이로 입력해주세요.");
		}else{
			mav.addObject("msg", "사용 가능한 ID 입니다.");
		}
		}
		mav.setViewName("member/ajaxMsg");
		return mav;
	}
	
	/**로그아웃*/
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		
		
		String userid = (String)session.getAttribute("sid");
		session.invalidate();
		int count = statusDao.loginDel(userid);
		
		return "redirect:/index.do";
	}
	
	/**아이디 찾기 폼이동*/
	@RequestMapping("/idFindForm.do")
	public String idFindForm(){
		return "member/idFind";
	}
	
	/**아이디 찾기*/
	@RequestMapping(value="/idFind.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView idFind(@RequestParam(value="name", required=false)String name, 
			@RequestParam(value="phonenum", required=false)String phonenum){
		ModelAndView mav = new ModelAndView();
		String id = memberDao.idFind(name, phonenum);
		
		if(id==null){
			mav.addObject("msg", "이름 및 전화번호를 제대로 입력해주세요.");
			mav.addObject("loc", "idFind.do");
			mav.setViewName("member/memberMsg");
		}else{
			mav.addObject("msg", "회원님의 ID는 "+id+"입니다.");
			mav.addObject("status", "1");
			mav.addObject("loc", "index.do");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
	
	/**비밀번호 찾기 폼이동*/
	@RequestMapping("/pwFindForm.do")
	public String pwFindForm(){
		return "member/pwFind";
	}
	
	/**비밀번호 찾기*/
	@RequestMapping(value="/pwFind.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView pwFind(@RequestParam(value="id", required=false)String id,
			@RequestParam(value="phonenum", required=false)String phonenum){
		
		ModelAndView mav = new ModelAndView();
		String pwd = memberDao.pwFind(id, phonenum);
		
		if(pwd==null){
			mav.addObject("msg", "아이디 및 전화번호를 제대로 입력해주세요.");
			mav.addObject("loc", "pwFind.do");
			mav.setViewName("member/memberMsg");
		}else{
			mav.addObject("msg", "회원님의 비밀번호는 "+pwd+"입니다."	);
			mav.addObject("loc", "login.do");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
	
	/**현재접속인원 수 파악*/
	
	@RequestMapping("/memberList.do")
	public ModelAndView numStatus(){
		
		int count = statusDao.numStatus();
	
		List<StatusDTO> list = statusDao.listStatus();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count",count);
		mav.addObject("lists",list);
		mav.setViewName("memberList");
		return mav;
	}
}
