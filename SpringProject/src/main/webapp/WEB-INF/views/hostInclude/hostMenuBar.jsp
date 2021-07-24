<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<a class="userName" href="<%=request.getContextPath()%>/hostInfo.do">
					<%-- <img src="프로필사진"
							width="30px" height="30px">--%>
					${loginDto.getMem_nick() }
				</a>
			</div>
		</header>

</body>
</html>