package com.market.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAOImpl implements LikeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 찜 클래스 목록 (장소/해시태그/제목/이미지) 
	@Override
	public List<ClassDTO> getLikeClassList(int mem_num) {
		
		return this.sqlSession.selectList("likeClass", mem_num);
	}

	// 찜 클래스 별 옵션 상세정보 (가격)
	@Override
	public List<OptionDTO> getOption(int class_num) {
		
		return this.sqlSession.selectList("option_cont", class_num);
	}
	
	// 찜 클래스 별 별점
	@Override
	public List<Integer> class_score(int mem_num) {
		
		return this.sqlSession.selectList("class_score", mem_num);
	}
	
	// 찜 클래스 개수
	/*
	 * @Override public int classList_count(int mem_num) {
	 * 
	 * return this.sqlSession.selectOne("classList_count", mem_num); }
	 */

	// 찜 호스트 목록 
	@Override
	public List<HostDTO> getLikeHostList(int mem_num) {
		
		return this.sqlSession.selectList("likeHost", mem_num);
	}

	// 찜 호스트 별 상세정보 (이름/프로필)
	@Override
	public List<MemberDTO> getHostInfo(int mem_num) {
		
		return this.sqlSession.selectList("likeHostInfo", mem_num);
	}

	// 찜 호스트가 운영하는 클래스 개수
	@Override
	public List<Integer> host_classCount(int mem_num) {
		
		return this.sqlSession.selectList("like_classCount", mem_num);
	}

	// 찜 호스트 후기 개수
	@Override
	public List<Integer> host_reivewCount(int mem_num) {
		
		return this.sqlSession.selectList("like_reviewCount", mem_num);
	}
	
	// 찜 호스트 찜 개수
	@Override
	public List<Integer> host_likeCount(int mem_num) {
		
		return this.sqlSession.selectList("like_likeCount", mem_num);
	}

	// 호스트 상세정보 (이름/프로필)
	@Override
	public MemberDTO hostInfo(int host_memNum) {
		
		return this.sqlSession.selectOne("hosfInfo", host_memNum);
	}
	
	// 호스트 소개(소개내용)
	@Override
	public HostDTO hostCont(int host_memNum) {
		
		return this.sqlSession.selectOne("hostContent", host_memNum);
	}

	// 호스트가 운영하는 클래스 개수
	@Override
	public int class_count(int host_memNum) {
		
		return this.sqlSession.selectOne("classCount", host_memNum);
	}

	// 호스트 후기 개수
	@Override
	public int review_count(int host_memNum) {
		
		return this.sqlSession.selectOne("reviewCount", host_memNum);
	}

	// 호스트 찜 개수
	@Override
	public int like_count(int host_memNum) {
		
		return this.sqlSession.selectOne("likeCount", host_memNum);
	}

	// 호스트가 운영하는 클래스 목록 
	@Override
	public List<ClassDTO> host_classList(int host_memNum) {
		
		return this.sqlSession.selectList("hostClass", host_memNum);
	}

	// 호스트가 운영하는 클래스 옵션 상세정보 (가격)
	@Override
	public List<OptionDTO> host_classOption(int host_memNum) {
		
		return this.sqlSession.selectList("hostClassOption", host_memNum);
	}
	
	// 호스트가 운영하는 클래스 별 별점
	@Override
	public List<Integer> host_class_score(int host_memNum) {
		
		return this.sqlSession.selectList("hostClassScore", host_memNum);
	}

	// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드1 (회원이름/회원프로필/리뷰내용/리뷰작성일)
	@Override
	public List<ReviewDTO> class_review1(int host_memNum) {
		
		return this.sqlSession.selectList("classReview1", host_memNum);
	}

	// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명)
	@Override
	public List<ReviewDTO> class_review2(int host_memNum) {
		
		return this.sqlSession.selectList("classReview2", host_memNum);
	}

	// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명/시작날짜/끝날짜)
	@Override
	public List<ReviewDTO> class_review3(int host_memNum) {
		
		return this.sqlSession.selectList("classReview3", host_memNum);
	}
	
	// 좋아요 상태
	@Override
	public int review_status(HashMap<String, Integer> map) {
		
		return this.sqlSession.selectOne("review_status", map);
	}
	
	// 좋아요 누른 리뷰 리스트
	@Override
	public List<Integer> review_like_list(HashMap<String, Integer> map) {
		
		return this.sqlSession.selectList("review_like_list", map);
	}

	// 리뷰 좋아요
	@Override
	public int review_like_plus(int review_no) {
		
		return this.sqlSession.update("review_like_plus", review_no);
	}
	
	// 리뷰 싫어요
	@Override
	public int review_like_minus(int review_no) {
		
		return this.sqlSession.update("review_like_minus", review_no);
	}

	// 좋아요 DB 삭제
	@Override
	public int review_like_del(HashMap<String, Integer> map) {
		
		return this.sqlSession.delete("review_del", map);
	}

	// 좋아요 DB 추가
	@Override
	public int review_like_add(HashMap<String, Integer> map) {
		
		return this.sqlSession.insert("review_add", map);
	}

	// 리뷰 좋아요 개수
	@Override
	public int review_like_count(int review_no) {
		
		return this.sqlSession.selectOne("review_like_count", review_no);
	}
	

	

	



	
	
	

	

	

	
	

}
