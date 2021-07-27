package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalculateDAOImpl implements CalculateDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 정산 승인대기 목록
	@Override
	public List<CalculateDTO> calPass_wait() {
		
		return this.sqlSession.selectList("calPass_wait");
	}

	// 승인대기 목록 호스트명
	@Override
	public List<ClassDTO> calPass_wait_host() {
		
		return this.sqlSession.selectList("calPass_wait_host");
	}
	
	// 승인대기 건수
	@Override
	public int calPass_wait_count() {
		
		return this.sqlSession.selectOne("calPass_wait_count");
	}

	// 정산 승인완료 목록
	@Override
	public List<CalculateDTO> calPass_finish() {
		
		return this.sqlSession.selectList("calPass_finish");
	}

	// 승인완료 목록 호스트명
	@Override
	public List<ClassDTO> calPass_finish_host() {
		
		return this.sqlSession.selectList("calPass_finish_host");
	}
	
	// 승인완료 건수
	@Override
	public int calPass_finish_count() {
		
		return this.sqlSession.selectOne("calPass_finish_count");
	}

	// 클래스 테이블 class_cal = '1' -> '2' 로 변경
	@Override
	public int calPass_result(int class_num) {
		
		return this.sqlSession.update("calPass_result", class_num);
	}

	// 정산 테이블 cal_status = '1' -> '2' 로 변경 + 승일일자 업데이트
	@Override
	public int calPass_result2(int class_num) {
		
		return this.sqlSession.update("calPass_result2", class_num);
	}

	
}
