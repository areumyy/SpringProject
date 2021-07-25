<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostAsk_answer.css"
	rel="stylesheet" />
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<h1 class="Main_title">답변하기</h1>
						<div class="answer_frame">
							<div class="answer_frame_ask">
								<c:set var="dto" value="${dto }"/>
								<h5>${dto.getClass_title() } 문의 내용</h5>
								<div class="writerInfo">
									<strong>&nbsp;작성자</strong>
									<span class="writerInfoCont">${dto.getMem_name() }</span>
									<strong>작성일</strong>
									<span class="writerInfoCont">${dto.getClass_qna_regdate() }</span>
								</div>
								<div class="askCont" style='white-space: pre-line;'>${dto.getClass_qna_cont()}</div>
							</div>
							<br><br>
							<hr width="100%" >
							<form action="<%=request.getContextPath() %>/hostAnswerWRiteOk.do" method="post">
								<input type="hidden" value="${page }" name="page">
								<input type="hidden" value="${dto.getClass_qna_num() }" name="qna_num">
								<div class="answer_frame_answer">
									<h5>답변하기</h5>
									<textarea rows="7" cols="60" name="ans_cont"></textarea>
									<br>
									<input type="submit" class="btn btn-primary writeButton" value="작성하기">
								</div>
							</form>
						</div>
				</div>
			</div>
	
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>