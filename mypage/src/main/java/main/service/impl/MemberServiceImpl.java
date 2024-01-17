package main.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name = "memberDAO")
	public MemberDAO memberDAO;

	@Override
	public String registerWrite(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}

	@Override
	public int loginMember(MemberVO vo) throws Exception {
		return memberDAO.loginMember(vo);
	}
	
}
