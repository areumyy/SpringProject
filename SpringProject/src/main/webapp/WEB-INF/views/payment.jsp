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
<script type="text/javascript">
function usePoint(havePoint, optionPrice){
	$.ajax({
        type : "post",
        url : '/controller/usePoint', 
        data : {"havePoint": havePoint, "optionPrice": optionPrice},
        dataType: 'json',
        error : function(error) {
            console.log("error");
        },
        success : function(data) {
            var change = data.change;
            var state = data.state;
            
            if(state == 1) {
            	$("#havePoint").text(change);
            	$("#usePoint_input").val(optionPrice);
            	$("#salePrice").text(optionPrice);
            	$("#finalPrice").text("0");
            	$("#finalPric2").text("0");
            } else if(state == 2){
            	$("#havePoint").text("0");
            	$("#usePoint_input").val(havePoint);
            	$("#usePoint_input").attr('value',havePoint);
            	$("#salePrice").text(havePoint);
            	$("#finalPrice").text(change);
            	$("#finalPrice2").text(change);
            } else if(state == -1){ // 사용 불가능
            	alert('포인트는 100Point부터 사용 가능합니다!');
            }
        }
    });
}

function selectCard(){
	if($("#card").hasClass('active') == true){
		$("#card").removeClass('active');
	} else {
		if($("#cash").hasClass('active') == true){
			$("#cash").removeClass('active');
			$("#card").addClass('active');
		} else {
			$("#card").addClass('active');
		}
	}
	$("#payMethod2").val($("#card").val());
	console.log($("#payMethod2").val());
}
function selectCash(){
	if($("#cash").hasClass('active') == true){
		$("#cash").removeClass('active');
	} else {
		if($("#card").hasClass('active') == true){
			$("#card").removeClass('active');
			$("#cash").addClass('active');
		} else {
			$("#cash").addClass('active');
		}
	}
	$("#payMethod2").val($("#cash").val());
	console.log($("#payMethod2").val());
}

function checkPayment(){
	if(($("#cash").hasClass('active') == false && $("#card").hasClass('active') == false)){
		console.log($("#usePoint_input").val());
		
		alert("결제방법을 선택해주세요.");
		return false;
	}
	if($("#payAgree").is(":checked") == false){
		alert("약관 동의를 해주세요.");
		return false;
	}
}
</script>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
				<div class="article">

				<div class="pay_page">
					<form method="post" action="<%=request.getContextPath() %>/payment_ok.do" onsubmit="return checkPayment();">
						<input type="hidden" name="booking_writer" value="${bookDto.getBooking_writer() }">
						<input type="hidden" name="booking_classNum" value="${bookDto.getBooking_classNum() }">
						<input type="hidden" name="booking_option" value="${bookDto.getBooking_option() }">
						<input type="hidden" name="option_price" value="${optionDto.getOption_price() }">
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
														<img src="<%=request.getContextPath() %>/resources/upload/${classDto.getClass_image()}" style="width: 130px; height: 130px;">
														<!-- <img src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,w_130/1610_Gongbang_01_1477457672181"> -->
													</div>
												</div>
												<div class="item_content">
													<span class="item_hash">${classDto.getClass_hash() }</span>
													<span class="item_title">${classDto.getClass_title() }</span>
												</div>
											</div>
											<div class="sel_option_section">
												<div class="payment_div">
													<div class="payment_item">
														<div>
															<div>${optionDto.getOption_name() }</div>
														</div>
														<span class="item_price">${optionDto.getOption_price() }원</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="payment_section">
									<div class="payment_list">
										<div class="payment_list_title">상품 금액</div>
										<div class="payment_list_price">${optionDto.getOption_price() }원</div>
									</div>
									<!-- <div class="payment_list">
										<div class="payment_list_title">쿠폰</div>
										<div class="payment_list_price">- 0 원
											Button trigger modal
											<button type="button" class="coupon_btn" data-bs-toggle="modal" data-bs-target="#exampleModal">선택</button>
											Modal
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
									</div> -->
									<div class="payment_list">
										<div class="payment_list_title" style="display: flex;">
											포인트
											<span class="have_point" style="display: flex;">보유 &nbsp;<div id="havePoint">${loginDto.getMem_point() }</div></span>
										</div>
										<div class="payment_list_price">
											<label>
												<input type="text" id="usePoint_input" class="use_point" name="usedPoint" disabled value="0">P</label>
											<input  type="button" class="coupon_btn" onclick="usePoint(${loginDto.getMem_point() }, ${optionDto.getOption_price() });" value="전체 사용">
										</div>
									</div>
									<ul class="notice_list">
										<li class="notice_item">포인트는 100point부터 사용 가능합니다.</li>
										<li class="notice_item">포인트를 사용한 결제시 개별 취소가 불가합니다.</li>
									</ul>
									<div class="payment_final">
										<div class="final_div">
											<div class="final_div_title">할인 금액</div>
											<div class="final_div_price" style="display: flex;">-<div id="salePrice">0</div> 원</div>
										</div>
										<div class="final_div">
											<div class="final_div_title">최종 결제 금액</div>
											<div class="final_div_price" style="display: flex;"><div id="finalPrice">${optionDto.getOption_price() }</div> 원</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="pay_way">
							<div class="pay_header">결제수단</div>
							<div class="pay_method">
								<div class="pay_method_list">
									<input type="button" class="pay_method_btn" id="card" onclick="selectCard();" value="신용/체크 카드" >
									<input type="button" class="pay_method_btn" id="cash" onclick="selectCash();" value="실시간 계좌이체">
									<input type="hidden" name="payMethod" value="" id="payMethod2">
								</div>
							</div>
						</div>
						<div class="agreement">
							<label class="agreement_label">
								<input type="checkbox" class="agreement_checkbox" id="payAgree">
								<div>개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.</div>
							</label>
						</div>
						<div class="final_pay">
							<button type="submit" class="final_pay_btn">
								<div style="display: flex; justify-content: center;">
									<div id="finalPrice2">${optionDto.getOption_price() }</div>원 결제하기
								</div>
							</button>
						</div>
					</form>
				</div>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>