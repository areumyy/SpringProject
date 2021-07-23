<%@page import="java.time.DayOfWeek"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>memFripContent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/frip_content.css" rel="stylesheet"/>
</head>
<body>
	
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
	
			<div align="center">
				<hr width="50%" color="blue">
					<h3>test</h3>
				<hr width="50%" color="blue">
				<br> <br>
				
				<table border="1" cellspacing="0" width="500">
					<tr>
						<th>클래스번호</th>
						<th>1차 카테고리</th>
						<th>2차 카테고리</th>
						<th>클래스제목</th>
					</tr>
					
					<jsp:useBean id="weekago" class="java.util.Date" />
					<jsp:setProperty name="weekago" property="time" value="${weekago.time - 60*60*24*1000*7}"/>
					<c:set var="list" value="${List }" />
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
						
							<tr>
								<td>${dto.getClass_num() }</td>
								<td>${dto.getClass_regdate() }</td>
								<td>
									<fmt:formatDate var="weekago1" value="${weekago }" pattern="yyyy-MM-dd HH:mm:ss" />
									${weekago1}
								</td>
								<c:if test="${dto.getClass_regdate() > weekago1}">
									<td>no</td>
								</c:if>
								<c:if test="${dto.getClass_regdate() < weekago1}">
									<td>new</td>
								</c:if>
								
							</tr>
						</c:forEach>
					</c:if>
		
					<c:if test="${empty list }">
						<tr>
							<td colspan="4" align="center">
								<h3>검색된 게시물이 없습니다.....</h3>
							</td>
						</tr>
					</c:if>
		
					<tr>
						<td colspan="4" align="right"><input type="button" value="글쓰기"
							onclick="location.href='board_write.do'"></td>
					</tr>
				</table>
		
			</div>
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>