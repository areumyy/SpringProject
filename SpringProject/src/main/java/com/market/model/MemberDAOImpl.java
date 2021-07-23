package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int checkEmail(String mem_email) {
		return this.sqlSession.selectOne("check_email", mem_email);
	}

	@Override
	public int checkNick(String mem_nick) {
		return this.sqlSession.selectOne("check_nick", mem_nick);
	}

	@Override
	public int loginCheck(String mem_email, String mem_pwd) {
		int result = 0;
		int check = this.sqlSession.selectOne("check_email", mem_email);

		if (check > 0) { // 입력한 아이디가 있는 경우
			String db_pwd = this.sqlSession.selectOne("pwd_find", mem_email);

			if (db_pwd.equals(mem_pwd)) { // 아이디와 비밀번호 일치
				result = 1;
			} else { // 아이디와 비밀번호 불일치
				result = 2;
			}
		} else { // 입력한 아이디가 없는 경우
			result = -1;
		}
		return result;
	}

	@Override
	public MemberDTO getMember(String mem_email) {
		return this.sqlSession.selectOne("get_login_member", mem_email);
	}

	@Override
	public int insertMember(MemberDTO dto) {
		return this.sqlSession.insert("insert_member", dto);
	}

	@Override
	public int getAllCount() {
		return this.sqlSession.selectOne("count_all");
	}

	@Override
	public List<MemberDTO> getAllList(PageDTO dto) {
		return this.sqlSession.selectList("list_all", dto);
	}

	@Override
	public int getHostCount() {
		return this.sqlSession.selectOne("count_host");
	}

	@Override
	public List<MemberDTO> getHostList(PageDTO dto) {
		return this.sqlSession.selectList("list_host", dto);
	}

	@Override
	public List<MemberDTO> getMemberList(PageDTO dto) {
		return this.sqlSession.selectList("list_member", dto);
	}

	@Override
	public int getOutCount() {
		return this.sqlSession.selectOne("count_out");
	}

	@Override
	public List<MemberDTO> getOutList(PageDTO dto) {
		return this.sqlSession.selectList("list_out", dto);
	}

	@Override
	public void updateMemberDel(int[] mem_num) {
		for (int i = 0; i < mem_num.length; i++) {
			int target = mem_num[i];
			this.sqlSession.update("update_del", target);
		}
	}

	@Override
	public int getSearchCount(String field, String keyword) {
		return this.sqlSession.selectOne("count_" + field, keyword);
	}

	@Override
	public List<MemberDTO> getSearchMember(PageDTO dto) {
		return this.sqlSession.selectList("list_" + dto.getField(), dto);
	}
}
