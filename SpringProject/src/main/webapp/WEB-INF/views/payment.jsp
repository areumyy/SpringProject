<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/payment.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
				<div class="article">

				<div class="pay_page">
					<div class="pay_div">
						<div class="pay_header">결제</div>
						<div class="pay_body">
							<div class="pay_option">
								<div class="option_select_div">
								<button class="accordion-button arcodion_btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<div class="option_select_title">선택한 프립</div>
								</button>
								</div>
								<div class="sel_option_div accordion-collapse collapse show" id="collapseOne">
									<div class="sel_option_content">
										<div class="sel_option_content2">
											<div class="Product__ImageWrapper-sc-1lkmgat-4 hNCWrM">
												<div>
													<img src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,w_130/1610_Gongbang_01_1477457672181">
												</div>
											</div>
											<div class="item_content">
												<span class="item_hash">도예 공방에서 세상에서 단 하나뿐인</span>
												<span class="item_title">도예 공방 원데이 / 도자기 그릇 만들기 (예약가능)</span>
											</div>
										</div>
										<div class="sel_option_section">
											<div class="payment_div">
												<div class="payment_item">
													<div>
														<div>1인 이용권 x 1개</div>
													</div>
													<span class="item_price">32,000원</span>
												</div>
											</div>
											<div class="payment_div">
												<div class="payment_item">
													<div>
														<div>1인 이용권 x 1개</div>
													</div>
													<span class="item_price">32,000원</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="payment_section">
								<div class="payment_list">
									<div class="payment_list_title">상품 금액</div>
									<div class="payment_list_price">32,000 원</div>
								</div>
								<div class="payment_list">
									<div class="payment_list_title">쿠폰</div>
									<div class="payment_list_price">- 0 원
										<!-- Button trigger modal -->
										<button type="button" class="coupon_btn" data-bs-toggle="modal" data-bs-target="#exampleModal">선택</button>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content coupon_body">
													<div class="coupon_div">
														<div class="modal-header coupon_header">
															쿠폰 선택
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<div class="coupon_container">
																<div class="coupon_modal_content">
																	<div class="coupon_modal_body">
																		<div class="coupon_modal_scroll">
																			<div class="coupon_item">
																				<div class="coupon_select_header">
																					<div class="coupon_select_info">
																						<div class="coupon_name">
																							<div class="coupon_title">
																								<div>십규가입 할인쿠폰 x 1개</div>
																							</div>
																							<div class="coupon_price">-5,000원</div>
																						</div>
																						<div class="coupon_cont">
																							<span class="coupon_cont_span">신규가입 기념 쿠폰</span>
																						</div>
																					</div>
																					<div class="coupon_select_div">
																						<button class="coupon_select_btn">쿠폰 선택</button>
																					</div>
																				</div>
																			</div>
																			<div class="coupon_item">
																				<div class="coupon_select_header">
																					<div class="coupon_select_info">
																						<div class="coupon_name">
																							<div class="coupon_title">
																								<div>십규가입 할인쿠폰 x 1개</div>
																							</div>
																							<div class="coupon_price">-5,000원</div>
																						</div>
																						<div class="coupon_cont">
																							<span class="coupon_cont_span">신규가입 기념 쿠폰</span>
																						</div>
																					</div>
																					<div class="coupon_select_div">
																						<button class="coupon_select_btn">쿠폰 선택</button>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>

														</div>
														<div class="modal-footer coupon_footer">
															<button type="button" class="coupon_ok_btn">적용하기</button>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
								<div class="payment_list">
									<div class="payment_list_title">
										포인트
										<span class="have_point">보유 0</span>
									</div>
									<div class="payment_list_price">
										<label>
											<input type="text" class="use_point" value="0" disabled>P</label>
										<button class="coupon_btn">전체 사용</button>
									</div>
								</div>
								<ul class="notice_list">
									<li class="notice_item">에너지는 100point부터 사용 가능합니다.</li>
									<li class="notice_item">쿠폰/할인코드/에너지를 사용한 결제시 개별 취소가 불가합니다.</li>
								</ul>
								<div class="payment_final">
									<div class="final_div">
										<div class="final_div_title">할인 금액</div>
										<div class="final_div_price">- 0 원</div>
									</div>
									<div class="final_div">
										<div class="final_div_title">최종 결제 금액</div>
										<div class="final_div_price">32,000 원</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="pay_way">
						<div class="pay_header">결제수단</div>
						<div class="pay_method">
							<div class="pay_method_list">
								<button class="pay_method_btn">신용/체크 카드</button>
								<button class="pay_method_btn">실시간 계좌이체</button>
							</div>
						</div>
					</div>
					<div class="agreement">
						<label class="agreement_label">
							<input type="checkbox" class="agreement_checkbox">
							<div>개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.</div>
						</label>
					</div>
					<div class="final_pay">
						<button class="final_pay_btn" onclick="location.href='payment_ok.do'">32,000원 결제하기</button>
					</div>
				</div>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>