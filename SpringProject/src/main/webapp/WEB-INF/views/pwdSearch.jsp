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
<script language="javascript">
	document.title = "비밀번호 찾기" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
<script type="text/javascript">
function findPwd() {
    var mem_email = $("#mem_email").val();
    var mem_name = $("#mem_name").val();
    
        $.ajax({
            type : "post",
            url : '/controller/pwd_search_ok.do', 
            data : {"mem_email": mem_email, "mem_name": mem_name},
            dataType: 'json',
            error : function(error) {
                console.log("error");
            },
            success : function(data) {
                var find_pwd = data.find_pwd;
                var state = data.state;
                
                if(state == 1) {
                	document.getElementById('find_pwd_section').innerText = "비밀번호는 '" + find_pwd + "'입니다.";
                } else {
                	document.getElementById('find_pwd_section').innerText = find_pwd;
                }
            }
        }); 

}
</script>
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
						
						<%-- <form method="post" action="<%=request.getContextPath() %>/pwd_search_ok.do"> --%>
						<div>
							<ul class="pwdSearchForm">
								<li>
									<input type="text" id="mem_email" name="mem_email" class="pwdSearchForm_txt" placeholder="아이디(이메일)" required>
									<span class="notice">비밀번호를 찾고자 하는 아이디(이메일)를 입력해주세요.</span>
								</li>
								<li><input type="text" id="mem_name" name="mem_name" class="pwdSearchForm_txt" placeholder="이름" required></li>
							</ul>
							<input type="button" value="비밀번호 찾기" class="submit_btn" onclick="findPwd();">
							<div id="find_pwd_section" class="find_pwd"></div>
						</div>
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