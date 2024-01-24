package main.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import main.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember", vo);
	}

	public MemberVO loginMember(MemberVO vo) {
		return (MemberVO) select("memberDAO.loginMember", vo);
	}

	public MemberVO selectMemberDetail(String userid) {
		return (MemberVO) select("memberDAO.selectMemberDetail", userid);
	}

	public int modifyPass(MemberVO vo) {
		return (int) select("memberDAO.modifyPass", vo);
	}

	public String modifyPassSave(MemberVO vo) {
		return (String) select("memberDAO.modifyPassSave", vo);
	}

	public int updateMember(MemberVO vo) {
		return update("memberDAO.updateMember", vo);
	}

	public int deleteMember(MemberVO vo) {
		return delete("memberDAO.deleteMember", vo);
	}

}

