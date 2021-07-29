<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypageCommon.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypageProductDetail.css" rel="stylesheet"/>
<script language="javascript">
	document.title = "마이페이지 제품상세" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
</head>
<body>
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">



				<div class="pg_main">
					<div class="notFlex_wrapper">
						<c:set var="dto" value="${list }" />
						<c:set var="blist" value="${blist }" />
						<c:set var="clist" value="${clist }" />
						<c:set var="olist" value="${olist }" />
					
						<div class="pg_container">
							<header class="mypage_productDetail_header_wrapper">
								<h1 class="pg_header_txt">상세 정보</h1>
							</header>
							<div class="mypage_productDetail_wrapper bottom_gray">
								<div class="pgCard_date">${blist.getBooking_regdate()} 결제</div>
								<div class="pgCard_product_wrapper">
									<div class="pgCard_product_header">
										<div class="pgCard_img_wrapper">
											<div class="pgCard_product_img_wrapper">
												<img class="product_img"
													src="<%=request.getContextPath()%>/resources/image/mypage/product/dojagi.jpg">
											</div>
										</div>
										<div class="pgCard_product_info">
											<div class="pgCard_header_product_title">${clist.getClass_title()}</div>
										</div>
									</div>
								</div>
								<div class="pgCard_footer_wrapper">
									<div class="pgCard_footer_info">
										<span class="mypage_footer_txt_bottom">${olist.getOption_name()}</span> <span class="color_gray">사용완료</span>
									<div class="productDetail_memInfo">
										<span class="color_gray">받으실분 성함 : ${dto.getMem_name() } | 우편번호 : 08330 | 배송 받으실 주소 : 서울특별시 구로구 개봉로20길 158 1604호 | 연락처 (휴대전화) : ${dto.getMem_phone() } | 배송메세지(ex. 공동현관 출입방법) : | 기타요청사항 :</span>
									</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="pg_container">
							<header class="mypage_productDetail_header_wrapper">
								<h1 class="pg_header_txt">결제 정보</h1>
							</header>
							<div class="mypage_productDetail_wrapper">
								<div class="detail_info">
									<div class="infoTitle">상품 금액</div>
									24,900원
								</div>
								<div class="detail_info">
									<div class="infoTitle">할인</div>
									5,000원
								</div>
								<div class="detail_info">
									<div class="infoTitle">결제 금액</div>
									<b>19,900원</b>
								</div>
								<div class="detail_info">
									<div class="infoTitle">결제 수단</div>
									토스 머니
								</div>
							</div>
							
						</div>
					</div>
				</div>



			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>