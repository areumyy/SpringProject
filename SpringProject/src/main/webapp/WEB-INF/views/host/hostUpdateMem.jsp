<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="<%=request.getContextPath()%>/resources/css/hostUpdateMem.css"
	rel="stylesheet" />
<script>
function pwdCheck(){
	var pwd = document.getElementById('pwd').value;
	var pwd_check = document.getElementById('pwd_check').value;
	
	if(pwd == pwd_check){
		$("#pwd_res").text("일치");
		$("#pwd_res").css("color","blue");
	} else if (pwd_check == "") {
		$("#pwd_res").text("");
	} else {
		$("#pwd_res").text("불일치");
		$("#pwd_res").css("color","red");
	}
}

function nickCheck() {
	var mem_nick = $("#input_nick").val();
	
	if(mem_nick == "") {
		$("#nick_res").text("닉네임을 입력하세요.");
    	$("#nick_res").css("color", "red");
	} else {
		$.ajax({
            type : "post",
            url : '/controller/updateNickCheck', 
            data : {"mem_nick": mem_nick},
            dataType: 'json',
            error : function(error) {
                console.log("error");
            },
            success : function(data) {
                var res = data.res;
                var state = data.state;
                
                if(state == 1) { // 사용 가능
                	$("#nick_res").text(res);
                	$("#nick_res").css("color", "blue");
                	$("#input_phone").focus();
                } else { // 사용 불가능
                	$("#nick_res").text(res);
                	$("#nick_res").css("color", "red");
                	$("#input_nick").focus();
                }
            }
        });
	}
}
function submitCheck(){
	var email_check = $("#email_res").text();
	var pwd = $("#pwd").val();
	var pwd_check = $("#pwd_check").val();
	var nick_check = $("#nick_res").text();
	
	if(pwd != pwd_check) {
		alert("비밀번호를 확인해주세요!");
		$("#pwd_check").focus();
		return false;
	} else if(nick_check == "사용 불가능합니다." || nick_check == ""){
		alert("닉네임 중복체크를 해주세요!");
		$("#input_nick").focus();
		return false;
		}
	}
</script>
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<div class="Main">
					<div class="login_join_box">
						<div class="login_join_inner">
							<form method="post" action="<%=request.getContextPath() %>/hostUpdateMemOk.do" onsubmit="return submitCheck();">
									<ul class="joinForm">
										<li>
											<span class="txt">아이디:</span> <input type="text" id="input_email" name="mem_email" class="joinForm_txt" readonly value="${loginDto.getMem_email() }">
											<div class="email_check_area">
												<span id="email_res" style="margin-left: 10px;"></span>
											</div>
										</li>
										<li>
											비밀번호 :<input type="password" id="pwd" name="mem_pwd" class="joinForm_txt" placeholder="비밀번호" required>
											<span class="notice">대/소문자, 숫자, 특수문자 중 2가지 이상의 조합으로 10자 이상</span>
										</li>
								
										<li>
											<span class="txt">비밀번호 :</span><input type="password" id="pwd_check" name="mem_pwd_check" onkeyup="pwdCheck();" class="joinForm_txt" placeholder="비밀번호 확인" required>
										</li>
										<li>
											<span id="pwd_res"></span>
										</li>
										<li><span class="txt">이 름 :</span>
											<input type="text" name="mem_name" class="joinForm_txt" placeholder="이름" required value="${loginDto.getMem_name() }"></li>
										<li>
											<span class="txt">닉네임 :</span>
											<input type="text" id="input_nick" name="mem_nick" class="joinForm_txt" placeholder="닉네임" required value="${loginDto.getMem_nick() }">
											<div class="email_check_area">
												<input type="button" value="중복확인" onclick="nickCheck();">
												<span id="nick_res" style="margin-left: 10px;"></span>
											</div>
										</li>
										<li><span class="txt">핸드폰 번호 :</span><input type="text" id="input_phone" name="mem_phone" class="joinForm_txt" placeholder="핸드폰 번호" required value="${loginDto.getMem_phone() }"></li>
										<li><span class="txt">호스트 소개 </span></li>
										<li><textarea rows="6" cols="42" style='white-space: pre-line;' name="host_cont">${dto.getHost_cont() }</textarea>
									</ul>
									<input type="submit" value="수정하기" class="submit_btn">
								</form>
							</div>
						</div>
				</div>
			</div>
	
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>