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
<link href="<%=request.getContextPath() %>/resources/css/mypage_common.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypage_coupon.css" rel="stylesheet"/>
</head>
<body>
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">



				<div class="pg_main">
					<div class="pg_wrapper">
						<div class="pg_container">
							<header class="pg_header_wrapper">
								<h1 class="pg_header_txt">쿠폰</h1>
							</header>
							<div class="mypage_coupon_wrapper">
								<form class="serialNumber_wrapper">
									<input class="serialNumber" placeholder="쿠폰 입력">
									<button type="submit" class="serialNumber_button">등록</button>
								</form>
								
								<div class="coupon_list_wrapper">
									<div class="coupon_cont_wrappr">
										<div class="coupon_content">
											<div class="coupon_description"> <!-- 쿠폰 종류 -->
												<div class="coupon_name">프립 #시작지원금 쿠폰 (1)</div>
												<div class="coupon_price">5,000원</div>
											</div>
											<div class="coupon_condition"> <!-- 쿠폰 상태 -->
											유효기한 2021-07-21 까지 / 20,000원 이상 프립에 사용 가능 / 최대 할인금액 5,000원
											</div>
										</div>
									</div>
									
									<div class="coupon_cont_wrappr">
										<div class="coupon_content">
											<div class="coupon_description"> <!-- 쿠폰 종류 -->
												<div class="coupon_name">프립 #시작지원금 쿠폰 (2)</div>
												<div class="coupon_price">15,000원</div>
											</div>
											<div class="coupon_condition"> <!-- 쿠폰 상태 -->
											유효기한 2021-07-21 까지 / 50,000원 이상 프립에 사용 가능 / 최대 할인금액 15,000원
											</div>
										</div>
									</div>
									
									<div class="coupon_cont_wrappr">
										<div class="coupon_content">
											<div class="coupon_description"> <!-- 쿠폰 종류 -->
												<div class="coupon_name">소셜클럽 전용 #시작지원금</div>
												<div class="coupon_price">30,000원</div>
											</div>
											<div class="coupon_condition"> <!-- 쿠폰 상태 -->
											유효기한 2021-10-05 까지 / 프립에 사용 가능 / 최대 할인금액 30,000원
											</div>
										</div>
									</div>
								</div>

								
								<nav aria-label="Page navigation example" class="paging_footer">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#" aria-label="Previous" style="color: black;"> 
										<span aria-hidden="true">&laquo;</span></a>
										</li>
										
										<li class="page-item active"><a class="page-link" href="#" style="color: white;">1</a></li>
										<li class="page-item"><a class="page-link" href="#" style="color: black;">2</a></li>
										<li class="page-item"><a class="page-link" href="#" style="color: black;">3</a></li>
										
										<li class="page-item"><a class="page-link" href="#" aria-label="Next" style="color: black;"> 
										<span aria-hidden="true">&raquo;</span></a>
										</li>
									</ul>
								</nav>
								


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