package com.market.model;

import java.util.List;

public interface LikeDAO {

	// ---------------- 찜한 클래스/호스트별 정보 ------------------------------------------------
	// like_frip.jsp
	public List<ClassDTO> getLikeClassList(int mem_num);		// 찜 클래스 목록 (장소/해시태그/제목/이미지)
	public List<OptionDTO> getOption(int mem_num);				// 찜 클래스 별 옵션 상세정보 (가격)
	public List<Integer> class_score(int mem_num);			// 찜 클래스 별 별점
	
	// like_host.jsp
	public List<HostDTO> getLikeHostList(int mem_num);			// 찜 호스트 목록 
	public List<MemberDTO> getHostInfo(int mem_num);			// 찜 호스트 별 상세정보 (이름/프로필)
	public List<Integer> host_classCount(int mem_num );			// 찜 호스트가 운영하는 클래스 개수
	public List<Integer> host_reivewCount(int mem_num);			// 찜 호스트 후기 개수
	public List<Integer> host_likeCount(int mem_num);			// 찜 호스트 찜 개수
	
	// ---------------- 찜X, 선택한 호스트 상세정보 ------------------------------------------------
	// host_info.jsp
	public MemberDTO hostInfo(int host_memNum);					// 호스트 상세정보 (이름/프로필)
	public HostDTO hostCont(int host_memNum);					// 호스트 소개(소개내용)
	public int class_count(int host_memNum);					// 호스트가 운영하는 클래스 개수
	public int review_count(int host_memNum);					// 호스트 후기 개수
	public int like_count(int host_memNum);						// 호스트 찜 개수
	
	// 프립 탭
	public List<ClassDTO> host_classList(int host_memNum);		// 호스트가 운영하는 클래스 목록 
	public List<OptionDTO> host_classOption(int host_memNum);	// 호스트가 운영하는 클래스 옵션 상세정보 (가격)
	
	// 후기 탭
	public List<ReviewDTO> class_review1(int host_memNum);		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드1 (회원이름/회원프로필/리뷰내용/리뷰작성일)
	public List<ReviewDTO> class_review2(int host_memNum);		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명)
	public List<ReviewDTO> class_review3(int host_memNum);		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명/시작날짜/끝날짜)
	
}