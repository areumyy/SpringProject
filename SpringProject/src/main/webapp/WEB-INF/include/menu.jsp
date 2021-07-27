<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/resources/css/menu.css"
	rel="stylesheet" />
</head>
<script type="text/javascript">
$(function(){
	$("#member_btn").css("display", "none");
	$("#admin_btn").css("display", "none");
	$("#guest").css("display", "none");
	<%
	String type = null;
	if (session.getAttribute("loginType") != null) {
		type = (String) session.getAttribute("loginType");
	} 
	
	if(type != null){ 
		if (type.equals("member")) {%>
		$("#member_btn").css("display", "block");
		$("#admin_btn").css("display", "none");
		$("#guest").css("display", "none");
		
	<%} else if (type.equals("admin")) {%>
		$("#admin_btn").css("display", "block");
		$("#member_btn").css("display", "none");
		$("#guest").css("display", "none");
	<%} 
	} else {%>
		$("#guest").css("display","block");
		$("#admin_btn").css("display", "none");
		$("#member_btn").css("display", "none");
	<%} %>
})
</script>
<body>
	
	<!-- 화면 768px 이상일때 메뉴 -->
	<header class="header">
		<section class="menu1">
			<div class="menu1-1">
					<div class="host_btn">
						<a>
							<div class="host_btn_1" id="guest">로그인이 필요합니다.</div>
							<div class="host_btn" id="member_btn">
								<a href="<%=request.getContextPath() %>/hostMain.do?loginNum=${loginDto.getMem_num() }" target="_blank">
									<div class="host_btn_1">호스트 센터</div>
								</a>
							</div>
							<div class="host_btn" id="admin_btn">
								<a href="<%=request.getContextPath() %>/admin_frip_pass.do" target="_blank">
									<div class="host_btn_1">관리자 센터</div>
								</a>
							</div>
						</a>
					</div>
				<div class="info_btn">
					<!-- 로그인 전 -->
					<c:if test="${loginDto == null }">
						<a class="qna_link" href="<%=request.getContextPath() %>/join.do">
							<div class="qna_div">회원가입</div>
						</a>
						<a class="qna_link" href="<%=request.getContextPath() %>/login.do">
							<div class="qna_div">로그인</div>
						</a>
					</c:if>
					<!-- 로그인 후 -->
					<c:if test="${loginDto != null }">
						<a class="name_link" href="#">
							<div class="name_div">
								<span>${loginDto.getMem_nick() }</span>님
							</div>
						</a>
						<button type="button" class="btn btn-secondary logout" onclick="location.href='logout.do'">로그아웃</button>
					</c:if>
					
					<a class="qna_link" href="<%=request.getContextPath() %>/qna_list.do">
						<div class="qna_div">자주 묻는 질문</div>
					</a>
					<a class="qna_link" href="<%=request.getContextPath() %>/notice_list.do">
						<div class="qna_div">공지사항</div>
					</a>
				</div>
			</div>
		</section>
		<section class="menu2">
			<div class="menu2-1">
				<div class="menu2-1-1">
					<div class="cateBtn">
						<div class="drop_menu">
							<a class="menu_link" href="#" role="button" id="category_btn" data-bs-toggle="dropdown" aria-expanded="false">
								<div class="menu_div">
									<div class="menu_btn_div">
										<img src="<%=request.getContextPath() %>/resources/image/menu/category.svg" alt="카테고리-icon">
									</div>
									<p class="menu_font">카테고리</p>
								</div>
							</a>
							<ul class="dropdown-menu category_list" aria-labelledby="category_btn">
							    <li><a class="dropdown-item" href="#">아웃도어</a>
							    	<ul>
							    		<li><a href="#">서핑</a></li>
							    		<li><a href="<%=request.getContextPath() %>/frip_content.do">캠핑</a></li>
							    		<li><a href="#">등산/트래킹</a></li>
							    		<li><a href="#">기타</a></li>
							    	</ul>
							    </li>
							    <li><a class="dropdown-item" href="#">피트니스</a>
							    	<ul>
							    		<li><a href="#">요가</a></li>
							    		<li><a href="#">필라테스</a></li>
							    		<li><a href="#">헬스/PT/GX</a></li>
							    	</ul>
							    </li>
							    <li><a class="dropdown-item" href="#">스포츠</a>
							    	<ul>
							    		<li><a href="#">클라이밍</a></li>
							    		<li><a href="#">구기스포츠</a></li>
							    		<li><a href="#">수영</a></li>
							    	</ul>
							    </li>
							    <li><a class="dropdown-item" href="<%=request.getContextPath() %>/category_all_list.do?num=11">쿠킹</a>
							    	<ul>
							    		<li><a href="<%=request.getContextPath() %>/category_list.do?num=11">요리</a></li>
							    		<li><a href="<%=request.getContextPath() %>/category_list.do?num=12">음료</a></li>
							    		<li><a href="<%=request.getContextPath() %>/category_list.do?num=13">베이킹</a></li>
							    	</ul>
							    </li>
							    <li><a class="dropdown-item" href="#">공예</a>
							    	<ul>
							    		<li><a href="#">도자기</a></li>
							    		<li><a href="#">비누</a></li>
							    		<li><a href="#">비즈</a></li>
							    	</ul>
							    </li>
							    <li><a class="dropdown-item" href="#">여행</a>
							    	<ul>
							    		<li><a href="#">펜션/풀빌라</a></li>
							    		<li><a href="#">투어</a></li>
							    		<li><a href="#">제주여행</a></li>
							    	</ul>
							    </li>
							</ul>
						</div>
					</div>
					<div class="menu2-1-3" style="display: flex;">
						<span class="bound_line"></span>
						<a class="menu_link" href="<%= request.getContextPath() %>/">
							<img src="<%=request.getContextPath() %>/resources/image/menu/logo.svg" class="logo_img">
						</a>
						<div class="search">
							<div class="search-1">
								<div>
									<form class="search_form" method="post" action="<%=request.getContextPath() %>/search.do">
										<img src="<%=request.getContextPath() %>/resources/image/menu/search.svg" class="search_img">
										<input type="search" placeholder="검색어를 입력해주세요." class="search_input" autocomplete="off">
									</form>
								</div>
							</div>
						</div>
					</div>

					<c:if test="${loginDto != null }">
						<div class="menu2-1-2">
							<a class="menu_link" href="<%=request.getContextPath() %>/like_frip.do">
								<div class="menu_div">
									<div class="menu_btn_div">
										<img src="<%=request.getContextPath() %>/resources/image/menu/save.svg" alt="저장-icon">
									</div>
									<p class="menu_font">저장</p>
								</div>
							</a>

							<a class="menu_link" href="<%=request.getContextPath() %>/mypage.do">
								<div class="menu_div">
									<div class="menu_btn_div">
										<img src="<%=request.getContextPath() %>/resources/image/menu/mypage.svg" alt="마이-icon">
									</div>
									<p class="menu_font">마이</p>
								</div>
							</a>
						</div>
					</c:if>
					<c:if test="${loginDto == null }">
						<div class="menu2-1-2">
							<a class="menu_link" href="<%=request.getContextPath() %>/login.do">
								<div class="menu_div">
									<div class="menu_btn_div">
										<img src="<%=request.getContextPath() %>/resources/image/menu/save.svg" alt="저장-icon">
									</div>
									<p class="menu_font">저장</p>
								</div>
							</a>
							<a class="menu_link" href="<%=request.getContextPath() %>/login.do">
								<div class="menu_div">
									<div class="menu_btn_div">
										<img src="<%=request.getContextPath() %>/resources/image/menu/mypage.svg" alt="마이-icon">
									</div>
									<p class="menu_font">마이</p>
								</div>
							</a>
						</div>
					</c:if>
				</div>
			</div>
		</section>
	</header>



	<!-- 화면 768px 이하일때 메뉴 -->
	<nav class="navbar">
		<a class="menu_link" href="<%= request.getContextPath() %>/">
			<span class="navbar_span activity">
				<img src="<%=request.getContextPath() %>/resources/image/menu/home.svg" alt="홈 메뉴">홈
			</span>
		</a>
		<div class="dropup">
		<a class="menu_link" href="#" id="category_btn1" data-bs-toggle="dropdown" aria-expanded="false">
			<span class="navbar_span">
				<img src="<%=request.getContextPath() %>/resources/image/menu/category.svg" alt="카테고리 메뉴">카테고리
			</span>
		</a>
		<ul class="dropdown-menu category_list1" aria-labelledby="category_btn1">
		    <li><a class="dropdown-item" href="#">아웃도어</a>
		    	<ul>
		    		<li><a href="#">서핑</a></li>
		    		<li><a href="<%=request.getContextPath() %>/frip_content.do">캠핑</a></li>
		    		<li><a href="#">등산/트래킹</a></li>
		    		<li><a href="#">기타</a></li>
		    	</ul>
		    </li>
		    <li><a class="dropdown-item" href="#">피트니스</a>
		    	<ul>
		    		<li><a href="#">요가</a></li>
		    		<li><a href="#">필라테스</a></li>
		    		<li><a href="#">헬스/PT/GX</a></li>
		    	</ul>
		    </li>
		    <li><a class="dropdown-item" href="#">스포츠</a>
		    	<ul>
		    		<li><a href="#">클라이밍</a></li>
		    		<li><a href="#">구기스포츠</a></li>
		    		<li><a href="#">수영</a></li>
		    	</ul>
		    </li>
		    <li><a class="dropdown-item" href="<%=request.getContextPath() %>/category_all_list.do?num=11">쿠킹</a>
		    	<ul>
		    		<li><a href="<%=request.getContextPath() %>/category_list.do?num=11">요리</a></li>
		    		<li><a href="<%=request.getContextPath() %>/category_list.do?num=12">음료</a></li>
		    		<li><a href="<%=request.getContextPath() %>/category_list.do?num=13">베이킹</a></li>
		    	</ul>
		    </li>
		    <li><a class="dropdown-item" href="#">공예</a>
		    	<ul>
		    		<li><a href="#">도자기</a></li>
		    		<li><a href="#">비누</a></li>
		    		<li><a href="#">비즈</a></li>
		    	</ul>
		    </li>
		    <li><a class="dropdown-item" href="#">여행</a>
		    	<ul>
		    		<li><a href="#">펜션/풀빌라</a></li>
		    		<li><a href="#">투어</a></li>
		    		<li><a href="#">제주여행</a></li>
		    	</ul>
		    </li>
		</ul>
		</div>
		<a class="menu_link" href="#">
			<span class="navbar_span">
				<img src="<%=request.getContextPath() %>/resources/image/menu/save.svg" alt="저장 메뉴">저장
			</span>
		</a>
		<a class="menu_link" href="#">
			<span class="navbar_span">
				<img src="<%=request.getContextPath() %>/resources/image/menu/mypage.svg" alt="마이 메뉴">마이
			</span>
		</a>
	</nav>
</body>
</html>