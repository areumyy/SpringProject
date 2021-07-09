<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostMain</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostMain.css"
	rel="stylesheet" />
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
				<div class="Main">
					<div class="Main_line">
						<section class="Main_line1_section1">
							<div class="hostInfo">
								<div class="hostInfo_name">
									<h2>안녕하세요!
										<br>
										123<!-- 닉네임 -->
										호스트님
									</h2>
									<div class="hostInfo_hostGrade">
										<!-- 회원의 호스트 등급 -->
										일반 호스트
									</div>
								</div>
								<a class="hostInfo_infoUpdate">
									회원 정보 수정
								</a>
							</div>
							<div class="hostMenual">
								<a href="https://www.notion.so/7cefbac56d5a49548bc5f35e3ec035f7" target="_blank">
									<button class="hostmenual_button">호스트 매뉴얼</button>
								</a>
								<a class="superHost" href="/super-host">
								<button class="superHostButton">나도 슈퍼호스트!</button></a>
							</div>
						</section>
						
						<section class="Main_line1_section2">
							<div class="notice">
								<h2 class="notice_text">공지사항</h2>
								<a href="#" class="notice_more"> <!-- 전체 공지로 이동 -->
									더 보기
								</a>
							</div>
							<div> <!-- 호스트 공지사항을 최신순으로 가져와서 보여주는 반복문 -->
								<a href="#" class="notice_cont"> <!-- 공지로 이동하는 주소 추가 -->
									<span class="notice_cont_title">공지제목</span>
									<span class="notice_cont_date">2021-06-05</span>
								</a>
							</div>
							<div> <!-- 호스트 공지사항을 최신순으로 가져와서 보여주는 반복문 -->
								<a href="#" class="notice_cont"> <!-- 공지로 이동하는 주소 추가 -->
									<span class="notice_cont_title">공지제목</span>
									<span class="notice_cont_date">2021-06-05</span>
								</a>
							</div>
							<div> <!-- 호스트 공지사항을 최신순으로 가져와서 보여주는 반복문 -->
								<a href="#" class="notice_cont"> <!-- 공지로 이동하는 주소 추가 -->
									<span class="notice_cont_title">공지제목</span>
									<span class="notice_cont_date">2021-06-05</span>
								</a>
							</div>
							<div> <!-- 호스트 공지사항을 최신순으로 가져와서 보여주는 반복문 -->
								<a href="#" class="notice_cont"> <!-- 공지로 이동하는 주소 추가 -->
									<span class="notice_cont_title">공지제목</span>
									<span class="notice_cont_date">2021-06-05</span>
								</a>
							</div>
							<div> <!-- 호스트 공지사항을 최신순으로 가져와서 보여주는 반복문 -->
								<a href="#" class="notice_cont"> <!-- 공지로 이동하는 주소 추가 -->
									<span class="notice_cont_title">공지제목</span>
									<span class="notice_cont_date">2021-06-05</span>
								</a>
							</div>
						</section>
					</div>
					<!-- 2번째 줄 -->
					<div class="Main_line">
						<section class="Main_line2_section1">
							<div class="hostStats">
								<div class="hostStats_cont">
									<div class="hostStats_cont_title">
										이번달 진행 프립
									</div>
									<div class="hostStats_cont_stats">
										0
									</div>
								</div>
								<div class="hostStats_cont">
									<div class="hostStats_cont_title">
										이번 달 호스트 취소
									</div>
									<div class="hostStats_cont_stats">
										0
									</div>
								</div>
								<div class="hostStats_cont">
									<div class="hostStats_cont_title">
										전체 신청 완료
									</div>
									<div class="hostStats_cont_stats">
										0
									</div>
								</div>
							</div>
							
							<div class="hostStats">
								<div class="hostStats_cont">
									<div class="hostStats_cont_title">
										남겨진 후기
									</div>
									<div class="hostStats_cont_stats">
										0
									</div>
								</div>
								<div class="hostStats_cont">
									<div class="hostStats_cont_title">
										평균 평점
									</div>
									<div class="hostStats_cont_stats">
										0
									</div>
								</div>
								<div class="hostStats_cont">
									<div class="hostStats_cont_title">
										Q&A 응답률
									</div>
									<div class="hostStats_cont_stats">
										0
									</div>
								</div>
							</div>
						</section>
						
						<section class="Main_line2_section2">
							<div class="hostStats">
								<div class="hostStats_Sales">
									<div class="hostStats_Sales_title">이번 달 매출액</div>
									<div class="hostStats_Sales_stats">0</div>
								</div>
							</div>
							<div class="hostStats">
								<div class="hostStats_Sales">
									<div class="hostStats_Sales_title">전체 매출액</div>
									<div class="hostStats_Sales_stats">0</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>