<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<%=request.getContextPath()%>/resources/css/hostMenuBar.css"
	rel="stylesheet" />
</head>
<body>
	<header class="hostMenuBar">
			<a class="homeButton" href="<%=request.getContextPath()%>/hostMain.do?loginNum=${loginDto.getMem_num()}">
				<img src="<%=request.getContextPath()%>/resources/logo/logo.png"
				width="80px" height="30px" alt="?"> 호스트 관리 페이지
			</a>
			<div class="userInfo">
				<a class="userName" href="<%=request.getContextPath() %>/hostUpdateMem.do">
						<c:if test="${loginDto.getMem_profileimg() == null}">
							<img class="img_style"
								src="<%=request.getContextPath() %>/resources/image/mypage/profile/profile_no_img.jpg" width="50px" height="50px" style="border-radius: 50px;">
						</c:if>
						<c:if test="${loginDto.getMem_profileimg() != null}">
							<img class="img_style"
								src="<%=request.getContextPath() %>/resources/image/mypage/profile/${loginDto.getMem_profileimg() }" width="50px" height="50px" style="border-radius: 50px;">
						</c:if>
					${loginDto.getMem_nick() }
				</a>
			</div>
		</header>

</body>
</html>