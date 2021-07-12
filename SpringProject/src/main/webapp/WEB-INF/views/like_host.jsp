<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장_호스트</title>

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
							<a href="<%=request.getContextPath() %>/like_frip.do"><button type="button" class="like_menu_btn_off">프립</button></a>
						</div>
						<div class="menu_title">
							<a href="<%=request.getContextPath() %>/like_host.do"><button type="button" class="like_menu_btn_on">호스트</button></a>
						</div>
					</div>
					<div class="likePage_list2">
						<div class="list_inner2">
							<div class="inner_box">
								<a href="#" class="host_link">
									<div class="host_img">
										<img alt="host_img" src="<%=request.getContextPath() %>/resources/image/like/host_img.png">
									</div>
									<div class="host_info">
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
									<div class="like_host_btn">
										<button type="button" class="like_btn"><img alt="host_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg" class="like_btn_img"></button>
									</div>
								</a>
							</div>		
						</div>
						
						<div class="list_inner2">
							<div class="inner_box">
								<a href="#" class="host_link">
									<div class="host_img">
										<img alt="host_img" src="<%=request.getContextPath() %>/resources/image/like/host_img.png">
									</div>
									<div class="host_info">
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
									<div class="like_host_btn">
										<button type="button" class="like_btn"><img alt="host_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg" class="like_btn_img"></button>
									</div>
								</a>
							</div>		
						</div>
						
						<div class="list_inner2">
							<div class="inner_box">
								<a href="#" class="host_link">
									<div class="host_img">
										<img alt="host_img" src="<%=request.getContextPath() %>/resources/image/like/host_img.png">
									</div>
									<div class="host_info">
										<div class="host_info_detail1">
											<span class="host_name">크레이지서퍼스aaaaaaaaaaaaaaaaaaaaaaa</span>
											<img alt="arrow_icon" src="<%=request.getContextPath() %>/resources/image/like/arrow_icon.svg" class="arrow_icon">
											<img alt="superHost_badge" src="<%=request.getContextPath() %>/resources/image/like/superHost_badge.svg" class="superHost_badge">
										</div>
										<div class="host_info_detail2">
											<span class="frip_count">프립 5</span> | 
											<span class="review_count">후기 105</span> | 
											<span class="like_count">저장 62</span>
										</div>					
									</div>
									<div class="like_host_btn">
										<button type="button" class="like_btn"><img alt="host_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg" class="like_btn_img"></button>
									</div>
								</a>
							</div>		
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