package main.service;

public interface MemberService {
	
	public String registerWrite(MemberVO vo) throws Exception;
	public int loginMember(MemberVO vo) throws Exception;
}
