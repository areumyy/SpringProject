<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/hostNotice_list.css" rel="stylesheet" />
</head>
<body>

	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
				
					<div class="notice_page">
						<div class="notice_header">
							<h2 class="notice_title">공지사항</h2>
						</div>
						<div class="notice_body">
							<div class="accordion" id="accordionExample">
								<ul class="notice_list">
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="dto">
											<li>
												<div class="notice_list_item">
													<div class="notice_item_title collapsed" data-bs-toggle="collapse" data-bs-target="#collapse${dto.getNotice_num() }" aria-expanded="false">${dto.getNotice_title() }</div>
													<div class="notice_item_regdate">${dto.getNotice_regdate() }</div>
												</div>
												<div class="notice_list_item_ans accordion-collapse collapse" id="collapse${dto.getNotice_num() }" data-bs-parent="#accordionExample" style="">
													${dto.getNotice_cont() }
												</div>
											</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
						
						<nav aria-label="Page navigation example" class="list_footer">
						<ul class="pagination">
							<c:if test="${Paging.getPage() > Paging.getBlock() }">
								<li class="page-item">
									<a class="page_link" href="hostNotice_list.do?page=1">
										<span aria-hidden="true">&laquo;</span>
									</a>
									<a class="page_link" href="hostNotice_list.do?page=${Paging.getPage() - 1 }">	
										<span aria-hidden="true">&lt;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
								<c:if test="${i == Paging.getPage() }">
									<li class="page-item"><a class="page_link paging_active">${i }</a></li>
								</c:if>
								<c:if test="${i != Paging.getPage() }">
									<li class="page-item"><a class="page_link" href="hostNotice_list.do?page=${i }">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
								<li class="page-item">
									<a class="page_link" href="hostNotice_list.do?page=${Paging.getPage() + 1 }">	
										<span aria-hidden="true">&gt;</span>
									</a>
									<a class="page_link" href="hostNotice_list.do?page=${Paging.getAllPage() }">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
					</div>
				
				</div>
			</div>
	
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
	
</body>
</html>