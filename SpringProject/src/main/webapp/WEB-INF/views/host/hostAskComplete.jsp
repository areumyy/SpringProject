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
<script>
	$(document).ready(function() {
		var mql = window.matchMedia("screen and (max-width: 768px)");
		if(mql.matches) {
	       var length =  $(".arcodion_title").length;
	    	
	       for(var i=0; i<length; i++) {
	    	   if($(".arcodion_title").eq(i).text().length >= 5) {
	    			$(".arcodion_title").eq(i).text($(".arcodion_title").eq(i).text().substring(0,5));   
	    	   }
	    	}
	    } 
	});
	
	var mql = window.matchMedia("screen and (max-width: 768px)");

	mql.addListener(function(e) {
	    if(e.matches) {
	       var length =  $(".arcodion_title").length;
	    	for(var i=0; i<length; i++) {
	    		if($(".arcodion_title").eq(i).text().length >= 5) {
	    			$(".arcodion_title").eq(i).text($(".arcodion_title").eq(i).text().substring(0,5));   
	    	   }
	    	}
	    }
	});

</script>
<script language="javascript">
	document.title = "클래스 문의" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
</head>
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
						<form action="<%=request.getContextPath() %>/searchComAsk.do">
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
							  onclick="location.href='hostAsk.do'">
							  <label class="btn btn-outline-primary" for="btnradio1">답변 없는 문의</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" 
							  onclick="location.href='hostAskComplete.do'" checked>
							  <label class="btn btn-outline-primary" for="btnradio2">답변 완료 문의</label>
							</div><br><br>
							
							<!-- 답변 완료 문의 -->
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">문의자</th>
							      <th scope="col">클래스 명</th>
							      <th scope="col" class="table_title">문의 내용</th>
							      <th scope="col" class="table_title">답변 내용</th>
							      <th scope="col">수정</th>
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
													<div class="arcodion_title">${dto.getClass_qna_cont().substring(0,5) }...</div>
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
							      <td>
								      <div class="option_arcodion">
											<button class=" accordion-button collapsed arcodion_selector askTitle" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${index.count +10 }" aria-expanded="true" aria-controls="collapse${index.count +10 }">
												<div class="arcodion_div">
													<c:if test="${dto.getClass_ans_cont().length() >= 10 }">
														<div class="arcodion_title">${dto.getClass_ans_cont().substring(0,10) }...</div>
													</c:if>
													<c:if test="${dto.getClass_ans_cont().length() < 10 }">
														<div class="arcodion_title">${dto.getClass_ans_cont() }</div>
													</c:if>
												</div>
											</button>
											<div class="option_list accordion-collapse collapse" id="collapse${index.count +10 }">
												<div class="option_item">
													<div class="option_item_cont" style='white-space: pre-line;'>${dto.getClass_ans_cont()}</div>
												</div>
											</div>
										</div>
									</td>
									<td>
										<a href="<%=request.getContextPath()%>/hostAskAnswerUpdate.do?qna_num=${dto.getClass_qna_num()}&page=${Paging.getPage()}">수정</a>
									<td>
							    </tr>
							    </c:forEach>
							    </c:if>
							    
							    <c:if test="${empty list }">
							    	<tr>
							    		<td colspan="6">
							    			완료된 답변이 없습니다.	
							    		</td>
							    	</tr>
							    </c:if>
							  </tbody>
							</table><!-- 답변 완료 문의 end -->
							
							
						</div>
					</div>
					
					<!-- 페이징 처리 부분 -->
					<nav aria-label="Page navigation example" class="list_footer">
						<ul class="pagination">
							<c:if test="${Paging.getPage() > Paging.getBlock() }">
								<li class="page-item">
									<a class="page_link" href="searchComAsk.do?page=1&search_field=${field }&search_name=${name}">
										<span aria-hidden="true">&laquo;</span>
									</a>
									<a class="page_link" href="searchComAsk.do?page=${Paging.getPage() - 1 }&search_field=${field }&search_name=${name}">	
										<span aria-hidden="true">&lt;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
								<c:if test="${i == Paging.getPage() }">
									<li class="page-item"><a class="page_link paging_active">${i }</a></li>
								</c:if>
								<c:if test="${i != Paging.getPage() }">
									<li class="page-item"><a class="page_link" href="searchComAsk.do?page=${i }&search_field=${field }&search_name=${name}">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
								<li class="page-item">
									<a class="page_link" href="searchComAsk.do?page=${Paging.getPage() + 1 }&search_field=${field }&search_name=${name}">	
										<span aria-hidden="true">&gt;</span>
									</a>
									<a class="page_link" href="searchComAsk.do?page=${Paging.getAllPage() }&search_field=${field }&search_name=${name}">
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