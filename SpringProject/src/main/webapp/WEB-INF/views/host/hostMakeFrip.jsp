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
<link href="<%=request.getContextPath()%>/resources/css/hostMakeFrip.css"
	rel="stylesheet" />
<script src="./resources/js/hostMakeFrip.js"></script>
<!-- 카카오 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<h1 class="Main_title">프립 만들기</h1>
					<form method="post" action="<%=request.getContextPath()%>/insertFrip.do">
						<!-- 카테고리 선택 -->
						<div class="Main_line" id="first">
							<div class="Main_line_1">
								<div class="Main_line_title">
									카테고리를 선택해 주세요.
								</div>
								<div class="Category">
									<h4>1차 카테고리</h4>
									<select class="selectBox" name="firstCategory">
										<option value="">::: 선택 :::</option>
										<option value="액티비티">액티비티</option>
									</select>
									
									<h4>2차 카테고리</h4>
									<select class="selectBox" name="secondCategory">
										<option value="">::: 선택 :::</option>
										<option value="액티비티">액티비티</option>
									</select>
								</div>
							</div>
							
							<div class="Main_line_2">
								<div class="MakeTip">
									다음과 같은 경우, 오픈이 어렵습니다.<br>
									- 소개팅 / 남녀 만남 주선 프립<br>
									- 드라이브, 안전이 보장되지 않은 장소에서 진행하는 프립<br>
									- 개인 판매 또는 타 플랫폼과 금액 차이가 나는 프립<br>
									- 상품설명이 300자 이내인 프립(띄어쓰기 포함)<br>
									- 프립이후, 추가 영업이 의심되는 상품 (보험,재무설계 등)<br>
									- 상품에 대한 아래사항 3가지 설명이 부족한 상품<br>
									① 프립 진행 방식<br>
									② 이 프립을 추천하고 싶은 사람들<br>
									③ 이 프립을 통해 대원이 얻어갈 수 있는 것<br>
								</div>
							</div>
						</div>
						
						<!-- 프립명 -->
						<div class="Main_line">
							<div class="Main_line_1">
								<div class="Main_line_title">
									프립을 한 문장으로 <br> 표현해 주세요.
								</div>
								<div class="hash">
									<div class="little_title">캐치프레이즈</div>
									<input type="text" class="text" name="hash">
								</div>
								<div class="frip_title">
									<div class="little_title">프립명</div>
									<input type="text" class="text" name="fripTitle">
								</div>
							</div>
							
							<div class="Main_line_2">
								<div class="MakeTip">
									- 프립 목록에서 대원들에게 어필할 수 있는 포인트입니다.<br>
									- 공간, 요일, 액티비티를 프립명에 넣어주셔도 좋아요.<br>
									- 특수문자는 괄호 외에는 사용이 불가능합니다. (ex. '', "", ☆, ♥, ♠)
								</div>
							</div>
						</div>
						
						<!-- 이미지 업로드 -->
						<div class="Main_line">
							<div class="Main_line_1">
								<div class="Main_line_title">
									사진을 업로드해주세요.
								</div>
								<div class="fileUpload">
									<div>
										<h4>대표 이미지</h4>
										<img src="" id="poster" alt="미리보기" width="200" height="200">
										<input type="file" id="upload" class="form-control" 
												name="image" accept="image/*">
									</div>
								</div>
							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									- 최소: 가로 600px X 세로 600px<br>
									- 권장 : 가로 1000px X 세로 1000px (고해상도 지원)<br>
									- 1:1 비율의 (정사각형) 이미지를 권장합니다.<br>
									- 초상권, 저작권에 문제가 없어야 합니다.<br>
									- 상업적으로 사용 가능해야 합니다.<br>
									- 용량 10MB 이하<br>
									- 포맷 jpg, png
								</div>
							</div>
						</div>
						
						<!-- 인원 설정 -->
						<div class="Main_line">
							<div class="Main_line_1">
								<div class="Main_line_title">
									인원 및 구매 옵션 설정
								</div>
								<div class="schedule">
									<div>
										<div class="little_title">일정별 인원</div>
										<div class="people">
											<input type="number" class="optionNumber" value="10" min="1" max="50" name="number_people">
										</div>
									</div>
									<br><br><br><br>
									<!-- 옵션 수를 보내주는 히든값 
											받을 때 option,price뒤에 숫자 붙여서 이 값만큼 for문 돌려주면 됨 옵션 추가, 삭제 반영함-->
									<input type="hidden" class="optionQtt" value="1">
									<div class="schedule_option">
										<div class="little_title">구매옵션</div>
										<div class="optionTextDiv">
											<div class="1">
												<input type="text" class="optionText" value="참가비 (1인)" name="option1"> 
												<span>기본</span>
												<br>
												<input type="text" class="optionText" value="5000" name="price1" placeholder="가격">
												<span>원</span>
												<hr width="80%"> 
											</div>
										</div> 
										<input type="button" value="옵션 추가하기" class="btn btn-info" onclick="addOption()">
									</div>
								</div>
							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									<strong>일정별 인원</strong>
									<br>
									예) 마카롱 원데이 클래스의 인원을 일정별로<br>
									최소 1명 ~ 최대 10명으로 설정하여<br>
									해당 일정에 구매 옵션 상관없이 10명의 신청을 받을 수 있습니다.
									<br><br>
									<strong>예약 확정</strong>
									<br>
									구매후 대원과 호스트가 예약날짜를 확정한 시점을 기준으로 환불 불가로 바뀌며 노쇼를 방지하기 위한 기능
									<br><br>
									<strong>옵션명</strong>
									<br>
									예) 참가비 (1인) / 참가비(2인)<br>
									기본 옵션 / 선물 포장<br>
									헬스장 이용권 / 헬스장 이용+PT 10회
									<br><br>									
									<strong>가격</strong><br>
									가격은 추가 금액이 아닌 최종 결제 금액입니다.<br>
									예) 1회 이용권 | 30,000원<br>
									10회 이용권 | 280,000원<br>
								</div>
							</div>
						</div><!-- 인원설정 end -->
						
						<!-- 진행지 -->
						<div class="Main_line">
							<div class="Main_line_1">
								<div class="Main_line_title">
									어디에서 하나요?
								</div>
								<div class="location">
										<div class="little_title">프립 진행지</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="LocationOption" value="myLocation" checked>
									  <label class="form-check-label" for="inlineRadio1" >내 장소</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="LocationOption" value="online">
									  <label class="form-check-label" for="inlineRadio2">온라인</label>
									</div>
								</div>
								
								<div class="choiseLocation">
									<input type="text" id="address" class="address" 
											name="endArea" placeholder="기본주소" disabled>
									<input type="button" class="findAddress"
											value="주소 찾기" onclick="findAddr()" >	
									<input type="text" id="detailAddress" class="detailAddress" 
											name="endArea_detail" placeholder="상세주소">
								</div>
								<div class="little_title">집결지<small>선택사항</small></div>
								<div class="choiseLocation">
									<input type="text" id="address2" class="address" 
											name="startArea" placeholder="기본주소" disabled>
									<input type="button" class="findAddress"
											value="주소 찾기" onclick="findAddr2()" >	
									<input type="text" id="detailAddress2" class="detailAddress" 
											name="startArea_detail" placeholder="상세주소">
								</div>
							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									<Strong>프립 진행지</Strong><br>
									- 프립이 진행되는 장소의 주소를 입력해 주세요. (건물의 층, 호수까지)<br><br>
									
									<Strong>집결지</Strong><br>
									- 따로 인솔하여 프립 진행지로 이동하는 경우에만 입력해 주세요.<br>
								</div>
							</div>
						</div><!-- 진행지 end -->
						
						<!-- 상세 일정 -->
						<div class="Main_line">
							<div class="Main_line_1">
								<div class="Main_line_title">
									자세한 일정을 알려주세요
								</div>
								<div class="timeTable">
									<div class="little_title">상세 일정</div>
									<input type="button" value="세부 일정 추가" 
										class="btn btn-info" onclick="addSckedule()">
								</div> 
								<div class="timeTableCont">
									<input type="text" class="nameText" name="time1" placeholder="00분">
									<input type="text" class="contText" name="cont1" placeholder="세부 일정">
								</div>
								
							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									소요시간별로 구체적인 일정을 상세히 적어주세요.<br>
									상세 일정은 1개 이상 입력해주셔야 합니다.<br><br>
									
									예시)<br>
									30분 집결 및 간단한 소개<br>
									15분 준비 운동 으쌰으쌰<br>
									120분 신나는 등산 시작<br>
									30분 마무리 및 뒤풀이
								</div>
							</div>
						</div><!-- 상세 일정 -->
					</form>
					<div>
					<button value="다음" class="nextButton" onclick="prevSelect()">이전</button>
					<button value="다음" class="nextButton" onclick="nextSelect()">다음</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="./resources/js/showImage.js"></script>
</html>