<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<!-- key값 받기 -->
						<c:set var="classList" value="${likeClassList }" />		<!-- 클래스 찜 리스트 -->
						<c:set var="optionCont" value="${optionCont }" />		<!-- 찜 클래스 옵션 상세정보 (옵션가격 적용) -->
						<c:set var="classScore" value="${classScore }" />		<!-- 찜 클래스 별 별점 -->
						
						<c:if test="${!empty classList }">
							<c:forEach items="${classList }" var="dto" varStatus="status">
								<div class="list_inner">
									<a href="#">
										<div class="class_info">
											<div class="place_like">
												<span class="class_place">${dto.getClass_endArea() }</span>
												<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
												<%-- <button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button> --%>
											</div>
											<!-- 사진 수정필요 -->
											<img alt="class_img" src="<%=request.getContextPath() %>/resources/image/like/class_img.jpg" class="class_img">
										</div>
										<div class="class_hash">${dto.getClass_hash() }</div>
										<div class="class_title">${dto.getClass_title() }</div>
										<div class="class_price"> <fmt:formatNumber value="${optionCont[status.index].getOption_price() }" />원 </div>
										<div class="class_score">	
											<img alt="class_score" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
											<span> <fmt:formatNumber value="${classScore[status.index] }" pattern="0.0"/> </span>
										</div>
									</a>
								</div>
							</c:forEach>
							
						</c:if>
						
						<c:if test="${empty classList }">
							<h1>저장된 프립이 없습니다.</h1>
						</c:if>
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