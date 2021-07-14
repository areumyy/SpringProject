<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_정산 승인</title>

<!-- 반응형 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<!-- CSS 파일 -->
<link href="<%=request.getContextPath()%>/resources/css/admin.css" rel="stylesheet" />

</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../include/adminMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../include/adminSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<!-- 승인 대기 -->
					<div class="pass_box">
						<div class="pass_box_title">승인 대기</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 번호</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">진행일자</th>
						      <th scope="col">프립명</th>
						      <th scope="col">매출</th>
						      <th scope="col">수수료</th>
						      <th scope="col">실 정산 금액</th>
						      <th scope="col">신청일자</th>
						      <th scope="col">승인여부</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>15</td>
						      <td>라이언</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈rgtsregargsregesrgesrgesrger</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>대기</td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>9</td>
						      <td>춘식이</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>캐릭터 석고 방향제&캔들 SET 만들기 (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>대기</td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>대기</td>
						     </tr>
						  </tbody>
						</table>
					</div>
					
					<!-- 승인 완료 -->
					<div class="pass_box">
						<div class="pass_box_title">승인 완료</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 번호</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">진행일자</th>
						      <th scope="col">프립명</th>
						      <th scope="col">매출</th>
						      <th scope="col">수수료</th>
						      <th scope="col">실 정산 금액</th>
						      <th scope="col">정산일자</th>
						      <th scope="col">승인여부</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>36</td>
						      <td>네오</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>꼬끄, 필링 데코레이션까지 ONLY 쏭카롱 원데이 클래스 (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>완료</td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>5</td>
						      <td>튜브</td>
						      <td>2021-07-01 ~ 2021-07-05</td>
						      <td>프리다이빙 자격증따기! (예약 가능)</td>
						      <td>100,000</td>
						      <td>10,000</td>
						      <td>90,000</td>
						      <td>2021-07-14</td>
						      <td>완료</td>
						    </tr>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
	
		</div>
		
	<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>