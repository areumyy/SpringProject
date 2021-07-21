<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트_상세</title>

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
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/like.css" rel="stylesheet"/>

</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
				<div class="likePage_box">
					<!-- 호스트 정보 -->
					<!-- key값 받기 -->
					<c:set var="hostCont" value="${hostCont }" />			<!-- 호스트 소개(소개내용) -->
					<c:set var="hostInfo" value="${hostInfo }" />			<!-- 호스트 상세정보 (이름/프로필) -->
					<c:set var="classCount" value="${classCount }" />		<!-- 호스트가 운영하는 클래스 개수 -->
					<c:set var="reviewCount" value="${reviewCount }" />		<!-- 호스트 후기 개수 -->
					<c:set var="likeCount" value="${likeCount }" />			<!-- 호스트 찜 개수 -->
					
					<div class="host_box">
						<div class="likePage_list2">
							<div class="hostInfo_inner">
								<div class="hosfInfo_box">
									<div class="host_link">
										<div class="hostInfo_img">
											<img alt="host_img" src="<%=request.getContextPath() %>/resources/image/like/host_img.png">
										</div>
										<div class="hostInfo_detail">
											<div class="host_info_detail1">
												<span class="host_name">${hostInfo.getMem_name() }</span>
												<img alt="arrow_icon" src="<%=request.getContextPath() %>/resources/image/like/arrow_icon.svg" class="arrow_icon">
												<img alt="superHost_badge" src="<%=request.getContextPath() %>/resources/image/like/superHost_badge.svg" class="superHost_badge">
											</div>
											<div class="host_info_detail2">
												<span class="frip_count">프립 ${classCount }</span>
												<span class="divide_span">|</span>
												<span class="review_count">후기 ${reviewCount }</span>
												<span class="divide_span">|</span>
												<span class="like_count">저장 ${likeCount }</span>
											</div>					
										</div>
										<div class="hostInfo_like_btn">
											<button type="button" class="like_btn"><img alt="host_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg" class="like_btn_img"></button>
										</div>
									</div>
								</div>		
							</div>
						</div>
						<div class="host_introduction">${hostCont.getHost_cont() }</div>
						<span class="host_introduction_more">더보기</span>
					</div>
					
					<!-- 탭 메뉴 - 프립/후기 -->
					<div class="tab_content">
					 	<input type="radio" name="tab_menu" id="tab01" checked>
					 	<label for="tab01">프립</label>
					 	<input type="radio" name="tab_menu" id="tab02">
					 	<label for="tab02">후기</label>
					 	<select name="review_search_option" class="review_search_option">
					 		<option value="socre_high">평점 높은순</option>
					 		<option value="socre_row">평점 낮은순</option>
					 		<option value="socre_new">최신순</option>
					 		<option value="socre_helpful">도움순</option>
					 	</select>
					 	
					 	<!-- 프립 탭 -->
					 	<div class="contbox cont01">
					 		<!-- key값 받기 -->
					 		<c:set var="hostClass" value="${hostClass }" />					<!-- 호스트가 운영하는 클래스 목록  -->
							<c:set var="hostClassOption" value="${hostClassOption }" />		<!-- 호스트가 운영하는 클래스 옵션 상세정보 (가격) -->
					
							<c:if test="${!empty hostClass }">
								<c:forEach items="${hostClass }" var="dto" varStatus="status">
							 		<div class="list_inner">
										<a href="">
											<div class="class_info">
												<div class="place_like">
													<span class="class_place">${dto.getClass_endArea() }</span>
													<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
													<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button>
												</div>
												<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
											</div>
											<div class="class_hash">${dto.getClass_hash() }</div>
											<div class="class_title">${dto.getClass_title() }</div>
											<div class="class_price"> <fmt:formatNumber value="${hostClassOption[status.index].getOption_price() }" />원 </div>
											<div class="class_socre">
												<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
												<span>4.92</span>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty hostClass }">
								<h1>저장된 프립이 없습니다.</h1>
							</c:if>
					 	</div>
					 	
					 	<!-- 후기 탭 -->
					 	<div class="contbox cont02">
					 		<!-- key값 받기 -->
					 		<c:set var="classReview1" value="${classReview1 }" />	<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드1 (회원이름/회원프로필/리뷰내용/리뷰작성일) -->
					 		<c:set var="classReview2" value="${classReview2 }" />	<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명) -->
					 		<c:set var="classReview3" value="${classReview3 }" />	<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명/시작날짜/끝날짜) -->
					 		
					 		<c:if test="${!empty classReview1 }">
					 			<c:forEach items="${classReview1 }" var="dto2" varStatus="status">
							 		<div class="host_review_box">
							      		<div class="user_info">
							      			<div class="user_img_box">
							      				<!-- 사진 수정필요 -->
							      				<img alt="user_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
							      			</div>
							      			<div class="user_detail">
							      				<div class="user_name">${dto2.getMem_name() }</div>
							      				<div>
							      					<span class="review_score"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></span>
							      					<span class="review_regdate">${dto2.getReview_regdate() } 작성</span>
							      				</div>
							      			</div>
							      		</div>
							      		<div class="review_cont">${dto2.getReview_cont() }</div>
							      		<div class="booking_info">
							      			<div class="class_name">${classReview2[status.index].getClass_title() }</div>
							      			<div class="class_startDate">
							      				<span>${classReview3[status.index].getOption_startDate() } ~ ${classReview3[status.index].getOption_endDate() }</span>
							      				<span> | ${classReview3[status.index].getOption_name() }</span>
							      			</div>
							      		</div>
							      		<div class="review_like">
							      			<button type="button" class="review_like_btn">
							      				<span class="review_like_count">도움이 됐어요 0</span>
							      				<img alt="review_like_icon" src="<%=request.getContextPath() %>/resources/image/like/review_like_icon.svg">
							      			</button>
							      		</div>
							      		<div class="review_image_box">
							      			<img alt="review_image" src="<%=request.getContextPath() %>/resources/image/like/review_image.jpg" class="review_image">
							      		</div>
							      	</div>
							      </c:forEach>
						     </c:if>
						     
						     <c:if test="${empty classReview1 }">
								<h1>저장된 호스트가 없습니다.</h1>
							</c:if>
					 	</div>
					</div>
					
					<!-- 페이징 처리 -->
					<nav aria-label="Page navigation example" class="like_page_footer">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous" style="color: black;"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item active"><a class="page-link" href="#" style="color: white;">1</a></li>
							<li class="page-item"><a class="page-link" href="#" style="color: black;">2</a></li>
							<li class="page-item"><a class="page-link" href="#" style="color: black;">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next" style="color: black;"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

</body>
</html>