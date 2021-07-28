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
						<select name="search_field">
							<option value="mem_name">문의자</option>
							<option value="class_title">클래스 명 </option>
						</select>
						<input type="text" name="search_name" placeholder="문의 검색">
						<button><i class="fa fa-search" aria-hidden="true"></i></button>
						</form>
					</div>
					<div class="info_frame">
						<div class="state">
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" 
							  onclick="location.href='hostAsk.do'" checked>
							  <label class="btn btn-outline-primary" for="btnradio1">답변 없는 문의</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" 
							  onclick="location.href='hostAskComplete.do'">
							  <label class="btn btn-outline-primary" for="btnradio2" >답변 완료 문의</label>

							</div><br><br>
							
							<!-- 답변 없는 문의 -->
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">문의자</th>
							      <th scope="col">클래스 명</th>
							      <th scope="col" class="table_title">문의 내용</th>
							      <th scope="col" class="table_title">답변</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:set var="list" value="${qList }"/>
							  <c:if test="${!empty list }">
							  <c:forEach items="${qList }" var="dto" varStatus="index">
							    <tr>
							      <th scope="row">${(Paging.getPage()-1)*10 + index.count }</th>
							      <td>${dto.getMem_name() }</td>
							      <td>${dto.getClass_title() }</td>
							      <td>
								      <div class="option_arcodion">
										<button class="accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${index.count }" aria-expanded="true" aria-controls="collapse${index.count }">
											<div class="arcodion_div">
												<c:if test="${dto.getClass_qna_cont().length() >= 10 }">
													<div class="arcodion_title">${dto.getClass_qna_cont().substring(0,10) }...</div>
												</c:if>
												<c:if test="${dto.getClass_qna_cont().length() < 10 }">
													<div class="arcodion_title">${dto.getClass_qna_cont() }</div>
												</c:if>
											</div>
										</button>
										<div class="option_list accordion-collapse collapse" id="collapse${index.count }">
											<div class="option_item">
												<div class="option_item_cont" style='white-space: pre-line;'>${dto.getClass_qna_cont() }</div>
											</div>
										</div>
									</div>
								</td>
							      <td class="answerButton"><a href="<%=request.getContextPath()%>/hostAsk_answer.do?qna_num=${dto.getClass_qna_num()}&page=${Paging.getPage()}">답변하기</a></td>
							    </tr>
							    </c:forEach>
							    </c:if>
							    
							    <c:if test="${empty list }">
							    	<tr>
							    		<td colspan="5">
							    			답변 없는 문의가 없습니다.
							    		</td>
							    	</tr>	
							    </c:if>
							  </tbody>
							</table>
						</div>
						
					</div>
						<!-- 페이징 처리 부분 -->
						<nav aria-label="Page navigation example" class="qna_list_footer">
							<ul class="pagination">
								<c:if test="${Paging.getPage() > Paging.getBlock() }">
									<li class="page-item">
										<a class="page_link" href="hostAsk.do?page=1">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
								<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
									<c:if test="${i == Paging.getPage() }">
										<li class="page-item"><a class="page_link active">${i }</a></li>
									</c:if>
									<c:if test="${i != Paging.getPage() }">
										<li class="page-item"><a class="page_link" href="hostAsk.do?page=${i }">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
									<li class="page-item">
										<a class="page-link" href="hostAsk.do?page=${Paging.getAllPage() }" style="color: black;">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>
				</div>
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>