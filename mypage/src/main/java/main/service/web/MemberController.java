package main.service.web;

import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/main.do")
	public String main() {
		return "index";
	}
	
	@RequestMapping(value = "/login.do")
	public String login() {
		return "member/login";
	}
	
	
	@RequestMapping(value = "/register.do")
	public String memberRegister() {
		return "member/register";
	}
	
	@RequestMapping(value = "/registerWrite.do")
	@ResponseBody
	public String registerWrite(MemberVO vo) throws Exception{
		
		switch(vo.getEmailt()) {
			case "naver" : vo.setEmailt("naver.com"); break;
			case "google" : vo.setEmailt("google.com"); break;
			case "daum" : vo.setEmailt("daum.net"); break;
		}
		
		vo.setEmail(vo.getEmailh() + '@' + vo.getEmailt());
		
		String result = memberService.registerWrite(vo);
		String msg;
		if(result == null) {
			msg="ok";
		} else {
			msg="fail";
		}
		return msg;
	}
	
	@RequestMapping(value = "loginMember.do")
	@ResponseBody
	public String loginMemeber(MemberVO vo, HttpSession session) throws Exception {
		

		int result = memberService.loginMember(vo);
		
		String msg;
		
		if(result == 1) {
			msg = "ok";
			session.setAttribute("userid", vo.getUserid());
			System.out.println(vo.getName());
		} else {
			msg ="fail";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) throws Exception {
		
		session.removeAttribute("userid");
		
		return "redirect:main.do";
	}
	
	@RequestMapping("/test.do")
	public String test() {
		return "board/test";
	}
}
