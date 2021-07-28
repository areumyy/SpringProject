<%@page import="com.market.model.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>memFripContent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/frip_review.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />

			<div class="review_page">
				<div class="review_section">
					<header class="review_header">
						<div class="review_count">
							<div>
								후기 <span class="count_span">107</span>개
							</div>
						</div>
						<div class="star_div">
							<div class="star_section">
								<div class="star">
									<img src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg">
									<img src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg">
									<img src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg">
									<img src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg">
									<img src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg">
								</div>
								<span class="review_avg">4.99</span>
							</div>
						</div>
					</header>
					<div class="review_list">
						<div class="host_review_box">
	                        <div class="user_info">
	                           <div class="user_img_box">
	                              <!-- 사진 수정필요(유저 사진) -->
	                              <img alt="${dto2.getMem_profileImg() }" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${dto2.getMem_profileImg() }" class="user_img">
	                           </div>
	                           <div class="user_detail">
	                              <div class="user_name">이성욱</div>
	                              <div>
	                                 <c:forEach begin="1" end="4"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></c:forEach>
	                                 <span class="review_regdate">2021.07.07 작성</span>
	                              </div>
	                           </div>
	                        </div>
	                        <div class="review_cont">너무 재밌어요</div>
	                        <div class="booking_info">
	                           <div class="class_name">서핑교실</div>
	                           <c:if test="${classReview2[status.index].getClass_startDate() eq classReview2[status.index].getClass_endDate() }">
	                              <div class="class_startDate">
	                                 <span>${classReview2[status.index].getClass_startDate().substring(0,10) } 참여</span>
	                                 <span> | ${classReview3[status.index].getOption_name() }</span>
	                              </div>
	                           </c:if>
	                           <c:if test="${classReview2[status.index].getClass_startDate() ne classReview2[status.index].getClass_endDate()}">
	                              <div class="class_startDate">
	                                 <span>${classReview2[status.index].getClass_startDate().substring(0,10) } ~ ${classReview2[status.index].getClass_endDate().substring(0,10) } 참여</span>
	                                 <span> | ${classReview3[status.index].getOption_name() }</span>
	                              </div>
	                           </c:if>
	                        </div>
	                        <div class="review_like">
	                           <c:if test="${dto2.getReview_num() == likeList[status.index] }">
	                              <button type="button" class="review_like_btn" id="like_btn${status.count }" value="${dto2.getReview_num() }" onclick="like_btn(${dto2.getReview_num() })">
	                                 <span id="like_txt${dto2.getReview_num() }" class="review_like_on">도움이 됐어요 ${dto2.getReview_like() }</span>
	                                 <img id="like_btn_img${dto2.getReview_num() }" alt="review_like_icon" src="<%=request.getContextPath() %>/resources/image/like/review_like_on.svg">
	                              </button>
	                           </c:if>
	                           <c:if test="${dto2.getReview_num() != likeList[status.index] }">
	                              <button type="button" class="review_like_btn" id="like_btn${status.count }" value="${dto2.getReview_num() }" onclick="like_btn(${dto2.getReview_num() })">
	                                 <span id="like_txt${dto2.getReview_num() }" class="review_like_off">도움이 됐어요 ${dto2.getReview_like() }</span>
	                                 <img id="like_btn_img${dto2.getReview_num() }" alt="review_like_icon" src="<%=request.getContextPath() %>/resources/image/like/review_like_off.svg">
	                              </button>
	                           </c:if>
	                        </div>
	                        <div class="review_image_box">
	                           <!-- 사진 수정필요 (후기 사진)-->
	                           <img alt="${dto2.getReview_image() }" src="<%=request.getContextPath() %>/resources/image/like/${dto2.getReview_image() }" class="review_image">
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