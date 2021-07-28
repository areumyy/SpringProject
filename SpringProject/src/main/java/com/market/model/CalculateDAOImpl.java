package com.market.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalculateDAOImpl implements CalculateDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getCountAll(int mem_num) {
		return this.sqlSession.selectOne("cal_count_all", mem_num);
	}

	@Override
	public int getCountBefore(int mem_num) {
		return this.sqlSession.selectOne("cal_count_before", mem_num);
	}

	@Override
	public int getCountIng(int mem_num) {
		return this.sqlSession.selectOne("cal_count_ing", mem_num);
	}

	@Override
	public int getCountAfter(int mem_num) {
		return this.sqlSession.selectOne("cal_count_after", mem_num);
	}

	@Override
	public List<CalculateDTO> getListAll(List<ClassDTO> list) {
		List<CalculateDTO> newList = new ArrayList<CalculateDTO>();
		for (int i = 0; i < list.size(); i++) {
			int target = list.get(i).getClass_num();
			newList.add((CalculateDTO) this.sqlSession.selectOne("cal_cont", target));
		}
		return newList;
	}

	@Override
	public List<CalculateDTO> getListBefore(List<ClassDTO> list) {
		List<CalculateDTO> newList = new ArrayList<CalculateDTO>();

		for (int i = 0; i < list.size(); i++) {
			int target = list.get(i).getClass_num();
			newList.add((CalculateDTO) this.sqlSession.selectOne("cal_cont_before", target));
		}
		return newList;
	}

	@Override
	public List<CalculateDTO> getListIng(List<ClassDTO> list) {
		List<CalculateDTO> newList = new ArrayList<CalculateDTO>();

		for (int i = 0; i < list.size(); i++) {
			int target = list.get(i).getClass_num();
			newList.add((CalculateDTO) this.sqlSession.selectOne("cal_cont_ing", target));
		}
		return newList;
	}

	@Override
	public List<CalculateDTO> getListAfter(List<ClassDTO> list) {
		List<CalculateDTO> newList = new ArrayList<CalculateDTO>();

		for (int i = 0; i < list.size(); i++) {
			int target = list.get(i).getClass_num();
			newList.add((CalculateDTO) this.sqlSession.selectOne("cal_cont_after", target));
		}
		return newList;
	}

	@Override
	public int requestCal(int target) {
		return this.sqlSession.update("req_cal", target);
	}

	@Override
	public int insertData(CalculateDTO dto) {
		return this.sqlSession.insert("insertData", dto);
	}

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

	@Override
	public int getMsales(int mem_num) {
		return this.sqlSession.selectOne("getMsales", mem_num);
	}

	@Override
	public int getSales(int mem_num) {
		return this.sqlSession.selectOne("getSales", mem_num);
	}
}
