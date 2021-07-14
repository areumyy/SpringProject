<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_프립 승인</title>

<!-- 반응형 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<!-- CSS 파일 -->
<link href="<%=request.getContextPath()%>/resources/css/admin.css" rel="stylesheet" />

</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../include/adminMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../include/adminSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<!-- 승인 대기 -->
					<div class="pass_box">
						<div class="pass_box_title">승인 대기</div>
						<table class="table table-hover table_cal_pass">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 번호</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">프립명</th>
						      <th scope="col">1차 카테고리</th>
						      <th scope="col">2차 카테고리</th>
						      <th scope="col">신청일자</th>
						      <th scope="col">승인상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">12344</th>
						      <td>15</td>
						      <td>라이언</td>
						      <td>[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈rgtsregargsregesrgesrgesrger</td>
						      <td>아웃도어</td>
						      <td>서핑</td>
						      <td>2021-07-01</td>
						      <td>대기</td>
						      <td>
						      	<!-- Button trigger modal -->
								<button type="button" class="viewDetail_btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button>
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered modal-xl">
										<div class="modal-content">
											<div>
												<div class="modal-header">
													프립 상세보기 - 호스트 번호 / 호스트 이름
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- 프립을 소개해 주세요 -->
													<div class="Main_line_hidden" id="final">
														<div class="Main_line_1">
															<div class="final_confirm">
																<div class="final_confirm_frame">
																	<div class="confirm_img">
																		<img src="<%=request.getContextPath() %>/resources/logo/logo.png" 
																			name="confirm_img" alt="이미지 없음" width="100%">
																	</div>
																	<div class="final_frip_info">
																		<section class="info_section">
																			<div class="info_title" id="fripTitle">
																				프립 타이틀
																			</div>
																			<div class="info_price">
																				34% 123,456원
																			</div>
																		</section>
																		<section class="info_section1">
																			<div class="info_hostInfo">
																				<img width="56px" height="42px"src="<%=request.getContextPath() %>/resources/logo/logo.png">
																				<div class="info_hostInfo_text">
																					dsa13 >
																				</div>
																			</div>
																			
																			<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='none' viewBox='0 0 32 32'%3E %3Cpath fill='%23F4F4F4' stroke='%23CCC' stroke-width='1.5' d='M15.043 19.962l-.029.02-.026.021-7.571 6.384V5.827c0-1.273 1.155-2.41 2.73-2.41h11.706c1.569 0 2.73 1.138 2.73 2.41v20.56l-7.572-6.384-.026-.022-.028-.02c-.292-.203-.634-.293-.957-.293-.324 0-.666.09-.957.294z'/%3E %3C/svg%3E" alt="상품 저장 아이콘">
																		</section>
																		
																		<section class="info_section2">
																			<div class="info_title">
																				프립소개
																			</div>
																			<div id="fripInfo">
																				
																			</div>
																		</section>
																		
																		<section class="info_section2">
																			<div class="info_title">
																				포함 사항
																			</div>
																			<div id="include">
																				
																			</div>
																		</section>
																		
																		<section class="info_section2">
																			<div class="info_title">
																				불포함 사항
																			</div>
																			<div id="exclude">
																				
																			</div>
																		</section>
																		
																		<section class="info_section2">
																			<div class="info_title">
																				세부일정
																			</div>
																			<div id="plan">
																				
																			</div>
																		</section>
																		
																		<section class="info_section2">
																			<div class="info_title">
																				유의 사항
																			</div>
																			<div class="notice">
																				<p>프립에서 구매하시지 않는 경우, 환불 거부, 서비스 불이행 등의 문제가 생길 수 있습니다.</p>
																			</div>
																		</section>
																		
																		<section class="info_section2">
																			<div class="info_title">
																				진행 장소
																			</div>
																			<div id="location">
																				
																			</div>
																		</section>
																	</div>
																</div>
															</div>
														</div>
													</div><!-- 프립 소개 end -->

												</div>
												<div class="modal-footer" style="display: block;">
													<button type="button" class="btn btn-primary">승인거부</button>
													<button type="button" class="btn btn-primary">승인처리</button>
												</div>
											</div>
										</div>
									</div>
								</div>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>9</td>
						      <td>춘식이</td>
						      <td>캐릭터 석고 방향제&캔들 SET 만들기 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>캔들</td>
						      <td>2021-07-10</td>
						      <td>거부</td>
						      <td><button>상세보기</button></td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr><tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr><tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						  </tbody>
						</table>
					</div>
					
					<!-- 승인 완료 -->
					<div class="pass_box">
						<div class="pass_box_title">승인 완료</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 번호</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">프립명</th>
						      <th scope="col">1차 카테고리</th>
						      <th scope="col">2차 카테고리</th>
						      <th scope="col">승인일자</th>
						      <th scope="col">승인상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>36</td>
						      <td>네오</td>
						      <td>꼬끄, 필링 데코레이션까지 ONLY 쏭카롱 원데이 클래스 (예약 가능)</td>
						      <td>베이킹</td>
						      <td>디저트</td>
						      <td>2021-07-13</td>
						      <td>완료</td>
						      <td><button>상세보기</button></td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>5</td>
						      <td>튜브</td>
						      <td>프리다이빙 자격증따기! (예약 가능)</td>
						      <td>스포츠</td>
						      <td>실내다이빙</td>
						      <td>2021-07-13</td>
						      <td>완료</td>
						      <td><button>상세보기</button></td>
						    </tr>
						   </tbody>
						</table>
					</div>
				</div>
			</div>
	
		</div>
		
	<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>