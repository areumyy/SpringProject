<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="<%=request.getContextPath()%>/resources/css/hostMain.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/hostInsert.css" rel="stylesheet" />
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<div class="Main">
					<div class="insert_page">
						<div class="insert_header">
								<h2 class="insert_title">호스트 등록</h2>
						</div>
						<div class="insert_ex">호스트 등록을 하면 프립만들기와 호스트 기능들을 이용하실수 있습니다!</div>
						<div class="insert_body">
							<div class="insert_section">
								<form method="post" action="<%=request.getContextPath() %>/host_insert.do">
									<input type="hidden" name="host_memNum" value="${loginDto.getMem_num() }">
									<div class="insert_example">* 호스트 소개를 입력하고 등록을 눌러주세요.</div>
									<textarea name="host_cont" class="insert_cont" rows="15" cols="30" placeholder="내용을 입력해주세요." required></textarea>
									<div class="btn_section">
										<input type="submit" class="btn btn-primary insert_btn" value="등록">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>