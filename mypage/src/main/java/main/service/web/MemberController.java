package main.service.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String loginMemeber(MemberVO vo, HttpSession session, ModelMap model) throws Exception {
		
		MemberVO memVO = memberService.loginMember(vo);
		System.out.println(memVO.getName());
		
		String msg = "fail";
		
		model.addAttribute("userVO",memVO);
		if(memVO != null) {
			msg = "ok";
			session.setAttribute("username", memVO.getName());
			session.setAttribute("userid", vo.getUserid());
		}
		
		return msg;
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) throws Exception {
		
		session.removeAttribute("username");
		session.removeAttribute("userid");
		
		return "redirect:main.do";
	}
	
	@RequestMapping("/memberDetail.do")
	public String selectMemberDetail(MemberVO vo, ModelMap model) throws Exception {
		
		MemberVO memberVO = memberService.selectMemberDetail(vo.getUserid());
		
		model.addAttribute("MemberVO",memberVO);
		
		return "member/memberDetail";
	}
	
	@RequestMapping("/checkPass.do")
	public String checkPass() {
		return "member/checkPass";
	}
	
	@RequestMapping("/modifyPass.do")
	@ResponseBody
	public String modifyPass(MemberVO vo) throws Exception {
		
		String msg = "";
		int result = memberService.modifyPass(vo);
		
		if(result == 1) {
			msg = "ok";
		} else {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping("/modifyPassView.do")
	public String modifyPassView() {
		return "member/modifyPassView";
	}
	
	@RequestMapping("/modifyPassSave.do")
	@ResponseBody
	public String modifyPassSave(MemberVO vo) throws Exception {
		
		String result = memberService.modifyPassSave(vo);
		String msg = "";
		System.out.println(result);
		if(result == null) {
			msg = "ok";
		} else {
			msg = "fail";
		}
		System.out.println(msg);
		
		return msg;
	}
	
	@RequestMapping("/memberModifySave.do")
	@ResponseBody
	public String updateMember(MemberVO vo) throws Exception{
		
		int result = memberService.updateMember(vo);
		int cnt = 0;
		if(result == 1) {
			cnt = 1;
		} else {
			cnt = -1;
		}
		
		return cnt + "";
	}
	
	@RequestMapping("/memberDelete.do")
	@ResponseBody
	public String deleteMember(MemberVO vo, HttpSession session) throws Exception {
		
		int result = memberService.deleteMember(vo);
		int cnt = 0;
		
		if(result == 1) {
			cnt = 1;
		} else {
			cnt = -1;
		}
		
		session.removeAttribute("username");
		session.removeAttribute("userid");
		
		return cnt + "";
	}
}
