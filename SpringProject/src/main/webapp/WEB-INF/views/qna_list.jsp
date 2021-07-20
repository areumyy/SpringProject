<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/qna_list.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">

				<div class="qna_list_page">
					<h1 class="qna_list_title">자주 묻는 질문</h1>
					<form class="qna_search_form" method="post" action="<%=request.getContextPath()%>/qna_search.do">
						<img src="<%=request.getContextPath() %>/resources/image/menu/search.svg" class="qna_search_img">
						<input type="text" placeholder="키워드를 입력하세요" value="" name="keyword" autocomplete="off">
					</form>
					<div class="accordion" id="accordionExample">
					<ul class="qna_list">
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="dto">
								<li>
									<div class="qna_list_item" data-bs-toggle="collapse" data-bs-target="#collapse${dto.getQna_num() }" aria-expanded="true">${dto.getQna_title() }</div>
									<div class="qna_list_item_ans accordion-collapse collapse" id="collapse${dto.getQna_num() }" data-bs-parent="#accordionExample">
										${dto.getQna_cont() }
									</div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
					</div>
					<nav aria-label="Page navigation example" class="list_footer">
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
					</nav>
				</div>


			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>