package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(int flag) {
		return this.sqlSession.selectOne("notice_list_count", flag);
	}
	
	@Override
	public List<NoticeDTO> getMemberNoticeList(PageDTO dto) {
		return this.sqlSession.selectList("notice_list_member", dto);
	}

	@Override
	public List<NoticeDTO> getHostNoticeList(PageDTO dto) {
		return this.sqlSession.selectList("notice_list_host", dto);
	}
	
	@Override
	public List<NoticeDTO> getHostNoticeList() {
		return this.sqlSession.selectList("host_main_notice");
	}

	@Override
	public int getListAllCount() {
		return this.sqlSession.selectOne("notice_list_all_count");
	}

	@Override
	public List<NoticeDTO> getNoticeAllList(PageDTO dto) {
		return this.sqlSession.selectList("notice_list_all", dto);
	}

	@Override
	public int insertNotice(NoticeDTO dto) {
		return this.sqlSession.insert("notice_insert", dto);
	}

	@Override
	public int deleteNotice(int notice_num) {
		return this.sqlSession.delete("notice_delete", notice_num);
	}

	@Override
	public void updateNoticeNum(int notice_num) {
		this.sqlSession.update("notice_num_update", notice_num);
	}

	@Override
	public NoticeDTO getNoticeCont(int notice_num) {
		return this.sqlSession.selectOne("notice_cont", notice_num);
	}

	@Override
	public int editNotice(NoticeDTO dto) {
		return this.sqlSession.update("notice_edit", dto);
	}


}
