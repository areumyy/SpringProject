<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 반응형 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link href="<%=request.getContextPath()%>/resources/css/adminMenuBar.css" rel="stylesheet" />
	
</head>
<body>
	<header class="hostMenuBar">
			<a class="homeButton" href="<%=request.getContextPath()%>/admin_frip_pass.do">
				<img src="<%=request.getContextPath()%>/resources/logo/logo.png"
				width="80px" height="30px" alt="?"> 관리자 페이지
			</a>
			<div class="userInfo">
				<a class="userName" href="<%=request.getContextPath()%>/admin_frip_pass.do">
					<!-- 유저 프로필사진 + 닉네임 -->
				</a>
			</div>
		</header>

</body>
</html>