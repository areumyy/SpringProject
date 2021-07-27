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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<!-- CSS 파일 -->
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/like.css" rel="stylesheet"/>

<script type="text/javascript">

	// 호스트 소개 더보기.. 실행함수
	$(document).ready(function(){
	
	    $('.host_introduction_box').each(function(){
	        var content = $(this).children('.host_introduction');
	        var content_txt = content.text();
	        var content_txt_short = content_txt.substring(0,100)+"...";
	        var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');
	
	        $(this).append(btn_more);
	        
	        if(content_txt.length >= 100){
	            content.html(content_txt_short)
	            
	        }else{
	            btn_more.hide()
	        }
	        
	        btn_more.click(toggle_content);
	        
	        function toggle_content(){
	            if($(this).hasClass('short')){
	                // 접기 상태
	                $(this).html('더보기');
	                content.html(content_txt_short);
	                $(this).removeClass('short');
	            }else{
	                // 더보기 상태
	                $(this).html('접기');
	                content.html(content_txt);
	                $(this).addClass('short');
	
	            }
	        }
	    });
	});
	
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
											<!-- 사진수정 필요(호스트=유저 사진) -->
											<img alt="${hostInfo.getMem_profileimg() }" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${hostInfo.getMem_profileimg() }" class="host_img" >
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
						<div class="host_introduction_box">
						    <div class="host_introduction">
						   		${hostCont.getHost_cont() }
						    </div>
						</div>
					</div>
					
					<!-- 탭 메뉴 - 프립/후기 -->
					<div class="tab_content">
					 	<input type="radio" name="tab_menu" id="tab01" checked>
					 	<label for="tab01">프립</label>
					 	<input type="radio" name="tab_menu" id="tab02">
					 	<label for="tab02">후기</label>
					 	<form action="<%=request.getContextPath() %>/review_sort.do" method="get" class="review_search_option">
					 		<input type="hidden" name="hostMemNum" value="${hostCont.getHost_memNum() }">
						 	<select id="review_sort_option" name="sort" class="select_box" onchange="this.form.submit()">
						 		<option value="">:: 댓글 정렬 ::</option>
						 		<option value="score_high">평점 높은순</option>
						 		<option value="score_low">평점 낮은순</option>
						 		<option value="score_new">최신순</option>
						 		<option value="score_like">도움순</option>
						 	</select>
					 	</form>
					 	
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
												<!-- 사진 수정필요(클래스 사진) -->
												<img alt="${dto.getClass_image() }" src="<%=request.getContextPath() %>/resources/image/like/${dto.getClass_image() }" class="class_img">
											</div>
											<div class="class_hash">${dto.getClass_hash() }</div>
											<div class="class_title">${dto.getClass_title() }</div>
											
											<c:if test="${hostClassOption[status.index].getOption_editPrice() eq null }">
												<div class="class_price"> 
													<fmt:formatNumber value="${hostClassOption[status.index].getOption_price() }" />원
												</div>
											</c:if>
											<c:if test="${hostClassOption[status.index].getOption_editPrice() ne null }">
												<div class="class_price"> 
													<span><fmt:formatNumber value="${hostClassOption[status.index].getOption_price() }" /></span>
													<span class="class_editPrice"><fmt:formatNumber value="${hostClassOption[status.index].getOption_editPrice() }" />원</span>
												</div>
											</c:if>
											
											<div class="class_score">
												<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
												<span> <fmt:formatNumber value="${hosfClassScore[status.index] }" pattern="0.0"/> </span>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
							
							<c:if test="${empty hostClass }">
								<h3>저장된 프립이 없습니다.</h3>
							</c:if>
					 	</div>
					 	
					 	<!-- 후기 탭 -->
					 	<div class="contbox cont02">
					 		<!-- key값 받기 -->
					 		<c:set var="classReview1" value="${classReview1 }" />	<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드1 (회원이름/회원프로필/리뷰내용/리뷰작성일/시작날짜/끝날짜) -->
					 		<c:set var="classReview2" value="${classReview2 }" />	<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명) -->
					 		<c:set var="classReview3" value="${classReview3 }" />	<!-- 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명) -->
					 		<c:set var="likeList" value="${like_list }" />			<!-- 좋아요 누른 리뷰번호 리스트 가져오기 -->
					 		
					 		<c:if test="${!empty classReview1 }">
					 			<c:forEach items="${classReview1 }" var="dto2" varStatus="status">
							 		<div class="host_review_box">
							      		<div class="user_info">
							      			<div class="user_img_box">
							      				<!-- 사진 수정필요(유저 사진) -->
							      				<img alt="${dto2.getMem_profileImg() }" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${dto2.getMem_profileImg() }" class="user_img">
							      			</div>
							      			<div class="user_detail">
							      				<div class="user_name">${dto2.getMem_name() }</div>
							      				<div>
							      					<c:forEach begin="1" end="${dto2.getReview_score() }"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></c:forEach>
							      					<span class="review_regdate">${dto2.getReview_regdate().substring(0,10) } 작성</span>
							      				</div>
							      			</div>
							      		</div>
							      		<div class="review_cont">${dto2.getReview_cont() }</div>
							      		<div class="booking_info">
							      			<div class="class_name">${classReview2[status.index].getClass_title() }</div>
							      			<c:if test="${classReview2[status.index].getClass_endDate() eq null}">
								      			<div class="class_startDate">
								      				<span>${classReview2[status.index].getClass_startDate() } 참여</span>
								      				<span> | ${classReview3[status.index].getOption_name() }</span>
								      			</div>
							      			</c:if>
							      			<c:if test="${classReview2[status.index].getClass_endDate() ne null}">
								      			<div class="class_startDate">
								      				<span>${classReview2[status.index].getClass_startDate() } ~ ${classReview2[status.index].getClass_endDate() } 참여</span>
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
							      </c:forEach>
						     </c:if>
						     
						     <c:if test="${empty classReview1 }">
								<h3>저장된 후기가 없습니다.</h3>
							</c:if>
					 	</div>
					</div>
					
					<div class='RatingStar'>
					  <div class='RatingScore'>
					    <div class='outer-star'><div class='inner-star'></div></div>
					  </div>
					</div>
					
					<!-- 페이징 처리 -->
					<%-- <nav aria-label="Page navigation example" class="list_footer">
						<ul class="pagination">
							<c:if test="${Paging.getPage() > Paging.getBlock() }">
								<li class="page-item">
									<a class="page_link" href="qna_list.do?page=1">
										<span aria-hidden="true">&laquo;</span>
									</a>
									<a class="page_link" href="qna_list.do?page=${Paging.getPage() - 1 }">	
										<span aria-hidden="true">&lt;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
								<c:if test="${i == Paging.getPage() }">
									<li class="page-item"><a class="page_link paging_active">${i }</a></li>
								</c:if>
								<c:if test="${i != Paging.getPage() }">
									<li class="page-item"><a class="page_link" href="qna_list.do?page=${i }">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
								<li class="page-item">
									<a class="page_link" href="qna_list.do?page=${Paging.getPage() + 1 }">	
										<span aria-hidden="true">&gt;</span>
									</a>
									<a class="page_link" href="qna_list.do?page=${Paging.getAllPage() }">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav> --%>
				</div>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

</body>
</html>