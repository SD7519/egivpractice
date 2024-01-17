package main.service.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/register.do")
	public String memberRegister() {
		return "member/register";
	}
	
	@RequestMapping(value = "/registerWrite.do")
	@ResponseBody
	public String registerWrite(MemberVO vo) throws Exception{
		
//		System.out.println(vo.getUsesrid());
//		System.out.println(vo.getUsesrpass());
//		System.out.println(vo.getEmailh());
//		System.out.println(vo.getEmailt());
//		System.out.println(vo.getEmail());
//		System.out.println(vo.getName());
//		System.out.println(vo.getBirth());
//		System.out.println(vo.getPhonenum());
		
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
}
