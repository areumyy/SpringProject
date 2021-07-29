<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostMain</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostAttendance.css"
	rel="stylesheet" />
<script language="javascript">
	document.title = "출석 관리" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
</head>
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<h1 class="Main_title">출석부</h1>
					<div class="cont_frame">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col" colspan="2">클래스 제목</th>
						      <th scope="col">일시</th>
						      <th scope="col" class="right">출결 관리</th>
						    </tr>
						  </thead>
						  <tbody>
						<c:set var="list" value="${cList }"/>
						<c:if test="${!empty list }">
							<c:forEach items="${cList }" var="dto" varStatus="index">
							    <tr>
							      <th scope="row">${(Paging.getPage()-1)*10 + index.count }</th>
							      <td colspan="2">${dto.getClass_title() }</td>
							      <td>${dto.getClass_startDate().substring(0,10) }</td>
							      <td class="right"><a href="<%=request.getContextPath()%>/hostAttendance_member.do?class_num=${dto.getClass_num()}">출결 관리</a></td>
							    </tr>
							 </c:forEach>
						 </c:if>
						 <c:if test="${empty list }">
							<tr>
								<td colspan="4">
						 			출석을 관리할 프립이 없습니다.
						 		</td>
						 	</tr>
						 </c:if>
						  </tbody>
						</table>
					</div>
					<!-- 페이징 처리 부분 -->
					<nav aria-label="Page navigation example" class="qna_list_footer">
						<ul class="pagination">
							<c:if test="${Paging.getPage() > Paging.getBlock() }">
								<li class="page-item">
									<a class="page_link" href="hostAttendance.do?page=1">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
								<c:if test="${i == Paging.getPage() }">
									<li class="page-item"><a class="page_link active">${i }</a></li>
								</c:if>
								<c:if test="${i != Paging.getPage() }">
									<li class="page-item"><a class="page_link" href="hostAttendance.do?page=${i }">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
								<li class="page-item">
									<a class="page-link" href="hostAttendance.do?page=${Paging.getAllPage() }" style="color: black;">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>