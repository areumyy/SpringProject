<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostMain</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
								<a href="<%=request.getContextPath() %>/hostNotice_list.do" class="notice_more"> <!-- 전체 공지로 이동 -->
									더 보기
								</a>
							</div>
							<c:set var="Nlist" value="${NList }"/>
							<div class="accordion" id="accordionExample">
								<ul class="notice_list">
									<c:if test="${!empty Nlist }">
									<c:forEach var="dto" items="${Nlist }" begin="0" end="4" varStatus="index">
										<li>
											<span>공지</span>
											<div class="notice_list_item">
												<div class="notice_title collapsed" data-bs-toggle="collapse" data-bs-target="#collapse${index.count }" aria-expanded="false">${dto.getNotice_title() }</div>
												<div class="notice_regdate">${dto.getNotice_regdate().substring(0,16) }</div>
											</div>
											<div class="notice_list_item_ans accordion-collapse collapse" id="collapse${index.count }" data-bs-parent="#accordionExample" style="">
												<p style="white-space: pre-line;">
													${dto.getNotice_cont() }
												</p>
											</div>
										</li>
									</c:forEach>
									</c:if>
									
									<c:if test="${empty Nlist }">
										공지사항이 없습니다.
									</c:if>
								</ul>
							</div>
							<!--  -->
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