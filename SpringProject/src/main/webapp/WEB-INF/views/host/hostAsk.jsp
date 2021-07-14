<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostMyFrip</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostAsk.css"
	rel="stylesheet" />
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<h1 class="Main_title">내 프립</h1>
					
					<div class="info_frame">
						<div class="state">
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
							  <label class="btn btn-outline-primary" for="btnradio1">답변 없는 문의</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio2">답변 완료 문의</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio3">전체 문의</label>
							</div><br><br>
							
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">문의자</th>
							      <th scope="col" colspan="2">제목</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">1</th>
							      <td>홍길동</td>
							      <td>
								      <div class="option_arcodion">
										<button class=" accordion-button collapsed arcodion_selector" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											<div class="arcodion_div">
												<div>일정</div>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapseOne">
											<div class="option_item">
												<div class="option_item_date">2021년 7월 17일(토요일) 06:50</div>
												<div class="option_item_name">1 / 4명 | 신청 마감 7월 16일 14:00</div>
											</div>
											<div class="option_item">
												<div class="option_item_date">2021년 7월 17일(토요일) 06:50</div>
												<div class="option_item_name">1 / 4명 | 신청 마감 7월 16일 14:00</div>
											</div>
											<div class="option_item">
												<div class="option_item_date">2021년 7월 17일(토요일) 06:50</div>
												<div class="option_item_name">1 / 4명 | 신청 마감 7월 16일 14:00</div>
											</div>
										</div>
									</div>
								</td>
							      <td><a href="#">답변하기</a></td>
							    </tr>
							  </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>