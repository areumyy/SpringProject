package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface BookingDAO {
	public int getCount(int class_num);
	public List<BookingDTO> getList(HashMap<String, Object> map);
	public int entercheck(int booking_num);
	public int entercancel(int booking_num);
	public int getcount_option_num(int option_num);
	public int getCountEnter(int class_num);
	public int getcount_memnum(int mem_num); // 전체 신청완료
	
	public List<BookingDTO> getBookingWorks(int booking_writer);
	public int getCountWorks(int booking_writer);
	public void insertBooking(BookingDTO dto);

}
