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

<script type="text/javascript">

	// 리뷰 좋아요 버튼 클릭시 실행함수
	function like_btn(reviewNum) {
		
		console.log('스크립트 호출 성공!');
		console.log('리뷰번호 >>> ' + reviewNum);
		
        $.ajax({
            type : "post",
            url : '/controller/class_like_status.do', 
            data : {"reviewNum": reviewNum},
            dataType: 'json',
            error : function(error) {
                console.log("error");
            },
            success : function(data) {
                var state = data.state;
                var likeCount = data.likeCount;
                
                if(state == 1) {
                	document.getElementById('like_txt' + reviewNum).innerText = "도움이 됐어요 " + likeCount;
                	document.getElementById('like_txt' + reviewNum).style.color="#000000";
                	$("#like_btn_img" + reviewNum).attr("src", "./resources/image/like/review_like_off.svg");
                	
                } else if(state == 2) {
                	document.getElementById('like_txt' + reviewNum).innerText = "도움이 됐어요 " + likeCount;
                	document.getElementById('like_txt' + reviewNum).style.color="#3397FF";
                	$("#like_btn_img" + reviewNum).attr("src", "./resources/image/like/review_like_on.svg");
                }
            }
        }); 
	}
	
	// 로그인 세션값 가져오는 실행함수
	$(function() {
		<%
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
		%>
	})
	
	// 로그아웃 상태에서 리뷰 좋아요 버튼 클릭시 실행함수
	function like_btn_logOut() {
		alert('로그인 후 이용해주세요.');
	}
	
</script>

</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />

			<div class="review_page">
				<div class="review_section">
					<header class="review_header">
						<!-- key값 받기 -->
						<c:set var="reviewInfo" value="${reviewInfo }" />			<!-- 프립 리뷰 평점 평균 / 리뷰 갯수 -->
						<c:set var="reviewPercent" value="${reviewPercent}" />		<!-- 최고평점 비율(%) -->
						<c:set var="ReviewList" value="${ReviewList }" />			<!-- 프립후기 리스트를 가져오는 메서드 -->
					
						<div class="review_count">
							<div>
								후기 <span class="count_span">${reviewInfo.getReview_count() }</span>개
							</div>
						</div>
						<div class="star_div">
							<div class="star_section">
								<c:forEach begin="1" end="${reviewInfo.getReview_avg() }"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></c:forEach>
								<span class="review_avg">${reviewInfo.getReview_avg() }</span>
							</div>
						</div>
					</header>
					<!-- key값 받기 -->
			 		<c:set var="classReview" value="${classReview }" />		<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명/시작날짜/끝날짜) -->
			 		<c:set var="classReview2" value="${classReview2 }" />	<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명) -->
			 		
					
					<c:if test="${!empty ReviewList }">
						<c:forEach items="${ReviewList }" var="dto" varStatus="status">
							<div class="review_list">
								<div class="host_review_box">
			                        <div class="user_info">
			                           <div class="user_img_box">
			                              <!-- 사진 수정필요(유저 사진) -->
			                              <img alt="${dto.getMem_profileImg() }" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${dto.getMem_profileImg() }" class="user_img">
			                           </div>
			                           <div class="user_detail">
			                              <div class="user_name">${dto.getMem_nick() }</div>
			                              <div>
			                                 <c:forEach begin="1" end="${dto.getReview_score() }"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></c:forEach>
			                                 <span class="review_regdate">${dto.getReview_regdate() } 작성</span>
			                              </div>
			                           </div>
			                        </div>
			                        <div class="review_cont">${dto.getReview_cont() }</div>
			                        <div class="booking_info">
			                           <div class="class_name">${classReview[status.index].getClass_title() }</div>
			                           <c:if test="${classReview[status.index].getClass_startDate() eq classReview[status.index].getClass_endDate() }">
			                              <div class="class_startDate">
			                                 <span>${classReview[status.index].getClass_startDate().substring(0,10) } 참여</span>
			                                 <span> | ${classReview[status.index].getOption_name() }</span>
			                              </div>
			                           </c:if>
			                           <c:if test="${classReview[status.index].getClass_startDate() ne classReview[status.index].getClass_endDate()}">
			                              <div class="class_startDate">
			                                 <span>${classReview[status.index].getClass_startDate().substring(0,10) } ~ ${classReview[status.index].getClass_endDate().substring(0,10) } 참여</span>
			                                 <span> | ${classReview2[status.index].getOption_name() }</span>
			                              </div>
			                           </c:if>
			                        </div>
			                        <% if(dto != null) {%>
			                        	<!-- 로그인한 상태일 때 리뷰 좋아요 기능 O -->
			                        	<c:set var="likeList" value="${like_list }" />		<!-- 좋아요 누른 리뷰번호 리스트 가져오기 -->
			                        
				                        <div class="review_like">
				                           <c:if test="${dto.getReview_num() == likeList[status.index] }">
				                              <button type="button" class="review_like_btn" id="like_btn${status.count }" value="${dto.getReview_num() }" onclick="like_btn(${dto.getReview_num() })">
				                                 <span id="like_txt${dto.getReview_num() }" class="review_like_on">도움이 됐어요 ${dto.getReview_like() }</span>
				                                 <img id="like_btn_img${dto.getReview_num() }" alt="review_like_icon" src="<%=request.getContextPath() %>/resources/image/like/review_like_on.svg">
				                              </button>
				                           </c:if>
				                           <c:if test="${dto.getReview_num() != likeList[status.index] }">
				                              <button type="button" class="review_like_btn" id="like_btn${status.count }" value="${dto.getReview_num() }" onclick="like_btn(${dto.getReview_num() })">
				                                 <span id="like_txt${dto.getReview_num() }" class="review_like_off">도움이 됐어요 ${dto.getReview_like() }</span>
				                                 <img id="like_btn_img${dto.getReview_num() }" alt="review_like_icon" src="<%=request.getContextPath() %>/resources/image/like/review_like_off.svg">
				                              </button>
				                           </c:if>
				                        </div>
				                    <%} else if(dto == null) { %>
				                    	<!-- 로그인한 상태 아닐 때 리뷰 좋아요 기능 X -->
				                        <div class="review_like">
			                              <button type="button" class="review_like_btn" id="like_btn${status.count }" value="${dto.getReview_num() }" onclick="like_btn_logOut()">
			                                 <span id="like_txt${dto.getReview_num() }" class="review_like_off">도움이 됐어요 ${dto.getReview_like() }</span>
			                                 <img id="like_btn_img${dto.getReview_num() }" alt="review_like_icon" src="<%=request.getContextPath() %>/resources/image/like/review_like_off.svg">
			                              </button>
				                        </div>
				                    <%} %>
			                        <div class="review_image_box">
			                           <!-- 사진 수정필요 (후기 사진)-->
			                           <img alt="${dto.getReview_image() }" src="<%=request.getContextPath() %>/resources/image/like/${dto.getReview_image() }" class="review_image">
			                        </div>
			                     </div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>


			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

</body>
</html>