<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장_호스트</title>

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
<script language="javascript">
	document.title = "좋아요한 호스트" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
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
						<!-- key값 받기 -->
						<c:set var="hostList" value="${likeHostList }" />		<!-- 호스트 찜 리스트 --> 
						<c:set var="hostInfo" value="${hostInfo }" />			<!-- 찜 호스트 상세정보 (호스트 이름 적용) -->
						<c:set var="classCount" value="${classCount }" />		<!-- 호스트가 운영하는 클래스 개수 -->
						<c:set var="reviewCount" value="${reviewCount }" />		<!-- 호스트 후기 개수 -->
						<c:set var="likeCount" value="${likeCount }" />			<!-- 호스트 찜 개수 -->
						
						<c:if test="${!empty hostList }">
							<c:forEach items="${hostList }" var="dto" varStatus="status">
								<div class="list_inner2">
									<div class="inner_box">
										<a href="<%=request.getContextPath() %>/host_info.do?hostMemNum=${dto.getHost_memNum() }" class="host_link">
											<div>
												<!-- 사진 수정필요(호스트 사진) -->
												<img alt="${hostInfo[status.index].getMem_profileimg() }" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${hostInfo[status.index].getMem_profileimg() }" class="host_img">
											</div>
											<div class="host_info">
												<div class="host_info_detail1">
													<span class="host_name">${hostInfo[status.index].getMem_name() }</span>
													<img alt="arrow_icon" src="<%=request.getContextPath() %>/resources/image/like/arrow_icon.svg" class="arrow_icon">
													<c:if test="${classCount[status.index]  >= 3}">
														<img alt="superHost_badge" src="<%=request.getContextPath() %>/resources/image/like/superHost_badge.svg">
													</c:if>
												</div>
												<div class="host_info_detail2">
													<span class="frip_count">프립 ${classCount[status.index] }</span>
													<span class="divide_span">|</span>
													<span class="review_count">후기 ${reviewCount[status.index] }</span>
													<span class="divide_span">|</span>
													<span class="like_count">저장 ${likeCount[status.index] }</span>
												</div>					
											</div>
											<div class="like_host_btn">
												<button type="button" class="like_btn"><img alt="host_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg" class="like_btn_img"></button>
											</div>
										</a>
									</div>		
								</div>
							</c:forEach>
						</c:if>
					</div>
					
					<c:if test="${empty hostList }">
							<div class="likePage_list_none">
								<div>저장된 호스트가 없습니다.</div>
							</div>
					</c:if>
					
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