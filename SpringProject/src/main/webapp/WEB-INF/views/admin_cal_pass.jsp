<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_정산 승인</title>

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
<link href="<%=request.getContextPath()%>/resources/css/admin_cal_pass.css" rel="stylesheet" />

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
						<div class="pass_box_title">
							승인 대기
							<span class="pass_count"> 5개</span>
						</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 번호</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">진행일자</th>
						      <th scope="col">프립명</th>
						      <th scope="col">매출</th>
						      <th scope="col">수수료</th>
						      <th scope="col">실 정산 금액</th>
						      <th scope="col">신청일자</th>
						      <th scope="col">상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>15</td>
						      <td>라이언</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈rgtsregargsregesrgesrgesrger</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>대기</td>
						      <td>
						      	<!-- Button trigger modal -->
								<button type="button" class="viewDetail_btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button>
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered modal-lg">
										<div class="modal-content">
											<div>
												<div class="modal-header">
													정산 상세보기 - 호스트 번호 / 호스트 이름
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- 프립을 소개해 주세요 -->
													<div class="cal_modal">
														<div class="section01">
															<div><img class="frip_img" alt="상품 이미지" class="Image__StyledImage-v97gyx-1 VUNpz" width="768" src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_0,w_768/1610_Gongbang_01_1477457672181"></div>
															<div class="frip_info">
																<div>
																	<div class="frip_no">Class No.1</div>
																	<div class="frip_title">도예 공방 원데이 / 도자기 그릇 만들기 (예약가능)</div>
																</div>
																<span class="frip_period">2021-07-01 ~ 2021-07-13</span>
															</div>
														</div>
														<div class="section02">
															<div class="option_box1">
																<div class="option">옵션 01.</div>
																<div class="option_box_inner">
																	<p class="option_name">1인 이용권</p>
																	<p class="option_price">32,000원</p>
																</div>
																<div class="frip_attendee">7/10</div>
															</div>
															<div class="option_box2">
																<div class="option">옵션 02.</div>
																<div class="option_box_inner">
																	<p class="option_name">1인 이용권 ★오전 클래스(10:30) 특별 할인★</p>
																	<p class="option_price">30,000원</p>
																</div>
																<div class="frip_attendee">5/10</div>
															</div>
														</div>
														<div class="section03">
															<div class="cal_info_box">
																<p class="cal_title">매출</p>
																<p class="cal_price">100,000원</p>
															</div>
															<div class="cal_info_box">
																<p class="cal_title">수수료</p>
																<p class="cal_price">100,000원</p>
															</div>
															<div class="cal_info_box">
																<p class="cal_title">실 정산금액</p>
																<p class="cal_price">100,000원</p>
															</div>
														</div>
														<div class="section04">
															<div class="final_cal">100,000원</div>
														</div>
													</div>
													<!-- 프립 소개 end -->

												</div>
												<div class="modal-footer" style="display: block;">
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
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>캐릭터 석고 방향제&캔들 SET 만들기 (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>대기</td>
						      <td><button>상세보기</button>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>대기</td>
						      <td><button>상세보기</button>
						     </tr>
						  </tbody>
						</table>
					</div> <!-- 승인 대기 end -->
					
					<!-- 승인 완료 -->
					<div class="pass_box">
						<div class="pass_box_title">
							승인 완료
							<span class="pass_count"> 2개</span>
						</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 번호</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">진행일자</th>
						      <th scope="col">프립명</th>
						      <th scope="col">매출</th>
						      <th scope="col">수수료</th>
						      <th scope="col">실 정산 금액</th>
						      <th scope="col">정산일자</th>
						      <th scope="col">상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>36</td>
						      <td>네오</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>꼬끄, 필링 데코레이션까지 ONLY 쏭카롱 원데이 클래스 (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>완료</td>
						      <td><button>상세보기</button>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>5</td>
						      <td>튜브</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>프리다이빙 자격증따기! (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>완료</td>
						      <td><button>상세보기</button>
						    </tr>
						  </tbody>
						</table>
					</div> <!-- 승인 완료 end -->
				</div>
				
			</div>	
		</div>
		
	<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
	
</body>
</html>