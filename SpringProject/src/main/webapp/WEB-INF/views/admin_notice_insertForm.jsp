<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/admin_notice_insertForm.css" rel="stylesheet" />
<script language="javascript">
	document.title = "관리자 공지사항 수정" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
</head>
<script type="text/javascript">
function insertCheck(){
	var flag = $("#flag").val();
	if(flag == -1) {
		alert('분류를 선택해주세요!');
		return false;
	}
}
</script>
<body>

	<div class="mainFrame">
		<jsp:include page="../include/adminMenuBar.jsp"></jsp:include>

		<div class="Frame">
			<div class="Frame_Frame">
				<jsp:include page="../include/adminSideBar.jsp"></jsp:include>
				<div class="Main">
				
					<div class="notice_page">
						<div class="notice_header">
							<h2 class="notice_title">공지사항 등록</h2>
						</div>
						<div class="notice_body">
							<div class="insert_div">
								<form class="insert_form" method="post" action="<%=request.getContextPath() %>/admin_notice_insert_ok.do" onsubmit="return insertCheck();">
									<input class="input_title" type="text" name="notice_title" placeholder="제목을 입력해주세요." required>
									<select class="form-select" name="notice_flag" id="flag" aria-label="Default select example">
										<option value="-1" selected>:::분류:::</option>
										<option value="0">회원</option>
										<option value="1">호스트</option>
									</select>
									<textarea class="input_cont" name="notice_cont" rows="20" cols="30" placeholder="내용을 입력해주세요." required></textarea>
									
									<div class="btn_div">
										<input type="submit" class="btn btn-primary" value="등록">
										<input type="button" class="btn btn-secondary" value="취소" onclick="window.history.back();">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
				<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>