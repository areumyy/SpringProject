<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

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
							<h3 class="login_join_title">비밀번호 찾기</h3>
						</div>
						
						<form method="post" action="<%=request.getContextPath() %>/pwd_search_ok.do">
							<ul class="pwdSearchForm">
								<li>
									<input type="text" name="memId" class="pwdSearchForm_txt" placeholder="아이디(이메일)" required>
									<span class="notice">재설정하려는 비밀번호의 아이디(이메일)를 입력해주세요.</span>
								</li>
								<li><input type="text" name="memName" class="pwdSearchForm_txt" placeholder="이름" required></li>
							</ul>
							<input type="submit" value="비밀번호 찾기" class="submit_btn">		
						</form>
					</div>
				</div>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
	<!-- js 파일 -->
	<script src="./resources/js/login.js"></script>

</body>
</html>