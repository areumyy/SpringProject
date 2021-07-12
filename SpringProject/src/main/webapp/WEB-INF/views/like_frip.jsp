<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장_프립</title>

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
					<div class="likePage_menu">
						<div class="menu_title">
							<a href="<%=request.getContextPath() %>/like_frip.do"><button type="button" class="like_menu_btn_on">프립</button></a>
						</div>
						<div class="menu_title">
							<a href="<%=request.getContextPath() %>/like_host.do"><button type="button" class="like_menu_btn_off">호스트</button></a>
						</div>
					</div>
					<div class="likePage_list">
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
								<div class="class_star">
									<img alt="class_star" src="<%=request.getContextPath() %>/resources/image/like/star_logo.svg">
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
								<div class="class_star">
									<img alt="class_star" src="<%=request.getContextPath() %>/resources/image/like/star_logo.svg">
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
								<div class="class_star">
									<img alt="class_star" src="<%=request.getContextPath() %>/resources/image/like/star_logo.svg">
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
								<div class="class_star">
									<img alt="class_star" src="<%=request.getContextPath() %>/resources/image/like/star_logo.svg">
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
								<div class="class_star">
									<img alt="class_star" src="<%=request.getContextPath() %>/resources/image/like/star_logo.svg">
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
								<div class="class_star">
									<img alt="class_star" src="<%=request.getContextPath() %>/resources/image/like/star_logo.svg">
									<span>4.92</span>
								</div>
							</a>
						</div>
					</div>
						
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