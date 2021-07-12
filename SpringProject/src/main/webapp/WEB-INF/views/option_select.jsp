<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/option_select.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<%-- <jsp:include page="../include/menu.jsp" /> --%>
			
			<div class="option_page1">
				<div class="option_page2">
					<div class="option_page3">
					
						<header class="option_header">
							<button class="option_btn" type="button">
								<img
									src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M12 19.071L4.929 12 12 4.929M5 12h15'/%3E %3C/g%3E %3C/svg%3E"
									class="option_img">
							</button>
						</header>

						<div class="option_body">
							<div class="option_sel_tile">
								옵션 선택
								<button class="cal_btn">달력에서 보기</button>
							</div>
							<div class="option_select_section">
								<div class="option_arcodion">
									<button class="arcodion_selector" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										<div class="arcodion_div">
											<div>일정</div>
										</div>
										<div class="arcodion_btn">
											<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M18 0H0v18h18z'/%3E %3Cpath stroke='%23000' stroke-width='1.5' d='M7 5l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E"
												class="arcodion_img_up">
										</div>
									</button>
									<div class="option_list accordion-collapse collapse" id="collapseOne">
										<div class="option_item">
											<div class="option_item_date">2021년 7월 17일(토요일) 06:50</div>
											<div class="option_item_name">1 / 4명 | 신청 마감 7월 16일 14:00</div>
										</div>
										<div class="option_item">
											<div class="option_item_date">2021년 7월 17일(토요일) 06:50</div>
											<div class="option_item_name">1 / 4명 | 신청 마감 7월 16일 14:00</div>
										</div>
										<div class="option_item">
											<div class="option_item_date">2021년 7월 17일(토요일) 06:50</div>
											<div class="option_item_name">1 / 4명 | 신청 마감 7월 16일 14:00</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="sel_section">
							<div class="sel_div">
								<button class="option_btn sel_cancle_btn" type="button">
									<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M7.05 7.05l9.9 9.9M16.95 7.05l-9.9 9.9'/%3E %3C/g%3E %3C/svg%3E"
										class="option_img">
								</button>
								<div class="sel_name">
									<div>2021년 7월 17일(토요일) 06:50</div>
									<div class="sel_title">[Only 버스] 참가비(1인)</div>
								</div>
								<div class="price_ctn_section">
									<div class="sel_price">29,000원</div>
									<div class="sel_cnt">
										<i class="far fa-minus-square gray"></i>
										<input type="number" min="1" class="sel_cnt_input" value="1">
										<i class="far fa-plus-square"></i>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>	
			</div>
			
				
			<%-- <jsp:include page="../include/footer.jsp" /> --%>
		</div>
	</div>
</body>
</html>