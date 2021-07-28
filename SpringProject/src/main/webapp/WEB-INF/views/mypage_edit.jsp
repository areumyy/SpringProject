<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypageCommon.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypageEdit.css" rel="stylesheet"/>
</head>
<body>
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">



				<div class="pg_main">
					<div class="pg_wrapper">
						<form class="pg_container" method="post" action="<%=request.getContextPath() %>/mypage_edit_ok.do">
							<input type="hidden" name="mem_num" value="${loginDto.getMem_num() }">
							<c:set var="dto" value="${list }" />

							<c:if test="${!empty list }">
								<header class="pg_header_wrapper">
									<h1 class="pg_header_txt">내 프로필</h1>
									<input type="submit" class="edit_button" value="저장하기">
								</header>
								<div class="mypage_information_container">
									<div class="information_info_wrapper">
										<div class="information_info_title">닉네임</div>
										<div class="information_info_content">
											<input class="mem_nick" name="mem_nick"
												value="${dto.getMem_nick() }" placeholder="입력">
										</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">이름</div>
										<div class="information_info_content edit_style" disabled>${dto.getMem_name() }</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">이메일</div>
										<div class="information_info_content edit_style" disabled>${dto.getMem_email() }</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">연락처</div>
										<div class="information_info_content edit_style" disabled>${dto.getMem_phone() }</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">가입일</div>
										<div class="information_info_content edit_style" disabled>${dto.getMem_regdate().substring(0,10) }</div>
									</div>
									<div class="information_info_wrapper sm-hidden">
										<div class="information_info_title_blue">
											<a href="<%=request.getContextPath() %>/hostMain.do?loginNum=${loginDto.getMem_num() }" target="_blank">호스트 센터</a>
										</div>
									</div>
									<div class="information_info_wrapper sm-hidden">
										<div class="information_info_title_blue">
											<a href="<%=request.getContextPath() %>/qna_list.do">자주 묻는 질문</a>
										</div>
									</div>
									<div class="information_info_wrapper sm-hidden">
										<div class="information_info_title_blue">
											<a href="<%=request.getContextPath() %>/notice_list.do">공지사항</a>
										</div>
									</div>
									<div class="information_info_wrapper sm-hidden">
										<div class="information_info_title_red">
											<a href="<%=request.getContextPath() %>/logout.do">로그아웃</a>
										</div>
									</div>


									
								</div>
							</c:if>
						</form>
					</div>
				</div>



			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>