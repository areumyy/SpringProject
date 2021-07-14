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
<link href="<%=request.getContextPath() %>/resources/css/mypage_energy.css" rel="stylesheet"/>
</head>
<body>
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">



				<div class="pg_main">
					<div class="pg_wrapper">
						<div class="pg_container">
							<header class="pg_header_wrapper">
								<h1 class="pg_header_txt">에너지</h1>
								<div class="myenergy">0 보유</div>
							</header>
							<div class="mypage_energy_wrapper">
								<form class="serialNumber_wrapper">
									<input class="serialNumber" placeholder="에너지 코드를 입력하세요">
									<button type="submit" class="serialNumber_button">충전</button>
								</form>
								<div class="energy_list_wrapper">
									<div class="energy_cont_wrapper">
										<div class="energyCard_wrapper">
											<div class="energyCard_content_wrapper">
												<div class="energyCard_header">
													<div class="energyCard_date_wrapper">
														<div class="energyCard_date">7월 13일</div>
													</div>
													<div class="energyCard_info">
														<div class="energyCard_header_title">카카오 선물하기 1만원권</div>
														<div class="energyCard_date">유효기간 2021-12-29 까지</div>
														<div class="myenergy_count">+10,000</div>
													</div>
												</div>
											</div>
										</div>
										<div class="energyCard_wrapper">
											<div class="energyCard_content_wrapper">
												<div class="energyCard_header">
													<div class="energyCard_date_wrapper">
														<div class="energyCard_date">7월 13일</div>
													</div>
													<div class="energyCard_info">
														<div class="energyCard_header_title">카카오 선물하기 1만원권</div>
														<div class="energyCard_date">유효기간 2021-12-29 까지</div>
														<div class="myenergy_count">+10,000</div>
													</div>
												</div>
											</div>
										</div>
										<div class="energyCard_wrapper">
											<div class="energyCard_content_wrapper">
												<div class="energyCard_header">
													<div class="energyCard_date_wrapper">
														<div class="energyCard_date">7월 13일</div>
													</div>
													<div class="energyCard_info">
														<div class="energyCard_header_title">카카오 선물하기 1만원권</div>
														<div class="energyCard_date">유효기간 2021-12-29 까지</div>
														<div class="myenergy_count">+10,000</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 내용이 없을경우 -->
								<%-- <div class="empty_wrapper">
									<img class="empty_icon" src="<%=request.getContextPath() %>/resources/image/mypage/empty_energy.svg">
									<div class="empty_txt">에너지 내역이 없습니다.</div>
								</div> --%>
							</div>
						</div>
					</div>
				</div>



			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>