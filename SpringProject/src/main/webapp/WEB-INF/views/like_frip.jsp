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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<!-- CSS 파일 -->
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/like.css" rel="stylesheet"/>
<script language="javascript">
	document.title = "좋아요한 프립" ;
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
									<!-- ★ 클래스 상세보기 경로수정 필요 -->
									<a href="<%=request.getContextPath() %>/frip_content.do?num=${dto.getClass_num() }">
										<div class="class_info">
											<div class="place_like">
												<span class="class_place">${dto.getClass_endArea() }</span>
												<button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_on.svg"></button>
												<%-- <button type="button" class="like_btn"><img alt="class_like" src="<%=request.getContextPath() %>/resources/image/like/like_off.svg"></button> --%>
											</div>
											<!-- (클래스 사진) -->
											<img alt="${dto.getClass_image() }" src="<%=request.getContextPath() %>/resources/upload/${dto.getClass_image() }" class="class_img">
										</div>
										<div class="class_hash">${dto.getClass_hash() }</div>
										<div class="class_title">${dto.getClass_title() }</div>
										
										<c:if test="${optionCont[status.index].getOption_editPrice() eq 0 || optionCont[status.index].getOption_editPrice() eq optionCont[status.index].getOption_price()}">
											<div class="class_price"> 
												<fmt:formatNumber value="${optionCont[status.index].getOption_price() }" />원 
											</div>
										</c:if>
										<c:if test="${optionCont[status.index].getOption_editPrice() ne 0 && optionCont[status.index].getOption_editPrice() ne optionCont[status.index].getOption_price()}">
											<div class="class_price"> 
												<span><fmt:formatNumber value="${optionCont[status.index].getOption_editPrice() }" /> 원</span>
												<span class="class_editPrice"><fmt:formatNumber value="${optionCont[status.index].getOption_price() }" /></span>
											</div>
										</c:if>
										
										<div class="class_score">	
											<img alt="class_score" src="<%=request.getContextPath() %>/resources/image/like/star_icon.svg">
											<span> <fmt:formatNumber value="${classScore[status.index] }" pattern="0.0"/> </span>
										</div>
									</a>
								</div>
							</c:forEach>
						</c:if>
					</div>
					
					<c:if test="${empty classList }">
							<div class="likePage_list_none">
								<div>저장된 프립이 없습니다.</div>
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