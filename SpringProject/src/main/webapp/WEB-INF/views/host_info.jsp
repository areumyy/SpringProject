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

<script type="text/javascript">
	
	// 즉시 실행함수
	/* (function() {
		
		console.log('즉시실행 함수입니다');
		console.log($(".review_like_btn").length);
		
		for(var i=1; i<=10; i++) {
			
			var reviewNo = $("#like_btn" + count).val();
			var reviewNum = 1;
			
			console.log('reviewNo >>> ' + reviewNo);
			
			$.ajax({
	            type : "post",
	            url : '/controller/like_status_before.do', 
	            data : {"reviewNo": reviewNo},
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
	
	})(); */
	
	// 리뷰 좋아요 버튼 클릭시 실행함수
	function like_btn(reviewNum) {
		
		console.log('스크립트 호출 성공!');
		console.log('리뷰번호 >>> ' + reviewNum);
		
        $.ajax({
            type : "post",
            url : '/controller/like_status.do', 
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
	
	

</script>

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
					 	<select id="review_sort_option" class="review_search_option" onchange="review_sort()">
					 		<option value="score_high" >평점 높은순</option>
					 		<option value="score_low">평점 낮은순</option>
					 		<option value="score_new">최신순</option>
					 		<option value="scores_like">도움순</option>
					 	</select>
					 	
					 	<!-- 프립 탭 -->
					 	<div class="contbox cont01">
					 		<!-- key값 받기 -->
					 		<c:set var="hostClass" value="${hostClass }" />					<!-- 호스트가 운영하는 클래스 목록  -->
							<c:set var="hostClassOption" value="${hostClassOption }" />		<!-- 호스트가 운영하는 클래스 옵션 상세정보 (가격) -->
							<c:set var="hosfClassScore" value="${hosfClassScore }" />		<!-- 호스트가 운영하는 클래스 별 별점 -->
					
							<c:if test="${!empty hostClass }">
								<c:forEach items="${hostClass }" var="dto" varStatus="status">
							 		<div class="list_inner">
										<a href="">
											<div class="class_info">
												<div class="place_like">
													<span class="class_place">${dto.getClass_endArea() }</span>
													<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
													<%-- <button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button> --%>
												</div>
												<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
											</div>
											<div class="class_hash">${dto.getClass_hash() }</div>
											<div class="class_title">${dto.getClass_title() }</div>
											<div class="class_price"> <fmt:formatNumber value="${hostClassOption[status.index].getOption_price() }" />원 </div>
											<div class="class_score">
												<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
												<span> <fmt:formatNumber value="${hosfClassScore[status.index] }" pattern="0.0"/> </span>
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
					 		<c:set var="likeList" value="${like_list }" />			<!-- 좋아요 누른 리뷰번호 리스트 가져오기 -->
					 		
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
							      					<c:forEach begin="1" end="${dto2.getReview_score() }"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></c:forEach>
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
					
					<div class='RatingStar'>
					  <div class='RatingScore'>
					    <div class='outer-star'><div class='inner-star'></div></div>
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