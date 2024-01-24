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
	public MemberVO loginMember(MemberVO vo) throws Exception {
		return memberDAO.loginMember(vo);
	}

	@Override
	public MemberVO selectMemberDetail(String userid) throws Exception {
		return memberDAO.selectMemberDetail(userid);
	}

	@Override
	public int modifyPass(MemberVO vo) throws Exception {
		return memberDAO.modifyPass(vo);
	}

	@Override
	public String modifyPassSave(MemberVO vo) throws Exception {
		return memberDAO.modifyPassSave(vo);
	}

	@Override
	public int updateMember(MemberVO vo) throws Exception {
		return memberDAO.updateMember(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) throws Exception {
		return memberDAO.deleteMember(vo);
	}
	
}
