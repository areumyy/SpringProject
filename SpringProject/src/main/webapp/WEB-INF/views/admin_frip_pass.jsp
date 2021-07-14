<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_프립 승인</title>
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
<link href="<%=request.getContextPath()%>/resources/css/admin.css"
	rel="stylesheet" />
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
						      <th scope="col" width="5%"></th>
						      <th scope="col" width="10%">호스트 번호</th>
						      <th scope="col" width="10%">호스트 이름</th>
						      <th scope="col" width="30%">클래스명</th>
						      <th scope="col" width="10%">1차 카테고리</th>
						      <th scope="col" width="10%">2차 카테고리</th>
						      <th scope="col" width="10%">신청일자</th>
						      <th scope="col" width="5%">승인상태</th>
						      <th scope="col" width="10%"></th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">12344</th>
						      <td>15</td>
						      <td>라이언</td>
						      <td>[▼1만원할인/부산] 선선한 아침 광안리에서 즐기는 썬라이즈rgtsregargsregesrgesrgesrger</td>
						      <td>아웃도어</td>
						      <td>서핑</td>
						      <td>2021-07-01</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>9</td>
						      <td>춘식이</td>
						      <td>캐릭터 석고 방향제&캔들 SET 만들기 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>캔들</td>
						      <td>2021-07-10</td>
						      <td>거부</td>
						      <td><button>상세보기</button></td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr>
						     <tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr><tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
						     </tr><tr>
						      <th scope="row">3</th>
						      <td>23</td>
						      <td>어피치</td>
						      <td>한남동 플라워 원데이 클래스 4가지 선택 (예약 가능)</td>
						      <td>공예DIY</td>
						      <td>플라워</td>
						      <td>2021-07-13</td>
						      <td>대기</td>
						      <td><button>상세보기</button></td>
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
						      <th scope="col" width="5%"></th>
						      <th scope="col" width="10%">호스트 번호</th>
						      <th scope="col" width="10%">호스트 이름</th>
						      <th scope="col" width="30%">클래스명</th>
						      <th scope="col" width="10%">1차 카테고리</th>
						      <th scope="col" width="10%">2차 카테고리</th>
						      <th scope="col" width="10%">승인일자</th>
						      <th scope="col" width="5%">승인상태</th>
						      <th scope="col" width="10%"></th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>36</td>
						      <td>네오</td>
						      <td>꼬끄, 필링 데코레이션까지 ONLY 쏭카롱 원데이 클래스 (예약 가능)</td>
						      <td>베이킹</td>
						      <td>디저트</td>
						      <td>2021-07-13</td>
						      <td>완료</td>
						      <td><button>상세보기</button></td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>5</td>
						      <td>튜브</td>
						      <td>프리다이빙 자격증따기! (예약 가능)</td>
						      <td>스포츠</td>
						      <td>실내다이빙</td>
						      <td>2021-07-13</td>
						      <td>완료</td>
						      <td><button>상세보기</button></td>
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