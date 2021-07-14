<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link
	href="<%=request.getContextPath()%>/resources/css/hostMenuBar.css"
	rel="stylesheet" />
	
</head>
<body>
	<header class="hostMenuBar">
			<a class="homeButton" href="<%=request.getContextPath()%>/hostMain.do">
				<img src="<%=request.getContextPath()%>/resources/logo/logo.png"
				width="80px" height="30px" alt="?"> 호스트 관리 페이지
			</a>
			<div class="userInfo">
				<a class="userName" href="<%=request.getContextPath()%>/hostInfo.do">
					<!-- 유저 프로필사진 + 닉네임 -->
				</a>
			</div>
		</header>

</body>
</html>