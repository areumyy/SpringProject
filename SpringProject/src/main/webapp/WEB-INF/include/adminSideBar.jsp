<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 반응형 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link href="<%=request.getContextPath()%>/resources/css/adminSideBar.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
						<button type="button" id="1" class="ul" onclick="location.href='admin_frip_pass.do'">
							<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
							 프립 승인
							<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>
					</div>
					
					<div id="menuFrame2"class="menubutton">
						<button type="button" id="2" class="ul" onclick="location.href='admin_cal_pass.do'">
							<span class="glyphicon glyphicon-user"  aria-hidden="true"></span>
							정산 승인
								<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>
					</div>
					
					<div id="menuFrame3"class="menubutton">
						<button type="button" id="3" class="ul" onclick="location.href='admin_notice.do?sort=total'">
							<span class="glyphicon glyphicon-euro" aria-hidden="true"></span>
							공지사항 관리
							<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>
					</div>
					
					<div id="menuFrame4" class="menubutton">
						<button type="button" id="4" class="ul" onclick="location.href='admin_member_list.do'">
							<span class="glyphicon glyphicon-question-sign"  aria-hidden="true"></span>
							회원 조회
							<span class="glyphicon glyphicon-menu-down icon"  aria-hidden="true"></span>
						</button>  
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
				<i class="fa fa-align-justify" aria-hidden="true" style="color:white;"></i>
			</button>
			<a class="mobileLogo" href="<%=request.getContextPath()%>/admin_frip_pass.do">
				<img src="<%=request.getContextPath()%>/resources/logo/logo.png"
				width="80px" height="30px" alt="?">
			</a>
			<a href="<%=request.getContextPath()%>/hostMyPage">사진</a>
			<!-- 마이페이지 들어가는 버튼 -->
		</header>
		
		<nav class="mobileNav">
			<header class="menuBarHeader">
				<a class="homeButton" href="<%=request.getContextPath()%>/admin_frip_pass.do">
					<img src="<%=request.getContextPath()%>/resources/logo/menulogo.PNG"
					width="60px" height="30px" alt="?"> 관리자 페이지
				</a>
			</header>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext"><a href="<%=request.getContextPath() %>/admin_frip_pass.do">프립 승인</a></li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-user"  aria-hidden="true"></span>
				</div>
				<ul class="menuList2">
					<li class="menutext"><a href="<%=request.getContextPath() %>/admin_cal_pass.do">정산 승인</a></li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-tent"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext"><a href="<%=request.getContextPath() %>/admin_notice.do">공지사항 관리</a></li>
				</ul>
			</div>
			
			<div class="menuName">
				<div class="menuIcon">
					<span class="glyphicon glyphicon-question-sign"  aria-hidden="true"></span>
				</div>
				<ul class="menuList">
					<li class="menutext"><a href="<%=request.getContextPath() %>/admin_member_list.do">회원조회</a></li>
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