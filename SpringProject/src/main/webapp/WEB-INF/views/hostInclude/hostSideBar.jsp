<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link
	href="<%=request.getContextPath()%>/resources/css/hostSideBar.css"
	rel="stylesheet" />
	
<script>
	$(document).ready(function() {
		$(".li").hide();
		$(".mobileNav").hide();
		$(".black").hide();
	});
	
	$(function(){
		 $("button").click(function() {
			var menuClass = $(this).attr("id");
			var parentsClass = $("#"+menuClass).parents().attr("id");
			
			if($("#"+menuClass).attr("class") == "ul") {
				$("#"+parentsClass).find(".li").show();
				$("#"+menuClass).attr("class", "ul1");
				$(this).find(".icon").attr("class", "glyphicon glyphicon-menu-up icon");
			}else if($("#"+menuClass).attr("class") == "ul1") {
				$("#"+parentsClass).find(".li").hide();
				$("#"+menuClass).attr("class", "ul");
				$(this).find(".icon").attr("class", "glyphicon glyphicon-menu-down icon");
			}
		});
	});
	
	function showMenu() {
		$(".mobileNav").show();
		$(".black").show();
	}
	
	$(document).mouseup(function (e){
	    let sideNav = $(".mobileNav");
	    if (!sideNav.is(e.target) && sideNav.has(e.target).length === 0) {
	        sideNav.hide();
	        $(".black").hide();
	    }
	});

</script>
</head>
<body>
	<div class="main">
		<header class="hostMenuBar">
			<a class="homeButton" href="<%=request.getContextPath()%>/hostMain.do">
				<img src="<%=request.getContextPath()%>/resources/logo/logo.png"
				width="80px" height="30px" alt="?"> 호스트 관리 페이지
			</a>
			<div class="userInfo">
				<a class="userName" href="<%=request.getContextPath()%>/hostInfo.do">
					<!-- 유저 프로필사진 + 닉네임 -->
				</a>
			</div>
		</header>
		
		<div class="hostSideMain">
			<div class="hostSideBar">
				<div class="btn-group-vertical" role="group" aria-label="...">
					<div id="menuFrame1"class="menubutton">
						<button type="button" id="1" class="ul">
							<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
							 프립 관리
							<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>
						
						<a type="button" href="#" class="li">
							프립 만들기
						</a>
						<a type="button" href="#" class="li">
							 내 프립
						</a>
					</div>
					
					<div id="menuFrame2"class="menubutton">
						<button type="button" id="2" class="ul">
							<span class="glyphicon glyphicon-user"  aria-hidden="true"></span>
							대원 관리
								<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>
						
						<a type="button" href="#" class="li">
							출석부
						</a>
						<a type="button" href="#" class="li">
							 예약 관리
						</a>
					</div>
					
					<div id="menuFrame3"class="menubutton">
						<button type="button" id="3" class="ul">
							<span class="glyphicon glyphicon-euro" aria-hidden="true"></span>
							정산
							<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>
						
						<a type="button" href="#" class="li">
							정산 요청
						</a>
						<a type="button" href="#" class="li">
							 정산 완료
						</a>
					</div>
					
					<div id="menuFrame4" class="menubutton">
						<button type="button" id="4" class="ul">
							<span class="glyphicon glyphicon-question-sign"  aria-hidden="true"></span>
							지원 센터
							<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>  
						
						<a type="button" href="#" class="li">
							공지사항
						</a>
						<a type="button" href="#" class="li">
							 자주 묻는 질문
						</a>
					</div>
					
					<div class="ul logout">
							<button>로그아웃</button>
					</div>
	  			</div>  
			</div>
		</div>
	</div>
	
	<div class="mobile">
		<header class="hostMenuBar">
			<button onclick="showMenu()">
				<span class="glyphicon glyphicon-list"  aria-hidden="true"></span>
			</button>
			
			<a class="mobileLogo" href="<%=request.getContextPath()%>/hostMain.do">
				<img src="<%=request.getContextPath()%>/resources/logo/logo.png"
				width="80px" height="30px" alt="?">
			</a>
			<a href="<%=request.getContextPath()%>/hostMyPage">사진</a>
			<!-- 마이페이지 들어가는 버튼 -->
		</header>
		
		<nav class="mobileNav">
			<header class="menuBarHeader">
				<a class="homeButton" href="<%=request.getContextPath()%>/hostMain.do">
					<img src="<%=request.getContextPath()%>/resources/logo/menulogo.PNG"
					width="60px" height="30px" alt="?"> 호스트 관리 페이지
				</a>
			</header>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext">프립 만들기</li>
					<li class="menutext">내 프립</li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-user"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext">출석부</li>
					<li class="menutext">예약 관리</li>
					<li class="menutext">후기 관리</li>
					<li class="menutext">문의하기</li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext">정산 요청</li>
					<li class="menutext">정산 완료</li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-question-sign"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext">공지사항</li>
					<li class="menutext">자주 묻는 질문</li>
				</ul>
			</div>
			<div class="menuName logout">
				<button>로그아웃</button>
			</div>
		</nav>
		<div class="black">	</div>
	</div>		 
	
	<jsp:include page="hostFooter.jsp"></jsp:include>
	
</body>
</html>