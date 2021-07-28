<%@page import="java.util.ArrayList"%>
<%@page import="com.market.model.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/admin_notice.css" rel="stylesheet" />
</head>
<script type="text/javascript">
window.onload = function(){
	<% 
		String sort = (String)request.getAttribute("sort");
		if(sort.equals("total")){
	%>
	$("#sort_total").addClass('active');
	<% } else if(sort.equals("host")) { %>
	$("#sort_host").addClass('active');
	<% } else if(sort.equals("member")){ %>
	$("#sort_member").addClass('active');
	<%} %>
		
}
</script>
<script type="text/javascript">
function delCheck(target){
	if(confirm("정말 삭제하시겠습니까?")){
		window.location.href="<%=request.getContextPath() %>/notice_del.do?notice_num=" + target + "&sort=${sort}";
	}
}
</script>
<body>

	<div class="mainFrame">
		<jsp:include page="../include/adminMenuBar.jsp"></jsp:include>

		<div class="Frame">
			<div class="Frame_Frame">
				<jsp:include page="../include/adminSideBar.jsp"></jsp:include>
				<div class="Main">
				
					<div class="notice_page">
						<div class="notice_header">
							<h2 class="notice_title">공지사항 관리</h2>
							<div>
								<input type="button" class="btn btn-primary" value="공지사항 등록" onclick="location.href='admin_notice_insert.do'">
							</div>
						</div>
						<div class="notice_cate">
							<a href="<%=request.getContextPath() %>/admin_notice.do?sort=total" class="cate_item" id="sort_total">전체</a>
							<a href="<%=request.getContextPath() %>/admin_notice.do?sort=host" class="cate_item" id="sort_host">호스트</a>
							<a href="<%=request.getContextPath() %>/admin_notice.do?sort=member" class="cate_item" id="sort_member">회원</a>
						</div>
						<div class="notice_body">
							
							<div class="accordion" id="accordionExample">
								<ul class="notice_list">
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="dto">
											<li>
												<div class="notice_list_item">
													<c:if test="${dto.getNotice_flag() == 1 }">
														<div class="badge_host">호스트</div>
													</c:if>
													<c:if test="${dto.getNotice_flag() == 0 }">
														<div class="badge_member">회원</div>
													</c:if>
													<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse${dto.getNotice_num() }" aria-expanded="true">${dto.getNotice_title() }</div>
													<div class="notice_item_regdate">${dto.getNotice_regdate() }</div>
												</div>
												<div class="notice_list_item_ans accordion-collapse collapse" style='white-space: pre-line;' id="collapse${dto.getNotice_num() }" data-bs-parent="#accordionExample">
													${dto.getNotice_cont() }
													<div class="notice_btn_div">
														<input type="button" style="margin-right: 10px;" class="btn btn-outline-success" value="수정" onclick="location.href='notice_edit.do?notice_num=${dto.getNotice_num()}&sort=${sort }&page=${Paging.getPage() }'">
														<input type="button" class="btn btn-outline-danger" value="삭제" onclick="delCheck(${dto.getNotice_num()});">
													</div>
												</div>
											</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				
					<nav aria-label="Page navigation example" class="list_footer">
						<ul class="pagination">
							<c:if test="${Paging.getPage() > Paging.getBlock() }">
								<li class="page-item">
									<a class="page_link" href="admin_notice.do?page=1&sort=${sort }">
										<span aria-hidden="true">&laquo;</span>
									</a>
									<a class="page_link" href="admin_notice.do?page=${Paging.getPage() - 1 }&sort=${sort}">	
										<span aria-hidden="true">&lt;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
								<c:if test="${i == Paging.getPage() }">
									<li class="page-item"><a class="page_link paging_active">${i }</a></li>
								</c:if>
								<c:if test="${i != Paging.getPage() }">
									<li class="page-item"><a class="page_link" href="admin_notice.do?page=${i }&sort=${sort}">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
								<li class="page-item">
									<a class="page_link" href="admin_notice.do?page=${Paging.getPage() + 1 }&sort=${sort}">	
										<span aria-hidden="true">&gt;</span>
									</a>
									<a class="page_link" href="admin_notice.do?page=${Paging.getAllPage() }&sort=${sort}">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
					
				</div>
			</div>
		</div>
				<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>