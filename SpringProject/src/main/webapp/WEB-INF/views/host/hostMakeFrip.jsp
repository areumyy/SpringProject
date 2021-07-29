<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hostMakeFrip</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostMakeFrip.css"
	rel="stylesheet" />
<script src="./resources/js/hostMakeFrip.js"></script>
<!-- 카카오 지도 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 썸머노트 -->
 <script src="./resources/summernote/summernote-lite.js"></script>
<script src="./resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
<script language="javascript">
	document.title = "프립 만들기" ;
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
					<h1 class="Main_title">프립 만들기</h1>
					
						<div class="btn-group buttonGroup" role="group" aria-label="Basic radio toggle button group">
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="a1" autocomplete="off" checked onclick="change_div(1)">
						  <label class="btn btn-outline-primary" for="btnradio1">카테고리</label>	
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="" autocomplete="off" onclick="change_div(2)">
						  <label class="btn btn-outline-primary" for="btnradio2">프립명</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" value="" autocomplete="off" onclick="change_div(3)">
						  <label class="btn btn-outline-primary" for="btnradio3">이미지</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" value="" autocomplete="off" onclick="change_div(4)">
						  <label class="btn btn-outline-primary" for="btnradio4" >진행일</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio5" value="" autocomplete="off" onclick="change_div(5)">
						  <label class="btn btn-outline-primary" for="btnradio5">인원 및 옵션</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio6" value="" autocomplete="off" onclick="change_div(6)">
						  <label class="btn btn-outline-primary" for="btnradio6">진행지</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio7" value="" autocomplete="off" onclick="change_div(7)">
						  <label class="btn btn-outline-primary" for="btnradio7">상세 일정</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio8" value="" autocomplete="off" onclick="change_div(8)">
						  <label class="btn btn-outline-primary" for="btnradio8">포함사항</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio9" value="" autocomplete="off" onclick="change_div(9)">
						  <label class="btn btn-outline-primary" for="btnradio9">준비물</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio10" value="" autocomplete="off" onclick="change_div(10)">
						  <label class="btn btn-outline-primary" for="btnradio10">프립소개</label>
						  <input type="radio" class="btn-check" name="btnradio" id="btnradio11" value="" autocomplete="off" onclick="change_div(11)">
						  <label class="btn btn-outline-primary" for="btnradio11">최종 확인</label>
						</div>
					
					<form method="post" action="<%=request.getContextPath()%>/insertFrip.do"
						 onsubmit="return checkIt();" enctype="multipart/form-data">
						<!-- 카테고리 선택 -->
						<div class="Main_line" id="main_1">
							<div class="Main_line_1">
								<div class="Main_line_title">
									카테고리를 선택해 주세요.
								</div>
								<div class="Category">
									<c:set var="cList" value="${cateList }"/>
										<h4>1차 카테고리</h4>
											<select class="selectBox" name="class_category1" 
												onclick="change_cate_two()">
												<option value="" >::: 선택 :::</option>
												<c:forEach items="${cList }" var="dto">
													<option value="${dto.getCate_one() }" >${dto.getCate_one() }</option>
												</c:forEach>
											</select>
										<br><br>
										<h4>2차 카테고리</h4>
										<select class="selectBox" name="class_category2">
											<option value="">::: 선택 :::</option>
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
						<div class="Main_line_hidden" id="main_2">
							<div class="Main_line_1">
								<div class="Main_line_title">
									프립을 한 문장으로 <br> 표현해 주세요.
								</div>
								<div class="hash">
									<div class="little_title">캐치프레이즈</div>
									<input type="text" class="text" name="class_hash" onkeyup="fn_checkByte(this, 20,1)">
									<span id="nowByte1">0</span>/20
								</div>
								<div class="frip_title">
									<div class="little_title">프립명</div>
									<input type="text" id="fripTitleText" class="text" name="class_title" onkeyup="fn_checkByte(this, 20,2)">
									<span id="nowByte2">0</span>/20
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
						<div class="Main_line_hidden" id="main_3">
							<div class="Main_line_1">
								<div class="Main_line_title">
									사진을 업로드해주세요.
								</div>
								<div class="fileUpload">
									<div>
										<h4>대표 이미지</h4>
										<img src="" id="poster" alt="미리보기" width="200" height="200">
										<input type="file" id="upload" class="form-control" 
												name="class_image2" accept="image/*">
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
						
						<!-- 진행일 -->
						<div class="Main_line_hidden" id="main_4">
							<div class="Main_line_1">
								<div class="Main_line_title">
									진행일 설정
								</div>
								<div class="schedule">
									<div>
										<div class="little_title">시작일</div>
										<input type="date" name="class_startDate">
									</div>
									<br><br><br><br>
									<div>
										<div class="little_title">종료일<small>(선택사항)</small></div>
										<input type="date" name="class_endDate">
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
						</div><!-- 진행일 end -->
						
						<!-- 인원 설정 -->
						<div class="Main_line_hidden" id="main_5">
							<div class="Main_line_1">
								<div class="Main_line_title">
									인원 및 구매 옵션 설정
								</div>
								<div class="schedule">
									<div>
										<div class="little_title">일정별 인원</div>
										<div class="people">
											<input type="number" class="optionNumber" name="class_count">
										</div>
									</div>
									<br><br><br><br>
									<!-- 옵션 수를 보내주는 히든값 
											받을 때 option,price뒤에 숫자 붙여서 이 값만큼 for문 돌려주면 됨 옵션 추가, 삭제 반영함-->
									<input type="hidden" class="optionQtt" name="optionQtt" value="1">
									<div class="schedule_option">
										<div class="little_title">구매옵션</div>
										<div class="optionTextDiv">
											<div class="1">
												<input type="text" class="optionText" value="참가비 (1인)" name="option_name1"> 
												<span>기본</span>
												<br>
												<input type="text" class="optionText" value="5000" name="option_price1" placeholder="가격">
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
						<div class="Main_line_hidden" id="main_6">
							<div class="Main_line_1">
								<div class="Main_line_title">
									어디에서 하나요?
								</div>
								<div class="location">
										<div class="little_title">프립 진행지</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="LocationOption" 
									  	onclick="myLocationButton()" value="myLocation" checked>
									  <label class="form-check-label" for="inlineRadio1" >내 장소</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="LocationOption" value="online" onclick="onlineButton()">
									  <label class="form-check-label" for="inlineRadio2">온라인</label>
									</div>
								</div>
								
								<div class="choiseLocation">
									<input type="text" id="address" class="address" 
											name="class_endArea2" placeholder="기본주소" disabled>
									<input type="button" class="findAddress"
											value="주소 찾기" onclick="findAddr()" >	
									<input type="text" class="detailAddress" id="detailAddress"
											name="class_endAreaDetail" placeholder="상세주소">
								</div>
								<input type="hidden" name="class_endArea" value="">
								<div class="little_title">집결지<small>선택사항</small></div>
								<div class="choiseLocation">
									<input type="text" id="address2" class="address" 
											name="class_startArea" placeholder="기본주소" disabled>
									<input type="button" class="findAddress"
											value="주소 찾기" onclick="findAddr2()" >	
									<input type="text" class="detailAddress" id="detailAddress2"
											name="class_startAreaDetail" placeholder="상세주소">
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
						<div class="Main_line_hidden" id="main_7">
							<div class="Main_line_1">
								<div class="Main_line_title">
									자세한 일정을 알려주세요
								</div>
								<div class="timeTable">
									<div class="little_title">상세 일정</div>
								</div> 
								<div class="timeTableCont">
									<textarea rows="20" cols="60" 
									placeholder="예시) 30분 집결 및 간단한 소개" name="class_plan"onkeyup="fn_checkByte(this, 500,7)"></textarea>
									<div class="nowByte"><span id="nowByte7" >0</span>/500</div>
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
						</div><!-- 상세 일정 end-->
						
						<!-- 포함 사항 -->
						<div class="Main_line_hidden" id="main_8">
							<div class="Main_line_1">
								<div class="Main_line_title">
									무엇을 제공하나요?
								</div>
								<div class="timeTable">
									<div class="little_title">포함사항</div>
								</div> 
								<div class="timeTableCont">
									<textarea rows="10" cols="60" placeholder="포함사항을 입력해주세요" name="class_include" onkeyup="fn_checkByte(this, 500,3)"></textarea>
									<div class="nowByte"><span id="nowByte3" >0</span>/500</div>
								</div>
								<br><br>
								<div class="timeTable">
									<div class="little_title">불포함사항</div>
								</div> 
								<div class="timeTableCont">
									<textarea rows="10" cols="60" placeholder="불포함사항을 입력해주세요" name="class_exclude" onkeyup="fn_checkByte(this, 500,4)"></textarea>
									<div class="nowByte"><span id="nowByte4" >0</span>/500</div>
								</div>

							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									프립 상세페이지에 노출시킬 포함/불포함사항을 입력해 주세요.

									예시) 가이드비 / 장비 대여비 / 장소 이용료 / 안전 보험료 / 차량 / 
									식사 / 입장료 / 물 / 간식 / 주차장 / 강습비 / 탈의실 / 샤워실 / 
									운동복 / 짐 보관 / 숙소 / 픽업 / 리프트권 / 행동식 / 기념품 / 
									안주 / 음료 / 완주증 / 기록 측정 / 운동화 / 기사비 / 차량 보험료 / 
									교재비 / 컨설팅
								</div>
							</div>
						</div><!-- 포함 사항 end -->
						
						<!-- 준비물 -->
						<div class="Main_line_hidden" id="main_9">
							<div class="Main_line_1">
								<div class="Main_line_title">
									준비물 및 유의사항 <small>선택사항</small>
								</div>
								<div class="timeTable">
									<div class="little_title">준비물</div>
								</div> 
								<div class="timeTableCont">
									<textarea rows="10" cols="60" name="class_supply" placeholder="준비물 가이드를 참고하여 작성해주세요." onkeyup="fn_checkByte(this, 500,5)"></textarea>
									<div class="nowByte"><span id="nowByte5" >0</span>/500</div>
								</div>
								<br><br>
								<div class="timeTable">
									<div class="little_title">유의사항</div>
								</div> 
								<div class="timeTableCont">
									<textarea rows="10" cols="60" name="class_notice" placeholder="유의사항 및 신청시 유의사항을 가이드를 참고하여 작성해 주세요" onkeyup="fn_checkByte(this, 500,6)"></textarea>
									<div class="nowByte"><span id="nowByte6" >0</span>/500</div>
								</div>

							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									<Strong>준비물</Strong>
									<br>
									<Strong>유의사항</Strong>
									- 1인당 최대 구매 가능 수량
									<br>
									<br>
									예)
									- 1인당 최대 구매 가능 수량 : 1인 3매 or 제한없음(최대인원으로 설정)
								</div>
							</div>
						</div><!-- 준비물 end -->
						
						<!-- 프립을 소개해 주세요 -->
						<div class="Main_line_hidden" id="main_10">
							<div class="Main_line_1">
								<div class="Main_line_title">
								 	프립을 소개해주세요!
								</div>
								<div class="timeTableCont">
									<textarea id="summernote" name="class_cont"></textarea>
								</div>
							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									클래스에 대해 소개해주세요.<br>
									[필수]<br>
									· 이미지 5장 이상 (이미지별 콘텐츠 설명 1~2줄)<br>
									· 참여 시 얻을 수 있는 효과<br>
									· 진행 종목에 대한 소개<br>
									· 난이도 설명을 해주세요. (ex. 초급, 중급, 고급)<br>
									<br>
									[선택]
									· 강사 소개나 자격증은 신뢰도를 높일 수 있어요<br>
									· 정규 클래스/다회차 클래스일 경우 각 회차별 세부 커리큘럼을 기재해주세요.<br>
									<br>
									- 개인 연락처, 카카오톡 ID, 오픈카톡, SNS 주소, 외부링크 등은 기재가 불가합니다.<br>
									- 프립을 통해서가 아닌 외부로 접근한 대원이 호스트님과 직접 현장결제 혹은 구매할 경우, 보호할 수 없으니 참고 부탁드립니다.<br>
									(* 대원이 프립App/Web을 통해 상품을 확인하고 결제하면, 호스트 관리페이지를 통해 확인 및 원활한 운영이 가능하니 참고 부탁드립니다)<br>
									- 사용하는 사진은 저작권 및 상표권에 문제가 없어야 합니다.<br>
									- 너무 많은 사진과 텍스트는 가독성이 떨어져 프립 매력도가 떨어집니다. 사진 10장 이내, 적당한 텍스트 기재를 추천 드립니다.<br>
									- 텍스트 컬러, 배경색 컬러는 불가하오니, 텍스트는 검정색으로 통일 부탁드립니다.
								</div>
							</div>
						</div><!-- 프립 소개 end -->
						
						<!-- 프립을 소개해 주세요 -->
						<div class="Main_line_hidden" id="main_11">
							<div class="Main_line_1">
								<div class="Main_line_title">
								 	최종확인
								</div>
								<div class="final_confirm">
									<div class="final_confirm_frame">
										<div class="confirm_img">
											<img src="" name="confirm_img" alt="이미지 없음" width="100%">
										</div>
										<div class="final_frip_info">
											<section class="info_section">
												<div class="info_title" id="fripTitle">
													
												</div>
												<div class="info_price">
													34% 123,456원
												</div>
											</section>
											<section class="info_section1">
												<div class="info_hostInfo">
													<img width="56px" height="42px"src="<%=request.getContextPath() %>/resources/logo/logo.png">
													<div class="info_hostInfo_text">
														dsa13 ><br>
														프립 13 | 후기 14 | 저장 342
													</div>
												</div>
												
												<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='none' viewBox='0 0 32 32'%3E %3Cpath fill='%23F4F4F4' stroke='%23CCC' stroke-width='1.5' d='M15.043 19.962l-.029.02-.026.021-7.571 6.384V5.827c0-1.273 1.155-2.41 2.73-2.41h11.706c1.569 0 2.73 1.138 2.73 2.41v20.56l-7.572-6.384-.026-.022-.028-.02c-.292-.203-.634-.293-.957-.293-.324 0-.666.09-.957.294z'/%3E %3C/svg%3E" alt="상품 저장 아이콘">
											</section>
											
											<section class="info_section2">
												<div>
													<Strong>아직 후기가 없어요.</Strong><br>
													첫 후기를 남기고 1,000에너지 받아가세요.
												</div>
											</section>
											
											<section class="info_section3">
												<div class="info_title">
													프립소개
												</div>
												<div id="fripInfo">
													
												</div>
											</section>
											
											<section class="info_section3">
												<div class="info_title">
													포함 사항
												</div>
												<div id="include">
													
												</div>
											</section>
											
											<section class="info_section3">
												<div class="info_title">
													불포함 사항
												</div>
												<div id="exclude">
													
												</div>
											</section>
											
											<section class="info_section3">
												<div class="info_title">
													세부일정
												</div>
												<div id="plan">
													
												</div>
											</section>
											
											<section class="info_section3">
												<div class="info_title">
													유의 사항
												</div>
												<div class="notice">
													<p>프립에서 구매하시지 않는 경우, 환불 거부, 서비스 불이행 등의 문제가 생길 수 있습니다.</p>
												</div>
											</section>
											
											<section class="info_section3">
												<div class="info_title">
													진행 장소
												</div>
												<div id="location">
													
												</div>
											</section>
										</div>
									</div>
								</div>
							</div>
							<div class="Main_line_2">
								<div class="MakeTip">
									프립 앱에서 보이는 상품 상세 레이아웃입니다.<br>
									입력한 사항을 최종 확인해 주세요.<br>
									가격 및 저장 등의 숫자들은 참조용입니다.
								</div>
							</div>
						</div><!-- 프립 소개 end -->
						<input type="button" value="이전" class="btn btn-light prevButton" onclick="prevSelect()">
						<input type="button" value="다음" class="btn btn-primary nextButton" onclick="nextSelect()">
					</form>
					<div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="./resources/js/showImage.js"></script>
</html>