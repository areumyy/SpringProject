<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트_후기관리</title>

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
<link href="<%=request.getContextPath()%>/resources/css/hostReview.css" rel="stylesheet" />

</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<div class="Main_title_box">
						<h1 class="Main_title">후기관리</h1>
						<select name="frip_list">
							<option value="">전체</option>
							<option>프립명</option>
						</select>
					</div>
					<div class="info_frame">
						<div class="review_header">
							<div>평균 평점</div>
							<div><img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%23E6E6E6' fill-rule='evenodd' d='M8.032 12.715l-4.72 2.482.9-5.257L.394 6.217l5.279-.767L8.032.667l2.361 4.783 5.279.767-3.82 3.723.902 5.257z'/%3E %3C/svg%3E"></div>
							<div>4.96 (총 2개)</div>
						</div>
						
						<!-- 아코디언 -->
						<div>
							<div class="accordion" id="accordionExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingOne">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							        
							        <div class="host_review_box">
							      		<div class="user_info">
							      			<div class="user_img_box">
							      				<img alt="user_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
							      			</div>
							      			<div class="user_detail">
							      				<div class="user_name">춘식이</div>
							      				<div>
							      					<span class="review_score"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></span>
							      					<span class="review_regdate">2021년 7월 12일 16:05 작성</span>
							      				</div>
							      			</div>
							      		</div>
							      	</div>
							        
							        
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							      
							      	<div class="host_review_box">
							      		<div class="review_cont">크레이지서퍼스 최고에요❤️  그리고 아침 바다의 고요함을 느끼는것 자체가 힐링이였어요! 강추합니다!! 담에 또 봬요👍🏻👍🏻</div>
							      		<div class="booking_info">
							      			<div class="class_name">[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈 SUP(패들보드)</div>
							      			<div class="class_startDate">
							      				<span>2021년 6월 24일 오전 6:00 참여</span>
							      				<span>| 참가비 (1인)</span>
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
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingTwo">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							        Accordion Item #2
							      </button>
							    </h2>
							    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingThree">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							        Accordion Item #3
							      </button>
							    </h2>
							    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
							      </div>
							    </div>
							  </div>
							</div>
						</div> <!-- 아코디언 end -->
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>