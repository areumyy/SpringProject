package com.market.model;

public interface MemberDAO {

	public int checkEmail(String mem_email);
	
	public int checkNick(String mem_nick);

	public int loginCheck(String mem_email, String mem_pwd);
	
	public MemberDTO getMember(String mem_email);
	
	public int insertMember(MemberDTO dto);
}
