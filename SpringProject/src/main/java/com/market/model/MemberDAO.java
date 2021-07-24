package com.market.model;

import java.util.List;

public interface MemberDAO {

	public int checkEmail(String mem_email);

	public int checkNick(String mem_nick);

	public int loginCheck(String mem_email, String mem_pwd);

	public MemberDTO getMember(String mem_email);

	public int insertMember(MemberDTO dto);

	public int getAllCount();

	public List<MemberDTO> getAllList(PageDTO dto);

	public int getHostCount();

	public List<MemberDTO> getHostList(PageDTO dto);

	public List<MemberDTO> getMemberList(PageDTO dto);

	public int getOutCount();

	public List<MemberDTO> getOutList(PageDTO dto);

	public void updateMemberDel(int[] mem_num);

	public int getSearchCount(String field, String keyword);

	public List<MemberDTO> getSearchMember(PageDTO dto);
}
