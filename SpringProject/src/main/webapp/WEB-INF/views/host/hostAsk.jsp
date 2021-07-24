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
					
					<div class="searchAsk">
						<form action="<%=request.getContextPath() %>/searchAsk.do">
						<input type="text" name="class_qna_cont" placeholder="문의 검색">
						<button><i class="fa fa-search" aria-hidden="true"></i></button>
						</form>
					</div>
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
							
							<!-- 답변 없는 문의 -->
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">문의자</th>
							      <th scope="col">클래스 명</th>
							      <th scope="col" class="table_title">문의 내용</th>
							      <th scope="col" class="table_title">답변 내용</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">1</th>
							      <td>홍길동</td>
							      <td>클래스 명</td>
							      <td>
								      <div class="option_arcodion">
										<button class="accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											<div class="arcodion_div">
												<div class="arcodion_title">언제 진행하나요?</div>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapseOne">
											<div class="option_item">
												<div class="option_item_cont">언제 진행하나요?</div>
											</div>
										</div>
									</div>
								</td>
							      <td class="answerButton"><a href="<%=request.getContextPath()%>/hostAsk_answer.do">답변하기</a></td>
							    </tr>
							    
							    <tr>
							      <th scope="row">1</th>
							      <td>홍길동</td>
							      <td>3일간의 ~~</td>
							      <td>
								    <div class="option_arcodion">
										<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
											<div class="arcodion_div">
												<div class="arcodion_title">언제 진행하나요?</div>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapseTwo">
											<div class="option_item">
												<div class="option_item_cont">언제 진행하나요?</div>
											</div>
										</div>
									</div>
								</td>
							      <td class="answerButton"><a href="">답변하기</a></td>
							    </tr>
							  </tbody>
							</table>
							
							
							<!-- 답변 완료 문의 -->
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">문의자</th>
							      <th scope="col">클래스 명</th>
							      <th scope="col" class="table_title">문의 내용</th>
							      <th scope="col" class="table_title">답변 내용</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">1</th>
							      <td>홍길동</td>
							      <td>클래스 명</td>
							      <td>
								      <div class="option_arcodion">
										<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											<div class="arcodion_div">
												<div class="arcodion_title">언제 진행하나요?</div>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapseOne">
											<div class="option_item">
												<div class="option_item_cont">언제 진행하나요?</div>
											</div>
										</div>
									</div>
								</td>
							      <td>
								      <div class="option_arcodion">
											<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
												<div class="arcodion_div">
													<div class="arcodion_title">~~</div>
												</div>
											</button>
											<div class="option_list accordion-collapse collapse" id="collapse1">
												<div class="option_item">
													<div class="option_item_cont">~~</div>
												</div>
											</div>
										</div>
									</td>
							    </tr>
							    
							    <tr>
							      <th scope="row">1</th>
							      <td>홍길동</td>
							      <td>3일간의 ~~</td>
							      <td>
								    <div class="option_arcodion">
										<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
											<div class="arcodion_div">
												<div class="arcodion_title">언제 진행하나요?</div>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapseTwo">
											<div class="option_item">
												<div class="option_item_cont">언제 진행하나요?</div>
											</div>
										</div>
									</div>
								</td>
							    <td>
							    	<div class="option_arcodion">
											<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="true" aria-controls="collapse2">
												<div class="arcodion_div">
													<div class="arcodion_title">~에</div>
												</div>
											</button>
											<div class="option_list accordion-collapse collapse" id="collapse2">
												<div class="option_item">
													<div class="option_item_cont">~에</div>
												</div>
											</div>
										</div>
								</td>
							    </tr>
							  </tbody>
							</table><!-- 답변 완료 문의 end -->
							
							<!-- 전체 문의 -->
							
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">문의자</th>
							      <th scope="col">클래스 명</th>
							      <th scope="col" class="table_title">문의 내용</th>
							      <th scope="col" class="table_title">답변 내용</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">1</th>
							      <td>홍길동</td>
							      <td>클래스 명</td>
							      <td>
								      <div class="option_arcodion">
										<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											<div class="arcodion_div">
												<div class="arcodion_title">언제 진행하나요?</div>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapseOne">
											<div class="option_item">
												<div class="option_item_cont">언제 진행하나요?</div>
											</div>
										</div>
									</div>
								</td>
							      <td>
								      <div class="option_arcodion">
											<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
												<div class="arcodion_div">
													<div class="arcodion_title">~~</div>
												</div>
											</button>
											<div class="option_list accordion-collapse collapse" id="collapse1">
												<div class="option_item">
													<div class="option_item_cont">~~</div>
												</div>
											</div>
										</div>
									</td>
							    </tr>
							    
							    <tr>
							      <th scope="row">1</th>
							      <td>홍길동</td>
							      <td>3일간의 ~~</td>
							      <td>
								    <div class="option_arcodion">
										<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
											<div class="arcodion_div">
												<div class="arcodion_title">언제 진행하나요?</div>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapseTwo">
											<div class="option_item">
												<div class="option_item_cont">언제 진행하나요?</div>
											</div>
										</div>
									</div>
								</td>
							    <td class="answerButton"><a href="">답변하기</a></td>
							    </tr>
							  </tbody>
							</table><!-- 전체문의 end -->
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>