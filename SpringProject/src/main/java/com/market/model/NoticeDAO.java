package com.market.model;

import java.util.List;

public interface NoticeDAO {
	public int getListCount(int flag);
	
	public List<NoticeDTO> getNoticeList(PageDTO dto);
	
	public List<NoticeDTO> getHostNoticeList(); 
}