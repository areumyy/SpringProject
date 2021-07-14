<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
												<span class="host_name">크레이지서퍼스</span>
												<img alt="arrow_icon" src="<%=request.getContextPath() %>/resources/image/like/arrow_icon.svg" class="arrow_icon">
												<img alt="superHost_badge" src="<%=request.getContextPath() %>/resources/image/like/superHost_badge.svg" class="superHost_badge">
											</div>
											<div class="host_info_detail2">
												<span class="frip_count">프립 5</span> | 
												<span class="review_count">후기 105</span> | 
												<span class="like_count">저장 62</span>
											</div>					
										</div>
										<div class="hostInfo_like_btn">
											<button type="button" class="like_btn"><img alt="host_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg" class="like_btn_img"></button>
										</div>
									</div>
								</div>		
							</div>
						</div>
						<div class="host_introduction">- 광안리 해수욕장에 위치, 윈드서핑 및 SUP(스탠드업패들보드) 강습 및 대여
													   - 겨울 시즌 무주리조트에서 스키,스노우보드 강습 및 대여
						</div>
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
					 		<div class="list_inner">
								<a href="">
									<div class="class_info">
										<div class="place_like">
											<span class="class_place">부산수영구</span>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button>
										</div>
										<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
									</div>
									<div class="class_hash">#부산패들보드#부산바다#부산놀거리</div>
									<div class="class_title">[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈</div>
									<div class="class_price">30,000원</div>
									<div class="class_socre">
										<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
										<span>4.92</span>
									</div>
								</a>
							</div>
							
							<div class="list_inner">
								<a href="">
									<div class="class_info">
										<div class="place_like">
											<span class="class_place">부산수영구</span>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button>
										</div>
										<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
									</div>
									<div class="class_hash">#부산패들보드#부산바다#부산놀거리</div>
									<div class="class_title">[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈</div>
									<div class="class_price">30,000원</div>
									<div class="class_socre">
										<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
										<span>4.92</span>
									</div>
								</a>
							</div>
							
							<div class="list_inner">
								<a href="">
									<div class="class_info">
										<div class="place_like">
											<span class="class_place">부산수영구</span>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button>
										</div>
										<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
									</div>
									<div class="class_hash">#부산패들보드#부산바다#부산놀거리</div>
									<div class="class_title">[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈</div>
									<div class="class_price">30,000원</div>
									<div class="class_socre">
										<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
										<span>4.92</span>
									</div>
								</a>
							</div>
							
							<div class="list_inner">
								<a href="">
									<div class="class_info">
										<div class="place_like">
											<span class="class_place">부산수영구</span>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button>
										</div>
										<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
									</div>
									<div class="class_hash">#부산패들보드#부산바다#부산놀거리</div>
									<div class="class_title">[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈</div>
									<div class="class_price">30,000원</div>
									<div class="class_socre">
										<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
										<span>4.92</span>
									</div>
								</a>
							</div>
							
							<div class="list_inner">
								<a href="">
									<div class="class_info">
										<div class="place_like">
											<span class="class_place">부산수영구</span>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button>
										</div>
										<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
									</div>
									<div class="class_hash">#부산패들보드#부산바다#부산놀거리</div>
									<div class="class_title">[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈</div>
									<div class="class_price">30,000원</div>
									<div class="class_socre">
										<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
										<span>4.92</span>
									</div>
								</a>
							</div>
							
							<div class="list_inner">
								<a href="">
									<div class="class_info">
										<div class="place_like">
											<span class="class_place">부산수영구</span>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
											<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button>
										</div>
										<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
									</div>
									<div class="class_hash">#부산패들보드#부산바다#부산놀거리</div>
									<div class="class_title">[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈</div>
									<div class="class_price">30,000원</div>
									<div class="class_socre">
										<img alt="class_socre" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
										<span>4.92</span>
									</div>
								</a>
							</div>
					 	</div>
					 	
					 	<!-- 후기 탭 -->
					 	<div class="contbox cont02">
					 		<div class="host_riview_box">
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
					      	
					      	<div class="host_riview_box">
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
					      	
					      	<div class="host_riview_box">
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