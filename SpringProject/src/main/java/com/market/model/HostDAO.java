package com.market.model;

public interface HostDAO {

	public int insertHost(HostDTO dto);
	public HostDTO getInfo_memnum(int mem_num);
	public int updateHostInfo(HostDTO dto);
}
