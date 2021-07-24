package com.market.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface LikeDAO {

	// ---------------- 찜한 클래스/호스트별 정보 ------------------------------------------------
	// like_frip.jsp
	public List<ClassDTO> getLikeClassList(int mem_num);					// 찜 클래스 목록 (장소/해시태그/제목/이미지)
	// public List<ClassDTO> getLikeClassList(HashMap<String, Object> map);	// 찜 클래스 목록 (장소/해시태그/제목/이미지)
	public List<OptionDTO> getOption(int mem_num);							// 찜 클래스 별 옵션 상세정보 (가격)
	public List<Integer> class_score(int mem_num);							// 찜 클래스 별 별점
	// public int classList_count(int mem_num);								// 찜 클래스 개수
	
	// like_host.jsp
	public List<HostDTO> getLikeHostList(int mem_num);						// 찜 호스트 목록 
	public List<MemberDTO> getHostInfo(int mem_num);						// 찜 호스트 별 상세정보 (이름/프로필)
	public List<Integer> host_classCount(int mem_num );						// 찜 호스트가 운영하는 클래스 개수
	public List<Integer> host_reivewCount(int mem_num);						// 찜 호스트 후기 개수
	public List<Integer> host_likeCount(int mem_num);						// 찜 호스트 찜 개수
	
	// ---------------- 찜X, 선택한 호스트 상세정보 ------------------------------------------------
	// host_info.jsp
	public MemberDTO hostInfo(int host_memNum);								// 호스트 상세정보 (이름/프로필)
	public HostDTO hostCont(int host_memNum);								// 호스트 소개(소개내용)
	public int class_count(int host_memNum);								// 호스트가 운영하는 클래스 개수
	public int review_count(int host_memNum);								// 호스트 후기 개수
	public int like_count(int host_memNum);									// 호스트 찜 개수
	
	// 프립 탭
	public List<ClassDTO> host_classList(int host_memNum);					// 호스트가 운영하는 클래스 목록 
	public List<OptionDTO> host_classOption(int host_memNum);				// 호스트가 운영하는 클래스 옵션 상세정보 (가격)
	public List<Integer> host_class_score(int host_memNum);					// 호스트가 운영하는 클래스 별 별점
	
	// 후기 탭
	public List<ReviewDTO> class_review1(int host_memNum);					// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드1 (회원이름/회원프로필/리뷰내용/리뷰작성일)
	public List<ReviewDTO> class_review2(int host_memNum);					// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명)
	public List<ReviewDTO> class_review3(int host_memNum);					// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명/시작날짜/끝날짜)
	public int review_status(HashMap<String, Integer> map);					// 좋아요 상태
	public List<Integer> review_like_list(HashMap<String, Integer> map);	// 좋아요 누른 리뷰 리스트
	public int review_like_plus(int review_no);								// 리뷰 좋아요
	public int review_like_add(HashMap<String, Integer> map);				// 좋아요 DB 추가
	public int review_like_minus(int review_no);							// 리뷰 싫어요
	public int review_like_del(HashMap<String, Integer> map);				// 좋아요 DB 삭제
	public int review_like_count(int review_no);							// 좋아요 개수
	
	
	
	
	
	
	
}