<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<link href="<%=request.getContextPath() %>/resources/css/main.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
			
				<div class="main_page">
				
					<!-- 기획전 -->
					<div id="carouselExampleIndicators" class="carousel slide carousel-fade special" data-bs-ride="carousel">
						<div class="special_class">
							<div class="special_class_title_div">
								<h2 class="special_class_title">기획전</h2>
							</div>
						</div>
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="<%=request.getContextPath() %>/resources/image/main/slide1.jpg" class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="<%=request.getContextPath() %>/resources/image/main/slide2.jpg" class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="<%=request.getContextPath() %>/resources/image/main/slide3.jpg" class="d-block w-100">
							</div>
							<button class="carousel-control-prev slide_btn" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							</button>
							<button class="carousel-control-next slide_btn" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
							</button>
						</div>
					</div>
					
					<!-- 카테고리 이미지 리스트 -->
					<div class="cateImg_list">
						<div class="cateImg_list_div1" style="opacity: 1; display: block;">
							<div class="cateImg_list_div2">
								<a href="#">
									<div class="cateImg_item">
										<div class="cateImg_item_div">
											<div class="cateImg_list_div1" style="opacity: 1; display: block;">
												<div style="display: block;">
													<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
														<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
															<img width="60" height="60" src="<%=request.getContextPath() %>/resources/image/main/cate_surfing.png">
														</div>
													</div>
												</div>
											</div>
										</div>
										<span>서핑OPEN</span>
									</div>
								</a>
								<a href="#">
									<div class="cateImg_item">
										<div class="cateImg_item_div">
											<div class="cateImg_list_div1" style="opacity: 1; display: block;">
												<div style="display: block;">
													<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
														<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
															<img width="60" height="60" src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,h_86,w_86/new-shortcut-camping_xgl7hu">
														</div>
													</div>
												</div>
											</div>
										</div>
										<span>캠핑</span>
									</div>
								</a>
								<a href="#">
									<div class="cateImg_item">
										<div class="cateImg_item_div">
											<div class="cateImg_list_div1" style="opacity: 1; display: block;">
												<div style="display: block;">
													<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
														<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
															<img width="60" height="60" src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,h_86,w_86/new-shortcut-hiking_p6g47f">
														</div>
													</div>
												</div>
											</div>
										</div>
										<span>등산·트레킹</span>
									</div>
								</a>
								<a href="#">
									<div class="cateImg_item">
										<div class="cateImg_item_div">
											<div class="cateImg_list_div1" style="opacity: 1; display: block;">
												<div style="display: block;">
													<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
														<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
															<img width="60" height="60" src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,h_86,w_86/new-shortcut-diy_pbnp5t">
														</div>
													</div>
												</div>
											</div>
										</div>
										<span>공예</span>
									</div>
								</a>
								<a href="#">
									<div class="cateImg_item">
										<div class="cateImg_item_div">
											<div class="cateImg_list_div1" style="opacity: 1; display: block;">
												<div style="display: block;">
													<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
														<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
															<img width="60" height="60" src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,h_86,w_86/new-shortcut-baking_xk5bsb">
														</div>
													</div>
												</div>
											</div>
										</div>
										<span>쿠킹</span>
									</div>
								</a>
							</div>
						</div>
					</div>

					<!-- 이번주 픽 -->
					<div class="class_list">
						<div class="cateImg_list_div1" style="opacity: 1; display: block;">
							<section class="class_list_section">
								<div class="class_list_title_div1">
									<div class="class_list_title_div2">
										<h2 class="class_list_title">이번주 PICK💖</h2>
									</div>
									<div class="class_list_all">
										<a class="class_list_all_link" href="/collections/ad?type=1">전체보기</a>
									</div>
								</div>
								<div class="class_group">
									<c:forEach begin="1" end="5" var="i">
										<div class="class_item">
											<a class="class_item_link" href="#">
												<div class="class_item_div">
													<div class="class_item_thumbnail">
														<div class="class_item_top">
															<span class="class_area">서울</span>
															<!-- 스크랩 누른상태 -->
															<i class="fas fa-bookmark fa-2x push" data-placement="left"></i>
															<!-- 스크랩 안누른 상태 -->
															<i class="far fa-bookmark fa-2x nopush" data-placement="left"></i>
														</div>
														<div class="class_item_image">
															<img class="class_img"
																src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1623911236019_872487">
														</div>
													</div>
													<div class="class_item_hash">추가수량 확보 | 나만의 감성 만들기</div>
													<div class="class_item_title"><p class="main-block-desc">[50%▼할인]공간을 그리다, 와이어아트 (예약 가능)aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p></div>
													<div class="class_item_price">
														<span class="class_price_after">25,000원</span>
														<span class="class_price_before">50,000</span>
													</div>
													<div class="class_star_div1">
														<div class="class_star_div2">
															<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E">
															<span>4.71</span>
														</div>
													</div>
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</section>
						</div>
					</div>
					
					<!-- 신규 클래스-->
					<div class="class_list">
						<div class="cateImg_list_div1" style="opacity: 1; display: block;">
							<section class="class_list_section">
								<div class="class_list_title_div1">
									<div class="class_list_title_div2">
										<h2 class="class_list_title">신규 등록💖</h2>
									</div>
									<div class="class_list_all">
										<a class="class_list_all_link" href="/collections/ad?type=1">전체보기</a>
									</div>
								</div>
								<div class="class_group">
									<c:forEach begin="1" end="5" var="i">
										<div class="class_item">
											<a class="class_item_link" href="#">
												<div class="class_item_div">
													<div class="class_item_thumbnail">
														<div class="class_item_top">
															<span class="class_area">서울</span>
															<!-- 스크랩 누른상태 -->
															<i class="fas fa-bookmark fa-2x push" data-placement="left"></i>
															<!-- 스크랩 안누른 상태 -->
															<i class="far fa-bookmark fa-2x nopush" data-placement="left"></i>
														</div>
														<div class="class_item_image">
															<img class="class_img"
																src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1623911236019_872487">
														</div>
													</div>
													<div class="class_item_hash">추가수량 확보 | 나만의 감성 만들기</div>
													<div class="class_item_title"><p class="main-block-desc">[50%▼할인]공간을 그리다, 와이어아트 (예약 가능)aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p></div>
													<div class="class_item_price">
														<span class="class_price_after">25,000원</span>
														<span class="class_price_before">50,000</span>
													</div>
													<div class="class_star_div1">
														<div class="class_star_div2">
															<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E">
															<span>4.71</span>
														</div>
													</div>
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</section>
						</div>
					</div>
					
					<!-- 특가 클래스 -->
					<div class="class_list">
						<div class="cateImg_list_div1" style="opacity: 1; display: block;">
							<section class="class_list_section">
								<div class="class_list_title_div1">
									<div class="class_list_title_div2">
										<h2 class="class_list_title">특가 할인💖</h2>
									</div>
									<div class="class_list_all">
										<a class="class_list_all_link" href="/collections/ad?type=1">전체보기</a>
									</div>
								</div>
								<div class="class_group">
									<c:forEach begin="1" end="5" var="i">
										<div class="class_item">
											<a class="class_item_link" href="#">
												<div class="class_item_div">
													<div class="class_item_thumbnail">
														<div class="class_item_top">
															<span class="class_area">서울</span>
															<!-- 스크랩 누른상태 -->
															<i class="fas fa-bookmark fa-2x push" data-placement="left"></i>
															<!-- 스크랩 안누른 상태 -->
															<i class="far fa-bookmark fa-2x nopush" data-placement="left"></i>
														</div>
														<div class="class_item_image">
															<img class="class_img"
																src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1623911236019_872487">
														</div>
													</div>
													<div class="class_item_hash">추가수량 확보 | 나만의 감성 만들기</div>
													<div class="class_item_title"><p class="main-block-desc">[50%▼할인]공간을 그리다, 와이어아트 (예약 가능)aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p></div>
													<div class="class_item_price">
														<span class="class_price_after">25,000원</span>
														<span class="class_price_before">50,000</span>
													</div>
													<div class="class_star_div1">
														<div class="class_star_div2">
															<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E">
															<span>4.71</span>
														</div>
													</div>
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</section>
						</div>
					</div>
				</div>
			
			
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>