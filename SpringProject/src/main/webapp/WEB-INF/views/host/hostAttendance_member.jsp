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
<link href="<%=request.getContextPath()%>/resources/css/hostAttendance.css"
	rel="stylesheet" />
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<h1 class="Main_title">출석부</h1><br>
					<h2> 하루에 필사 한 문장 2021-07-14 14시</h2>
			
					<div class="cont_frame">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">신청자명</th>
						      <th scope="col">성별</th>
						      <th scope="col">연락처</th>
						      <th scope="col">구매 옵션</th>
						      <th scope="col">출석내역</th>
						      <th scope="col">상태</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">홍길동</th>
						      <td>남</td>
						      <td>010-2312-3123</td>
						      <td>1인</td>
						      <td>1/1</td>
						      <td><a href="#">출석 취소하기</a></td>
						    </tr>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>