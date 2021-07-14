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
<link href="<%=request.getContextPath() %>/resources/css/payment_ok.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
			
				<div class="pay_page">
					<div class="pay_div">
						<div class="pay_header">결제 완료</div>
						<div class="pay_body">
							<div class="pay_option">
								<div class="option_select_div">
								<button class="accordion-button arcodion_btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<div class="option_select_title">신청한 프립</div>
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
									<div class="payment_list_title">할인</div>
									<div class="payment_list_price">- 0 원</div>
								</div>
								<div class="payment_list">
									<div class="payment_list_title">결제 금액</div>
									<div class="payment_list_price">32,000 원</div>
								</div>
								<div class="payment_list">
									<div class="payment_list_title">결제 수단</div>
									<div class="payment_list_price">실시간 계좌이체</div>
								</div>
							</div>
						</div>
					</div>
					<div class="final_pay">
						<button class="final_pay_btn" onclick="location.href='payment_ok.do'">확인</button>
					</div>
				</div>
			
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>