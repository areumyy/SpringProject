<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
<script type="text/javascript">
	function pwdCheck(){
		const pwd = document.getElementById('pwd').value;
		const pwd_check = document.getElementById('pwd_check').value;
		console.log(pwd);
		console.log(pwd_check);
		if(pwd == pwd_check){
			document.getElementById('pwd_res').innerText = "일치";
			$("#pwd_res").css("color","blue");
		} else if (pwd_check == "") {
			document.getElementById('pwd_res').innerText = "";
		} else {
			document.getElementById('pwd_res').innerText = "불일치";
			$("#pwd_res").css("color","red");
		}
	}
	
	function submitCheck(){
		const pwd = document.getElementById('pwd').value;
		const pwd_check = document.getElementById('pwd_check').value;
		if(pwd != pwd_check) {
			alert("비밀번호를 확인해주세요!");
			return false;
		}
	}
</script>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
				<div class="login_join_box">
					<div class="login_join_inner">
						<div>
							<h3 class="login_join_title">회원가입</h3>
						</div>
						
						<form method="post" action="<%=request.getContextPath() %>/join_ok.do" onsubmit="return submitCheck();">
							<ul class="joinForm">
								<li><input type="text" name="mem_email" class="joinForm_txt" placeholder="아이디(이메일)" required></li>
								<li>
									<input type="password" id="pwd" name="mem_pwd" class="joinForm_txt" placeholder="비밀번호" required>
									<span class="notice">대/소문자, 숫자, 특수문자 중 2가지 이상의 조합으로 10자 이상</span>
								</li>
								<li>
									<input type="password" id="pwd_check" name="mem_pwd_check" onkeyup="pwdCheck();" class="joinForm_txt" placeholder="비밀번호 확인" required>
									<span id="pwd_res"></span>
								</li>
								<li><input type="text" name="mem_name" class="joinForm_txt" placeholder="이름" required></li>
								<li><input type="text" name="mem_nick" class="joinForm_txt" placeholder="닉네임" required></li>
								<li><input type="text" name="mem_phone" class="joinForm_txt" placeholder="핸드폰 번호" required></li>
							</ul>
							<input type="submit" value="회원가입" class="submit_btn">
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