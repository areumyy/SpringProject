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
	document.title = "회원 출석 관리" ;
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
					<h1 class="Main_title">출석부</h1><br>
					<h2> ${cList.getClass_title() }&nbsp; ${cList.getClass_startDate().substring(0,10) }</h2>
			
					<div class="cont_frame">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">신청자명</th>
						      <th scope="col">연락처</th>
						      <th scope="col">구매 옵션</th>
						      <th scope="col">출석내역</th>
						      <th scope="col">상태</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:set var="list" value="${bList }"/>
						  <c:if test="${!empty list }">
							  <c:forEach items="${bList }" var="dto">
							    <tr>
							      <th scope="row">${dto.getMem_name() }</th>
							      <td>${dto.getMem_phone() }</td>
							      <td>${dto.getOption_name() }</td>
							      <c:if test="${dto.getBooking_enterCheck() == 'no' }">
							     	 <td>0/1</td>
								     <td><a href="entercheck.do?class_num=${dto.getBooking_classNum() }&booking_num=${dto.getBooking_num() }&page=${Paging.getPage()}">출석</a></td>
							      </c:if>
							      <c:if test="${dto.getBooking_enterCheck() == 'yes' }">
							     	 <td>1/1</td>
								     <td><a href="entercancel.do?class_num=${dto.getBooking_classNum() }&booking_num=${dto.getBooking_num() }&page=${Paging.getPage()}">출석 취소하기</a></td>
							      </c:if>
							    </tr>
							  </c:forEach>
						  </c:if>
						  <c:if test="${empty list }">
						  <tr>
						  	<td colspan="5">
						  		출석을 관리할 회원이 없습니다.
						  	</td>
						  </tr>
						  </c:if>						  
						  </tbody>
						</table>
					</div>
				
					<nav aria-label="Page navigation example" class="qna_list_footer">
					<ul class="pagination">
						<c:if test="${Paging.getPage() > Paging.getBlock() }">
							<li class="page-item">
								<a class="page_link" href="hostAttendance_member.do?page=1">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
							<c:if test="${i == Paging.getPage() }">
								<li class="page-item"><a class="page_link active">${i }</a></li>
							</c:if>
							<c:if test="${i != Paging.getPage() }">
								<li class="page-item"><a class="page_link" href="hostAttendance_member.do?page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
							<li class="page-item">
								<a class="page-link" href="hostAttendance_member.do?page=${Paging.getAllPage() }" style="color: black;">
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