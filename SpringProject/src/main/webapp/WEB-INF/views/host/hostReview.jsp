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
						<div class="state">
							<div class="review_header">
								<div>평균 평점</div> 
								<div><img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%23E6E6E6' fill-rule='evenodd' d='M8.032 12.715l-4.72 2.482.9-5.257L.394 6.217l5.279-.767L8.032.667l2.361 4.783 5.279.767-3.82 3.723.902 5.257z'/%3E %3C/svg%3E"></div>
								<div>4.96 (총 3개)</div>
							</div>
							
							<!-- 아코디언 -->
							<div class="accordion accordion-flush" id="accordionFlushExample">
							  <!-- 1번째 -->
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-headingOne">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
							        <!-- 버튼 -->
							        <div class="host_review_box">
							      		<div class="user_info">
							      			<div class="user_img_box">
							      				<img alt="user_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
							      			</div>
							      			<div class="user_detail">
							      				<div class="user_name">
							      					<span>춘식이</span>
							      					<span class="review_score"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></span>
							      					<span class="review_regdate">2021년 6월 24일 오전 6:00 참여</span>
							      					<span class="frip_option_name">| 1인 이용권</span>
							      				</div>
							      			</div>
							      		</div>
							      	</div>
							      </button>
							    </h2>
							    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      	<!-- 후기내용 -->
							      	<div class="host_review_box">
							      		<div class="review_cont">크레이지서퍼스 최고에요❤️  그리고 아침 바다의 고요함을 느끼는것 자체가 힐링이였어요! 강추합니다!! 담에 또 봬요👍🏻👍🏻</div>
							      		<div class="booking_info">
							      			<div class="class_startDate">
							      				<span>2021년 7월 12일 16:05 작성</span>
							      			</div>
							      		</div>
							      		<div class="review_image_box">
							      			<img alt="review_image" src="<%=request.getContextPath() %>/resources/image/like/review_image.jpg" class="review_image">
							      		</div>
							        </div>
							        <!-- 호스트답변 -->
							        <div class="host_reply_box">
							      		<div class="host_info">
							      			<div class="host_img_box">
							      				<img alt="host_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
							      			</div>
							      			<div class="host_detail">
							      				<div class="host_name">
							      					<span>호스트</span>
							      					<span class="reply_regdate">2021년 6월 24일 6:00 작성</span>
							      				</div>
							      			</div>
							      		</div>
							      		<div class="reply_cont">정성가득한 후기 감사해요. 다음에도 날 좋은날 또 찾아주세요!</div>
							      	</div>
							      </div>
							   </div>
							  </div>
							  
							  <!-- 2번째 -->
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-headingTwo">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
							        <!-- 버튼 -->
							        <div class="host_review_box">
							      		<div class="user_info">
							      			<div class="user_img_box">
							      				<img alt="user_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
							      			</div>
							      			<div class="user_detail">
							      				<div class="user_name">
							      					<span>춘식이</span>
							      					<span class="review_score"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></span>
							      					<span class="review_regdate">2021년 6월 24일 오전 6:00 참여</span>
							      					<span class="frip_option_name">| 1인 이용권</span>
							      				</div>
							      			</div>
							      		</div>
							      	</div>
							      </button>
							    </h2>
							    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      	<!-- 내용 -->
							      	<div class="host_review_box">
							      		<div class="review_cont">크레이지서퍼스 최고에요❤️  그리고 아침 바다의 고요함을 느끼는것 자체가 힐링이였어요! 강추합니다!! 담에 또 봬요👍🏻👍🏻</div>
							      		<div class="booking_info">
							      			<div class="class_startDate">
							      				<span>2021년 7월 12일 16:05 작성</span>
							      			</div>
							      		</div>
							      		<div class="review_image_box">
							      			<img alt="review_image" src="<%=request.getContextPath() %>/resources/image/like/review_image.jpg" class="review_image">
							      		</div>
							        </div>
							      </div>
							   </div>
							  </div>
							  
							  <!-- 3번째 -->
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-headingThree">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
							        <!-- 버튼 -->
							        <div class="host_review_box">
							      		<div class="user_info">
							      			<div class="user_img_box">
							      				<img alt="user_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
							      			</div>
							      			<div class="user_detail">
							      				<div class="user_name">
							      					<span>춘식이</span>
							      					<span class="review_score"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></span>
							      					<span class="review_regdate">2021년 6월 24일 오전 6:00 참여</span>
							      					<span class="frip_option_name">| 1인 이용권</span>
							      				</div>
							      			</div>
							      		</div>
							      	</div>
							      </button>
							    </h2>
							    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      	<!-- 내용 -->
							      	<div class="host_review_box">
							      		<div class="review_cont">크레이지서퍼스 최고에요❤️  그리고 아침 바다의 고요함을 느끼는것 자체가 힐링이였어요! 강추합니다!! 담에 또 봬요👍🏻👍🏻</div>
							      		<div class="booking_info">
							      			<div class="class_startDate">
							      				<span>2021년 7월 12일 16:05 작성</span>
							      			</div>
							      		</div>
							      		<div class="review_image_box">
							      			<img alt="review_image" src="<%=request.getContextPath() %>/resources/image/like/review_image.jpg" class="review_image">
							      		</div>
							        </div>
							      </div>
							    </div>
							  </div>
						   </div> <!-- 아코디언 end  -->
						</div>
					</div>
				</div> <!-- class="Main" end -->
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>