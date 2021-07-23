package com.market.model;

import java.util.List;

public interface NoticeDAO {
	public int getListCount(int flag);

	public List<NoticeDTO> getMemberNoticeList(PageDTO dto);

	public List<NoticeDTO> getHostNoticeList(PageDTO dto);

	public int getListAllCount();

	public List<NoticeDTO> getNoticeAllList(PageDTO dto);

	public int insertNotice(NoticeDTO dto);

	public int deleteNotice(int notice_num);

	public void updateNoticeNum(int notice_num);

	public NoticeDTO getNoticeCont(int notice_num);
	
	public int editNotice(NoticeDTO dto);
	
	public List<NoticeDTO> getHostNoticeList();
}