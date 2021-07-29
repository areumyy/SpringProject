<%@page import="com.market.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/frip_qna_all.css" rel="stylesheet"/>
<script type="text/javascript">
$(function() {
	<%
	HttpSession session1 = request.getSession();
	MemberDTO dto = (MemberDTO)session1.getAttribute("loginDto");
	%>
})

function checkBox1(){
	var status = $("#checkBox").val();
	if(status == 0) {
		$("[name=class_qna_pri]").val(1);
		$("#checkBox").val(1);
	} else {
		$("[name=class_qna_pri]").val(0);
		$("#checkBox").val(0);
	}
	
}
</script>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
			
				<div class="main_page">
				
					<div class="class_list">
						<div class="cateImg_list_div1" style="opacity: 1; display: block;">
							<section class="class_list_section">
								<form method="post" action="<%=request.getContextPath() %>/qna_insert_ok.do">
								<input type="hidden" name="class_qna_classNum" value="${class_num }">
								<input type="hidden" name="class_qna_writer" value="${mem_num }">
								<input type="hidden" name="class_qna_pri" value="1">
								
								<div class="class_list_title_div1">
									<div class="class_list_title_div2">
										<h2 class="class_list_title">문의작성</h2>
									</div>
									<div class="check_div">
										<input type="checkbox" id="checkBox" onclick="checkBox1();" value="1">
										<div>비밀글</div>
									</div>
								</div>
								<div class="qna_cont_insert">
									<textarea placeholder="연락처를 포함한 개인정보를 남기거나 요청하는 등
										직거래 이용 문의는 현장결제로 간주하여
										사전안내 없이 삭제 및 이용이 제한될 수 있습니다.
										- 6인 이상 기업/단체 신청 문의 : 하단 바로가기
										- 결제, 환불 등 서비스 문의 : 카카오톡 채널 @frip"
										class="insert_text" required="required" name="class_qna_cont"></textarea>
								</div>
								<div class="insert_btn_section">
									<input type="submit" class="qna_insert_btn" value="등록하기">
								</div>
								</form>
							</section>
						</div>
					</div>
				</div>
			
			
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>