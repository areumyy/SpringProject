<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/login.css" rel="stylesheet"/>

</head>
<body>
	
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
				<div class="login_join_box">
					<div class="login_join_inner">
						<div>
							<h3 class="login_join_title">로그인</h3>
						</div>
						
						<form method="post" action="<%=request.getContextPath() %>/login_ok.do">
							<ul class="loginForm">
								<li>
									<input type="text" name="memId" class="loginForm_txt" placeholder="아이디" required>
								</li>
								<li>
									<input type="password" name="memPwd" class="loginForm_txt" placeholder="비밀번호" required>
								</li>
							</ul>
							<a href="<%=request.getContextPath() %>/pwd_search.do" class="pwd_search">비밀번호 찾기</a><br>
							<input type="submit" value="로그인" class="login_btn">		
						</form>
						
						<div class="another_loginBox">
							<span>다른방식으로 로그인</span>
							<div class="another_btnBox">
								<button type="button" class="another_btn"><img class="another_btn_img" alt="kakaoLogin" src="resources/image/kakaoLogin_logo.png"></button>
								<button type="button" class="another_btn"><img class="another_btn_img" alt="facebookLogin" src="resources/image/facebookLogin_logo.png"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

	<script src="./resources/js/login.js"></script>
	
</body>
</html>