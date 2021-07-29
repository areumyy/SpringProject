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
<link href="<%=request.getContextPath() %>/resources/css/mypage.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">




				<div class="my_page">
					<div class="mypage_info_wrapper"><!-- 프로필바 -->
						<c:set var="dto" value="${list }" />

								<div class="customer_info_wrapper">
									<!-- 개인 정보 -->
									<div class="customer_info">
										<div class="customer_name">
											<div class="customer_name_txt">${dto.getMem_nick() }</div>
											<a href="<%=request.getContextPath() %>/mypage_edit.do">
												<img alt="더보기" class="customer_more"
												src="<%=request.getContextPath() %>/resources/image/mypage/more.svg">
											</a>
										</div>
										<div class="customer_account_type">카카오 연동 계정</div>
									</div>
									
									<form method="post" enctype="multipart/form-data" class="mypage_profile_img">
										<div class="mypage_img_wrapper">
											<div class="img_cont">
												<c:choose>
													<c:when test="${dto.getMem_profileimg() == null}">
														<img alt="프로필 이미지" class="img_style"
															src="<%=request.getContextPath() %>/resources/image/mypage/profile/profile_no_img.png">
													</c:when>
													<c:otherwise>
														<img alt="프로필 이미지" class="img_style"
															src="<%=request.getContextPath() %>/resources/image/mypage/profile/${dto.getMem_profileimg() }">
													</c:otherwise>
												
												</c:choose>
											</div>
										</div>
										<img alt="수정 아이콘" class="img_modify"
											src="<%=request.getContextPath() %>/resources/image/mypage/modify.svg">
									</form>
								</div>

								<div class="customer_membershipCard">
									<!-- 개인 카드 -->
									<div class="customer_box_wrapper">
										<div class="customer_info_box">
											<a <%-- href="<%=request.getContextPath() %>/mypage_energy.do" --%>
												class="customer_txt_style">
												<div class="customer_box_txt">
													에너지<img class="box_arrow"
														src="<%=request.getContextPath() %>/resources/image/mypage/arrow.svg">
												</div> ${dto.getMem_point() }
											</a>
										</div>
										<div class="customer_info_box">
											<a <%-- href="<%=request.getContextPath() %>/mypage_coupon.do" --%>
												class="customer_txt_style">
												<div class="customer_box_txt">
													쿠폰<img class="box_arrow"
														src="<%=request.getContextPath() %>/resources/image/mypage/arrow.svg">
												</div> 3
											</a>
										</div>
										<div class="customer_info_box">
											<a href="<%=request.getContextPath()%>/mypage_review.do"
												class="customer_txt_style">

												<div class="customer_box_txt">
													후기<img class="box_arrow"
														src="<%=request.getContextPath()%>/resources/image/mypage/arrow.svg">
												</div> 0
											</a>
										</div>
									</div>
								</div>
					
					</div><!-- /프로필바 -->
					
					
					<div class="mypage_nav_wrapper"><!-- 내역 -->
						<div class="mypage_route_container">
							<div class="mypage_nav_list">
								<a href="<%=request.getContextPath() %>/mypage.do">
									<button class="nav_button">
										<div>
											사용가능<span class="nav_cont">${countWorks }</span>
										</div>
									</button>
								</a>
								
								<a href="<%=request.getContextPath() %>/mypage_purchases.do">
									<button class="nav_button select">
										<div>
											신청내역<span class="nav_cont"></span>
										</div>
									</button>
								</a>
							</div>
							
							<div class="mypage_nav_cont">
								<div class="full_wrapper">
									<c:if test="${!empty blist}">
									<c:forEach items="${blist }" var="dto" varStatus="status">
									<div class="pgCard_wrapper">
										<div class="pgCard_date">${dto.getBooking_regdate()} 결제</div>
										<div class="pgCard_product_wrapper">
											<div class="pgCard_product_header">
												<div class="pgCard_img_wrapper">
													<div class="pgCard_product_img_wrapper">
														<img class="product_img" src="<%=request.getContextPath() %>/resources/upload/${clist[status.index].getClass_image()}">
													</div>
												</div>
												<div class="pgCard_product_info">
													<div class="pgCard_header_product_title">${clist[status.index].getClass_title()}</div>
												</div>
											</div>
										</div>
										<div class="pgCard_footer_wrapper">
											<div class="pgCard_footer_info">
												<span class="mypage_footer_txt_bottom">${olist[status.index].getOption_name()}</span>
												<span class="color_gray">사용가능</span>
											</div>
											<a href="<%=request.getContextPath()%>/mypage_reviewInsert.do?no=${dto.getBooking_num()}"
												class="mypage_reviewWrite_button"> 후기 생성
											</a>
											<a href="<%=request.getContextPath()%>/mypage_reviewWrite.do?no=${dto.getBooking_num()}"
												class="mypage_reviewWrite_button"> 후기 수정
											</a>
										</div>
										<div class="mypage_productDetail_wrapper">
											<a href="<%=request.getContextPath()%>/mypage_productDetail.do?no=${dto.getBooking_num()}"
												class="mypage__productDetail_button"> 상세 정보 
											</a>
										</div>
									</div>
								</c:forEach>
							</c:if>
									
									<!-- <nav aria-label="Page navigation example" class="coupon_footer">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Previous" style="color: black;"> <span
													aria-hidden="true">&laquo;</span></a></li>
	
											<li class="page-item active"><a class="page-link"
												href="#" style="color: white;">1</a></li>
											<li class="page-item"><a class="page-link" href="#"
												style="color: black;">2</a></li>
											<li class="page-item"><a class="page-link" href="#"
												style="color: black;">3</a></li>
	
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Next" style="color: black;"> <span
													aria-hidden="true">&raquo;</span></a></li>
										</ul>
									</nav> -->
								</div>
								
								
								
								<c:if test="${empty blist}">
									<!-- 내용이 없을경우 -->
									<div class="empty_wrapper">
										<img class="empty_icon" src="<%=request.getContextPath() %>/resources/image/mypage/emtpy.svg">
										<div class="empty_txt">사용 가능한 프립이 없어요</div>
									</div>
								</c:if>
								
								
							</div>
						</div>
					</div><!-- /내역 -->
				</div>
			
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>