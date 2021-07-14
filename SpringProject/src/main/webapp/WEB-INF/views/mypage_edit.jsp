<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<link href="<%=request.getContextPath() %>/resources/css/mypage_common.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypage_edit.css" rel="stylesheet"/>
</head>
<body>
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">



				<div class="pg_main">
					<div class="pg_wrapper">
						<div class="pg_container">
							<form>
								<header class="pg_header_wrapper">
									<h1 class="pg_header_txt">내 프로필</h1>
									<button type="submit" class="edit_button">저장하기</button>
								</header>
								<div class="mypage_information_container">
									<div class="information_info_wrapper">
										<div class="information_info_title">닉네임</div>
										<div class="information_info_content">
											<input class="mem_nick" name="mem_nick" placeholder="입력">
										</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">연락처</div>
										<div class="information_info_content edit_style" disabled>01012345678</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">이메일</div>
										<div class="information_info_content edit_style" disabled>frip@frip.com</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">생년월일</div>
										<div class="information_info_content edit_style" disabled>19901223</div>
									</div>
									<div class="information_info_wrapper">
										<div class="information_info_title">성별</div>
										<div class="information_info_content edit_style" disabled>F</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>



			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>