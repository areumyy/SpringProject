package com.market.model;

import lombok.Data;

// 페이징 처리 시 작업할  내용을 설정하는 객체

@Data
public class PageDTO {

	private int page; // 현재 페이지
	private int rowsize; // 한 페이지당 보여질 게시물의 수
	private int totalRecord; // DB 상의 테이블의 전체 레코드 수
	private int startNo; // 해당 페이지 시작 번호
	private int endNo; // 해당 페이지 끝 번호
	private int block; // 아래에 보여질 페이지 최대 수 - 예) [1][2][3] / [4][5][6]
	private int startBlock; // 해당 페이지에서 시작 블럭
	private int endBlock; // 해당 페이지에서 끝 블럭
	private int allPage; // 전체 페이지 수

	// 검색과 관련된 멤버 선언
	private String field;
	private String keyword;

	public PageDTO() { // 기본 생성자

	}

	public PageDTO(int page, int rowsize, int totalRecord, int block) { // 인자 생성자
		this.page = page;
		this.rowsize = rowsize;
		this.totalRecord = totalRecord;
		this.block = block;
		
		// 해당 페이지 시작 번호
		this.startNo = (this.page * this.rowsize) - (this.rowsize - 1);

		// 해당 페이지 마지막 번호
		this.endNo = (this.page * this.rowsize);

		// 해당 페이지 시작 블럭
		this.startBlock = (((this.page - 1) / this.block) * this.block) + 1;

		// 해당 페이지 마지막 블럭
		this.endBlock = (((this.page - 1) / this.block) * this.block) + this.block;

		// 전체 페이지 수 : 전체 게시물의 수 / 한 페이지당 보여질 게시물의 수
		// 나머지가 존재하면 무조건 올려줘야 한다.
		this.allPage = (int) Math.ceil(this.totalRecord / (double) this.rowsize);

		if (this.endBlock > this.allPage) {
			this.endBlock = this.allPage;
		}
	}

	public PageDTO(int page, int rowsize, int totalRecord, int block, String field, String keyword) {
		this(page, rowsize, totalRecord, block);
		this.field = field;
		this.keyword = keyword;
	}
}
