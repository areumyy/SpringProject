<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostMyFrip</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostMyFrip.css"
	rel="stylesheet" />
<script language="javascript">
	document.title = "내 프립" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">	
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame"> 
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<h1 class="Main_title">내 프립</h1>
					
					<div class="info_frame">
						<div class="state">
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="location.href='hostMyFrip.do'">
							  <label class="btn btn-outline-primary" for="btnradio1">판매중</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="location.href='hostMyFripWait.do'">
							  <label class="btn btn-outline-primary" for="btnradio2">대기중</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked onclick="location.href='hostMyFripEnd.do'">
							  <label class="btn btn-outline-primary menuButton" for="btnradio3">종료</label>
							</div>
							
							<c:set var="list" value="${cList }"/>
								<c:forEach begin="0" end="1" varStatus="index">
									<div class="class_group">
										<c:if test="${!empty list }">
											<c:forEach var="dto" items="${list }" begin="${(index.count-1)*4 }" end="${(index.count-1)*4 +3}">
												<div class="class_item">
													<div class="class_item_div">
														<div class="class_item_thumbnail">
															<div class="class_item_top">
																<span class="class_area">${dto.getClass_endArea().substring(0,2) }</span>
								
															</div>
															<div class="class_item_image">
																<img class="class_img"
																	src="<%=request.getContextPath() %>/resources/upload/${dto.getClass_image()}" height="180px">
															</div>
														</div>
														<div class="class_item_hash">${dto.getClass_hash() }</div>
														<div class="class_item_title"><p class="main-block-desc">${dto.getClass_title() }</p></div>
															<div class="class_item_state">상태 <span class="state_text">종료</span></div>
														<div class="class_Button_div1">
															<c:if test="${dto.getClass_cal() == 0 }">
																<a href="<%=request.getContextPath()%>/hostEndCheck.do?class_num=${dto.getClass_num()}&page=${Paging.getPage()}">종료확인</a>
															</c:if>
															<c:if test="${dto.getClass_cal() == 3 }">
																<a>종료완료</a>
															</c:if>
															<c:if test="${dto.getClass_cal() == 1 }">
																<a>정산신청완료</a>
															</c:if>
															<c:if test="${dto.getClass_cal() == 2 }">
																<a>정산완료</a>
															</c:if>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
									</div>
								</c:forEach>
								<c:if test="${empty list }">
									프립이 없습니다.
								</c:if>
						</div>
						<!-- 페이징 처리 부분 -->
						<nav aria-label="Page navigation example" class="list_footer">
							<ul class="pagination">
								<c:if test="${Paging.getPage() > Paging.getBlock() }">
									<li class="page-item">
										<a class="page_link" href="hostMyFripEnd.do?page=1">
											<span aria-hidden="true">&laquo;</span>
										</a>
										<a class="page_link" href="hostMyFripEnd.do?page=${Paging.getPage() - 1 }">	
											<span aria-hidden="true">&lt;</span>
										</a>
									</li>
								</c:if>
								<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
									<c:if test="${i == Paging.getPage() }">
										<li class="page-item"><a class="page_link paging_active">${i }</a></li>
									</c:if>
									<c:if test="${i != Paging.getPage() }">
										<li class="page-item"><a class="page_link" href="hostMyFripEnd.do?page=${i }">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
									<li class="page-item">
										<a class="page_link" href="hostMyFripEnd.do?page=${Paging.getPage() + 1 }">	
											<span aria-hidden="true">&gt;</span>
										</a>
										<a class="page_link" href="hostMyFripEnd.do?page=${Paging.getAllPage() }">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>