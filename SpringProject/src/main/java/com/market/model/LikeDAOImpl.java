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

	// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명/시작날짜/끝날짜)
	@Override
	public List<ReviewDTO> class_review2(int host_memNum) {
		
		return this.sqlSession.selectList("classReview2", host_memNum);
	}

	// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명)
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

	// 리뷰 정렬기준 - 평점 높은순(score_high)
	@Override
	public List<ReviewDTO> review_highScore1(int host_memNum) {
		
		return this.sqlSession.selectList("review_highScore1", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_highScore2(int host_memNum) {
	
		return this.sqlSession.selectList("review_highScore2", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_highScore3(int host_memNum) {
		
		return this.sqlSession.selectList("review_highScore3", host_memNum);
	}
	
	@Override
	public List<Integer> highScore_like_list(HashMap<String, Integer> map) {
		
		return this.sqlSession.selectList("highScore_like_list", map);
	}

	// 리뷰 정렬기준 - 평점 낮은순(score_low)
	@Override
	public List<ReviewDTO> review_lowScore1(int host_memNum) {
		
		return this.sqlSession.selectList("review_lowScore1", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_lowScore2(int host_memNum) {
		
		return this.sqlSession.selectList("review_lowScore2", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_lowScore3(int host_memNum) {
		
		return this.sqlSession.selectList("review_lowScore3", host_memNum);
	}
	
	@Override
	public List<Integer> lowScore_like_list(HashMap<String, Integer> map) {
		
		return this.sqlSession.selectList("lowScore_like_list", map);
	}

	// 리뷰 정렬기준 - 최신순(score_new)
	@Override
	public List<ReviewDTO> review_newScore1(int host_memNum) {
		
		return this.sqlSession.selectList("review_newScore1", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_newScore2(int host_memNum) {
		
		return this.sqlSession.selectList("review_newScore2", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_newScore3(int host_memNum) {
		
		return this.sqlSession.selectList("review_newScore3", host_memNum);
	}
	
	@Override
	public List<Integer> newScore_like_list(HashMap<String, Integer> map) {
		
		return this.sqlSession.selectList("newScore_like_list", map);
	}

	// 리뷰 정렬기준 - 평점 추천순(score_like)
	@Override
	public List<ReviewDTO> review_likeScore1(int host_memNum) {
		
		return this.sqlSession.selectList("review_likeScore1", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_likeScore2(int host_memNum) {
		
		return this.sqlSession.selectList("review_likeScore2", host_memNum);
	}

	@Override
	public List<ReviewDTO> review_likeScore3(int host_memNum) {
		
		return this.sqlSession.selectList("review_likeScore3", host_memNum);
	}
	
	@Override
	public List<Integer> likeScore_like_list(HashMap<String, Integer> map) {
		
		return this.sqlSession.selectList("likeScore_like_list", map);
	}

	@Override
	public List<ClassDTO> getNoLikeClassList(int mem_num) {
		return this.sqlSession.selectList("nolikeClass", mem_num);
	}

	
	@Override
	public int class_status(HashMap<String, Integer> map) {
		
		return this.sqlSession.selectOne("class_status", map);
	}

	@Override
	public int class_like_add(HashMap<String, Integer> map) {
		
		return this.sqlSession.insert("class_add", map);
	}

	@Override
	public int class_like_del(HashMap<String, Integer> map) {

		return this.sqlSession.delete("class_del", map);
	}

	@Override
	public int host_status(HashMap<String, Integer> map) {

		return this.sqlSession.selectOne("host_status", map);
	}

	@Override
	public int host_like_add(HashMap<String, Integer> map) {

		return this.sqlSession.insert("host_add", map);
	}

	@Override
	public int host_like_del(HashMap<String, Integer> map) {

		return this.sqlSession.delete("host_del", map);
	}


}
