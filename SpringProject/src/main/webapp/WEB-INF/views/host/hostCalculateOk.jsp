<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>host 정산요청</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/hostCalculateOk.css" rel="stylesheet" />
<script language="javascript">
	document.title = "정산" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
</head>
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
								<h2 class="cal_title">정산 완료</h2>
							</div>
							<div class="cal_date_section">
								<div class="cal_date" style="width: 282px;">  <!-- 233 -->
									<input type="date" value="2021-07-01">
									<div>-</div>
									<input type="date" value="2021-07-31">
								</div>
								<button class="ok_btn">조회</button>
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
								<div class="cal_item">
									<div>2020-09-01 00:00</div>
									<div class="item_title"><p>[30일 챌린지]하루에 한권씩aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p></div>
									<div>60</div>
									<div>10</div>
									<div>50</div>
									<div>100,000</div>
									<div>100,000</div>
									<div>100,000</div>
									<div>
										<button class="btn btn-primary">정산 요청</button>
										<button class="btn btn-secondary" disabled>정산 요청 완료</button>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>

		</div>

		<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>