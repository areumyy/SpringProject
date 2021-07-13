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
	// 시작시 불필요한 것들 hide
	$(document).ready(function() {
		$(".li").hide();
		$(".mobileNav").hide();
		$(".black").hide();
	});
	
	// 큰 메뉴 버튼 클릭 이벤트
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
	
	// 모바일에서 메뉴 아이콘 클릭 이벤트
	function showMenu() {
		$(".mobileNav").show();
		$(".black").show();
	}
	
	// 메뉴바 제외한 곳을 눌렀을 때 이벤트
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

	<!-- 768px 이상 -->

			<div class="hostSideBar">
				<div class="btn-group-vertical" role="group" aria-label="...">
					<div id="menuFrame1"class="menubutton">
						<button type="button" id="1" class="ul">
							<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
							 프립 관리
							<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>
						
						<a type="button" href="<%=request.getContextPath() %>/hostMakeFrip.do" class="li">
							프립 만들기
						</a>
						<a type="button" href="<%=request.getContextPath() %>/hostMyFrip.do" class="li">
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
						<a type="button" href="#" class="li">
							문의 하기
						</a>
						<a type="button" href="#" class="li">
							 후기 관리
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
		
	
	
	<!-- 768px 이하 -->
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
					<li class="menutext"><a href="<%=request.getContextPath() %>/hostMakeFrip.do">프립 만들기</a></li>
					<li class="menutext"><a href="#">내 프립</a></li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-user"  aria-hidden="true"></span>
				</div>
				<ul class="menuList2">
					<li class="menutext"><a href="#">출석부</a></li>
					<li class="menutext"><a href="#">예약 관리</a></li>
					<li class="menutext"><a href="#">후기 관리</a></li>
					<li class="menutext"><a href="#">문의하기</a></li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext"><a href="#">정산 요청</a></li>
					<li class="menutext"><a href="#">정산 완료</a></li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-question-sign"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext"><a href="#">공지사항</a></li>
					<li class="menutext"><a href="#">자주 묻는 질문</a></li>
				</ul>
			</div>
			<div class="menuName logout">
				<button>로그아웃</button>
			</div>
		</nav>
		<div class="black">	</div>
	</div>		 
	
</body>
</html>