<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>host 정산요청</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/hostCalculateReq.css" rel="stylesheet" />
</head>
<body>
	<div class="mainFrame">
		<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>

		<div class="Frame">
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>

				<div class="Main">
					
					<div class="cal_page">
							<div class="cal_header">
								<h2 class="cal_title">정산 요청</h2>
								<div style="width: 190px;">
									<select class="form-select form-select-lg mb-3 cal_select">
										<option value="">전체</option>
										<option value="">정산 요청 전</option>
										<option value="">정산 요청 완료</option>
										<option value="">정산 완료</option>
									</select>
								</div>
							</div>
							<div class="cal_body">
								<div class="cal_cate">
									<div>프립 진행일</div>
									<div>프립명</div>
									<div>구매</div>
									<div>참석</div>
									<div>불참</div>
									<div>매출</div>
									<div>수수료</div>
									<div>실 정산 금액</div>
									<div>상태</div>
								</div>
								<c:if test="${!empty list }">
									<c:forEach items="${list }" var="dto" varStatus="status">
										<div class="cal_item">
											<div>${dto.getClass_startDate() }</div>
											<div class="item_title"><p>${dto.getClass_title() }</p></div>
											<div>${buyList[status.index] }</div>
											<div>${enterList[status.index] }</div>
											<div>${buyList[status.index] - enterList[status.index] }</div>
											<div>100,000</div>
											<div>100,000</div>
											<div>100,000</div>
											<div>
												<c:if test="${dto.getClass_cal() == 0 }">
													<button class="btn btn-primary">정산 요청</button>
												</c:if>
												<c:if test="${dto.getClass_cal() == 1 }">
													<div><button class="btn btn-secondary" disabled>정산 요청 완료</button></div>
												</c:if>
												<c:if test="${dto.getClass_cal() == 2 }">
													<div><button class="btn btn-success" disabled>정산 완료</button></div>
												</c:if>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
				</div>
			</div>

		</div>

		<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>