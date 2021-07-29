package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {

	public int checkEmail(String mem_email);

	public int checkNick(String mem_nick);

	public int loginCheck(String mem_email, String mem_pwd);

	public MemberDTO getMember(String mem_email);
	
	public MemberDTO getMember(int mem_num);
	
	public int insertMember(MemberDTO dto);
	
	public int updateMember(MemberDTO dto);

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
	
	public void changeHost(int mem_num);
	
	public void usePoint(HashMap<String, Integer> map);
	
	public void addPoint(HashMap<String, Integer> map);
	
	public int getMember_memNick(String mem_nick);
	
	public int updateInfo(MemberDTO dto);
	
}
