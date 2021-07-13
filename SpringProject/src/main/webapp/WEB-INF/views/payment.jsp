<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="<%=request.getContextPath() %>/resources/css/payment.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
				<div class="article">

				<div class="pay_page">
					<div class="pay_div">
						<div class="pay_header">결제</div>
						<div class="pay_body">
							<div class="Accordion__Wrapper-sc-11ajjas-0 fhiIvu">
								<div class="Accordion__SectionLabelWrapper-sc-11ajjas-2 jpZuSu">
									<div font-size="14px"
										class="AccordionLabelWrapper-sc-1t4rj3d-0 gFraIz">선택한 프립</div>
									<div class="Accordion__ChevronWrapper-sc-11ajjas-1 ejNywc">
										<img
											src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M18 0H0v18h18z'/%3E %3Cpath stroke='%23000' stroke-width='1.5' d='M7 5l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E"
											class="Accordion__IconArrow-sc-11ajjas-3 dTjHAc">
									</div>
								</div>
								<div class="Accordion__Content-sc-11ajjas-4 impDuH">
									<div class="Payment__PurchasedItemWrapper-ixk3fj-2 eanEWH">
										<div class="Product__Wrapper-sc-1lkmgat-0 bfIopB">
											<div class="Product__ImageWrapper-sc-1lkmgat-4 hNCWrM">
												<div class="Image__Wrapper-v97gyx-0 gDuKGF">
													<img class="Image__StyledImageLoader-v97gyx-2 bUFcfh"
														width="130"
														src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,w_130/1610_Gongbang_01_1477457672181">
													<div class="Fade__Wrapper-sc-1s0ipfq-0 koasSX"
														style="opacity: 1; display: block;">
														<div class="Ratio " style="display: block;">
															<div class="Ratio-ratio "
																style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																<div class="Ratio-content "
																	style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																	<img alt="상품 이미지"
																		class="Image__StyledImage-v97gyx-1 VUNpu" width="130"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,w_130/1610_Gongbang_01_1477457672181">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Product__TextWrapper-sc-1lkmgat-1 cRXmLk">
												<span class="Product__CatchPhrase-sc-1lkmgat-2 hCwoPE">도예
													공방에서 세상에서 단 하나뿐인</span><span
													class="Product__Title-sc-1lkmgat-3 letiTL">도예 공방 원데이
													/ 도자기 그릇 만들기 (예약가능)</span>
											</div>
										</div>
										<div
											class="Payment__PurchasedItemNodeListWrapper-ixk3fj-3 gzpEVC">
											<div class="PurchasedItem__Wrapper-l57aqo-0 cccMXz">
												<div class="PurchasedItem__InfoWrapper-l57aqo-2 bvgcsO">
													<div>
														<div>1인 이용권 x 1개</div>
													</div>
													<span class="PurchasedItem__Price-l57aqo-1 kaMGkK">32,000원</span>
												</div>
												<div
													class="PurchasedItem__AdditionalOptionWrapper-l57aqo-4 fKfJoj">
													<div>
														<div></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="Payment__TotalInfoWrapper-ixk3fj-5 gjgFK">
								<div class="Payment__InfoTable-ixk3fj-6 fLBRir">
									<div class="Payment__InfoLabel-ixk3fj-7 hjRpEr">상품 금액</div>
									<div class="Payment__InfoValue-ixk3fj-8 ePLGop">32,000 원</div>
								</div>
								<div class="Payment__InfoTable-ixk3fj-6 fLBRir">
									<div class="Payment__InfoLabel-ixk3fj-7 hjRpEr">쿠폰 / 할인
										코드</div>
									<div class="Payment__InfoValue-ixk3fj-8 ePLGop">
										- 0 원
										<button width="90px" height="38px"
											class="Button-bqxlp0-0 Payment__DiscountMethodButton-ixk3fj-10 cfIyMM">선택</button>
									</div>
								</div>
								<div class="Payment__InfoTable-ixk3fj-6 fLBRir">
									<div class="Payment__InfoLabel-ixk3fj-7 hjRpEr">
										에너지<span class="Payment__AvailablePoint-ixk3fj-11 iomjgN">보유
											0</span>
									</div>
									<div class="Payment__InfoValue-ixk3fj-8 ePLGop">
										<label><input type="text"
											class="Payment__PointInput-ixk3fj-12 iVkred" value="0">E</label>
										<button width="90px" height="38px"
											class="Button-bqxlp0-0 Payment__DiscountMethodButton-ixk3fj-10 cfIyMM">전체
											사용</button>
									</div>
								</div>
								<ul class="Payment__NoticeWrapper-ixk3fj-22 cXwieY">
									<li class="Payment__Notice-ixk3fj-23 jCZNar">에너지는 100E부터
										사용 가능합니다.</li>
									<li class="Payment__Notice-ixk3fj-23 jCZNar">쿠폰/할인코드/에너지를
										사용한 결제시 개별 취소가 불가합니다.</li>
								</ul>
								<div class="Payment__FinalPriceWrapper-ixk3fj-9 FcSoz">
									<div class="Payment__InfoTable-ixk3fj-6 jdXbyD">
										<div class="Payment__InfoLabel-ixk3fj-7 hjRpEr">할인 금액</div>
										<div class="Payment__InfoValue-ixk3fj-8 ePLGop">- 0 원</div>
									</div>
									<div class="Payment__InfoTable-ixk3fj-6 jdXbyD">
										<div class="Payment__InfoLabel-ixk3fj-7 hjRpEr">최종 결제 금액</div>
										<div class="Payment__InfoValue-ixk3fj-8 ePLGop">32,000 원</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="PaymentSection__Wrapper-sc-1hsgot2-0 jaXpBa">
						<div class="PaymentSection__Header-sc-1hsgot2-1 kyCcfD">결제수단</div>
						<div class="PaymentSection__Body-sc-1hsgot2-2 epIMIL">
							<div class="Payment__PaymentMethodWrapper-ixk3fj-4 jRhTXx">
								<button width="100px" font-size="13px"
									class="Button-bqxlp0-0 ButtonPayMethod__StyledButton-sc-185du86-0 ShAhH">신용/체크
									카드</button>
								<button width="100px" font-size="13px"
									class="Button-bqxlp0-0 ButtonPayMethod__StyledButton-sc-185du86-0 ShAhH">핸드폰
									결제</button>
								<button width="100px" font-size="13px"
									class="Button-bqxlp0-0 ButtonPayMethod__StyledButton-sc-185du86-0 ShAhH">실시간
									계좌이체</button>
								<button width="100px" font-size="13px"
									class="Button-bqxlp0-0 ButtonPayMethod__StyledButton-sc-185du86-0 ShAhH">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGoAAAAYCAMAAAAlFZhvAAAAOVBMVEX9JBr/9vb+mJT9OzL+W1P/393+p6L////9LiT/6ej9UUn+ZV7+tLD9SD/+f3n+jYj+cWr/1NL/xsMoS+mfAAACdUlEQVRIx6VW2bKlIAxkVWTH///YEUIgoKfqVk2eNIR0lg7AeFIWROXjOokUJWXq37dTnq5d2Ubev7VQ0jAToufEgvtoH610Ap2yzKjEaX2ZqgCsUj8J1hWqLSy5uduksV3Iqc4aoMwCxaRG4wi7W0yifY6ls8UXxsqUAClou2jN0aB2kT0w3mMQ9ce3T4VI8JtHPERyy1Tu6jSgwtOqYKaWhAvQYcJiaWuSBxopBRbM1nVECspi0Q6EgrR900vwNwJrLdLgvbQlhZsLWKi7mUQMVPWqXY0dEMMTGIU67/ZTRo3UaEmPP/CRb60UMCIOyjpbeQHlDdhZDlZuhYJUWhqtr9DdezKhBl0M1lV3H5vYjUMcOKJXqIBQBZz46YtDRW8eRuqQnt6QNG3rHBUmFihg3Y05+O5fkw0yTk9qoSXKsQQ/81QLVMSfC/mRSDPICLlZbrFDpdngRdV5Vjjn1+3G9CR0cs0xRhbUXaAwnYir5HcDWx/Ma4RrF1ohAcDRecIBAKL8N5TAcjtd5aAnyM2Wlksy8VPiu4CCFHA7rV7niqduLHr4My2aoVuBop5HHBVL3bil2z/Inn6RPQkhDl9oEKvcX1CF7WnN89KULal9hImHVdwXVPcxDiatmCxYFIlYPHerD6i2lA8UeiZsUD0o23K+kul8gIPIwPV7W7z33lDXrlEz9A1q3jTjEjE/LhF/fkClfS5gKvgX1K+r0XyNEEwWhXKEBmR+Jjfz68x5vU1KWJntxzNG7fNmX5MS5v27PJ2edxV5WYwIuSCJZciEPY+zeK2zbTfFeaj+6DlLVq+TqCT15C1tXErBfQ71yebGi+8fJtsuXWZ/I2MAAAAASUVORK5CYII="
										alt="pg-payco"
										class="ButtonPayMethod__Logo-sc-185du86-1 cligJe">
								</button>
								<button width="100px" font-size="13px"
									class="Button-bqxlp0-0 ButtonPayMethod__StyledButton-sc-185du86-0 ShAhH">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMkAAAAzCAMAAAAKEdxIAAAAP1BMVEVHcEwAUP8AUf8AVf8AUP8AUf8AZP8AUP8AUP8AUf8AUf8AUv8AU/8AWP8AUf8AUP8AUf8AUv8AUf8AUf8AUP9S6cPLAAAAFHRSTlMAu1Qa1/sG6PSBcDgoD67KoEWSXjcs98oAAAS/SURBVGje3VrZFqMgDC3ILqvy/9863VTAIGhnzmknzxS5Sbi5Cb3d/rqN/vZf2OAj+dKjsVOLlYjfh8TM0rr7wShH06y7fhJIjN+GZFCIxtS4HJq/sa+l34RkmEQsjEZqx+Nf8fhtSMwexxvNZH4KyUhi1Tj+ISSS1oHcc0z+ChLmY8Om30BiUGyaZz+AhLnYYfIjJMw0TzHoUQ/seMGoD/exsctCSdr4aWKlhcV2RcoS/ii1zuPKOdjs34RDiQ8QmlGi94c4UrUaN/UBibzYAFfWiWzVnAUcrE4l//Op1Bb5JpEikEzn2GvoPBK853ZbHhPzWBInVVlQgWuM9nHRohtJHE8igSmRzjn/w17bTjpyMEPCpdsOBqWJZKjtPbEWkDuBDC1Xz7cOj3QFpYVk4NV97Obw6hrHGq6m2WkGcQqJPYHkMNproU3uESWO7z+m0oxyJD0v1+cJePmWYP1IjmXDOzXClrnh1R2t+IliGVSuzKvLXuhB+ARJiCctDaiWT1vriVxst7WwcxhD1vsIk8NFi4/Y9GLrUGSfWD8d+AtoVpvcWSSyu8YnW0/r5bVlfq38itP6Rrb+DgNsM1Lqi7J0OiTR9SLZqpRIq5haw0KHLHcSTmUpv67XJB3djDupcDokkfciWZ1Nc95XeXjXE6CKjplhprp9GpJIO5EYWsvHNcFIzjhc6eMzUliQ5X47YUMfktWVvPS1pulWKiuGfj/MMTRjDgnLywtAou5D4usUYVMiNqXi4raITUnm1MlgLmrgA+lVRYLq6+cMJKQxMi0MiRVqcRoaJv5hTFZOYvVUePIwg1M8KXqwVif4ipq/cE842Ku8BFKuRiojhIS7A+xyyz6579DJPkQC9jAPU8n4nB5IzJu+FJLeyrjWCdPIrpfX7d7tNC0gWpK6DFWXkPSqFVRr/pMPp3uxrU+vdEN69hy+tJeSC6CiBgvv52Su0ind0RSH3bHLgKWjZVAMvQKE906JVuEnhmoVAyckWgrgpmSvIpvGIpeZi/oDJBwuzb7WbbvaiwFvzT19xj/+byVXpXSgimf9/sqxYBV4kewWKJRubmLKJ3yZHKkTVx9BHnJAi5Gp0+Rms00xLmmn5f0oQkOjhek91UMFPQypntVbQ8lId3LpwwkmeTLuoiMSRnFhmTTyAh/D72Vk23o7zyNS+j3VSydgKr0nc1Lwu8U9/E69upByhRVasinTp9xLJe9FY6OZp0bWGzIxvz1gbMpdiT/8whAzTYM2RaFYTW52TlMrXc6SNhPwDLMZ3rV6fFI4qGSw6gpiokjOYU5r5OPauvTFzXTlFw2V6TSvhA41Kyw7HICGchMKzaz0+YmquvVOyMemg3yHjH2tMfXxn4ByZGxDqT9q7aZ/rvXAJKG+vqYPa1AE3Ng3oUwH8wBcndjKhmB//Bj+8jahqEyXebjw9Lsbr+9EIa3BHtFeJwzwPxMysHmpFF2vDuu1Pxis8rH1BJ76DWXeCtm/LrIJ6HpNvTj+Y4ZRJDbfk9IGuxIWIZtvhM/XMy6i4EjuxyPYIyIod2iqzXlYkJbcf085QXKEFmnlHRf0vsBNuPkPFKY4pBqH2w8aw5bmD3rqJ3G8cuEe6EccxeNfUebrj/sH+wlgbEe79PUAAAAASUVORK5CYII="
										alt="pg-toss"
										class="ButtonPayMethod__Logo-sc-185du86-1 cligJe">
								</button>
							</div>
						</div>
					</div>
					<div class="ContractAgreement__Wrapper-jfdaqb-0 dqDumd">
						<label class="CheckboxItem__Wrapper-sc-17uidw-0 ezUDmu"><div
								class="CheckboxItem__Box-sc-17uidw-1 dbExlB"></div>
							<input type="checkbox"
							class="CheckboxItem__Input-sc-17uidw-2 nhmAl">
						<div>개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.</div></label>
					</div>
					<div class="Payment__PayButtonWrapper-ixk3fj-15 fCKdPV">
						<button width="290px" color="white" class="Button-bqxlp0-0 jwcODp">32,000원
							결제하기</button>
					</div>
				</div>

			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>