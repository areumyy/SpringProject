<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>memFripContent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/frip_content.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />

			<div class="Content_Main1">
				<div class="Content_Main2" style="opacity: 1; display: block;">
					<div class="Content_Main3">
						<div class="Content_Main4">
							<div class="Content_Head1" style="padding-bottom: 24px;">
								
								<!-- 호스트 정보 -->
								<!-- key값 받기 -->
								<c:set var="fripInfo" value="${fripInfo }" />			<!-- 프립 내용 -->
								<c:set var="hostCont" value="${hostCont }" />			<!-- 호스트 소개(소개내용) -->
								<c:set var="hostInfo" value="${hostInfo }" />			<!-- 호스트 상세정보 (이름/프로필) -->
								<c:set var="classCount" value="${classCount }" />		<!-- 호스트가 운영하는 클래스 개수 -->
								<c:set var="reviewCount" value="${reviewCount }" />		<!-- 호스트 후기 개수 -->
								<c:set var="likeCount" value="${likeCount }" />			<!-- 호스트 찜 개수 -->
							
							
								<div class="Content_Head1_Img1" style="margin: 0 50px;">
									<div class="image-slider Content_Head1_Img2 image-initialized" dir="ltr">
										<div class="image-list">
											<div>
												<img class= Content_Img3" alt="상품이미지" style="height:500px; width:500px;"
													src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_0,w_768/1622920435587-0_hwpjzs">
											</div>
										</div>
									</div>
								</div>
								
								<div class="Content_Head2">
									<section class="Content_Head3">
										<div class="Content_Title1" style="padding-bottom: 10px;">
											<div class="Content_Title2">
												<label class="Content_Title3">${fripInfo.getClass_title() }</label>
											</div>
										</div>
										<div class="Content_Price1">
											<div class="Content_Price2">
												${fripInfo.getOption_editprice() }<span class="Content_Price3">원</span>
											</div>
										</div>
									</section>
									<section class="Content_Intro2 Host_Profile1">
										<div class="Host_Profile2">
											<div class="Host_Profile3">
												<div class="Host_Profile4">
													<div class="Host_Profile_Img">
														<a href="#">
															<div class="Content_Img1">
																<img class="Content_Img2" width="56" height="56"
																	src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_56,q_auto,w_56/Host_15379_25981_1624984289">
																<div class="Content_Main2" style="opacity: 1; display: block;">
																	<div style="display: block;">
																		<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																			<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																				<img alt="호스트 프로필 이미지" width="56" height="56"
																					src="<%=request.getContextPath() %>/resources/image/mypage/profile/${hostInfo.getMem_profileimg() }">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="Host_Profile5">
														<div class="Host_Profile_Name1">
															<a href="#">
																<span class="Host_Profile_Name2">
																<span>${hostInfo.getMem_nick() }</span>
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='none' viewBox='0 0 16 16'%3E %3Cpath stroke='%23333' stroke-linecap='round' stroke-width='1.5' d='M6 3l5 5-5 5'/%3E %3C/svg%3E"
																		alt="arrow-right">
																</span>
															</a>
														</div>
														<span class="Host_Profile6">프립 ${classCount }<span>|</span>후기 ${reviewCount }<span>|</span>저장 ${likeCount }</span>
													</div>
												</div>
												<button class="Host_Pick" width="32px" height="32px">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='none' viewBox='0 0 32 32'%3E %3Cpath fill='%23F4F4F4' stroke='%23CCC' stroke-width='1.5' d='M15.043 19.962l-.028.02-.027.021-7.571 6.384V5.827c0-1.273 1.155-2.41 2.73-2.41h11.706c1.57 0 2.73 1.138 2.73 2.41v20.56l-7.571-6.384-.027-.022-.028-.02c-.291-.203-.633-.293-.957-.293-.323 0-.665.09-.957.294z'/%3E %3C/svg%3E"
														alt="찜하기">
												</button>
											</div>
										</div>
									</section>
								</div>
							</div>
							<div class="Content_Review1">
								<div class="Content_Grade1">
									<div class="Content_Grade2">
										<div class="Content_Grade3">
											<img
												src="data:image/svg+xml,%3Csvg width='16' height='14' viewBox='0 0 16 14' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M12.293 8.6189L15.7442 6.00968C16.2325 5.63914 15.9799 4.9135 15.3402 4.88263L10.8957 4.6356C10.6263 4.62016 10.3906 4.46577 10.2896 4.23418L8.65658 0.405277C8.42088 -0.135092 7.59595 -0.135092 7.36026 0.405277L5.72724 4.21874C5.62623 4.45033 5.39053 4.60472 5.12117 4.62016L0.659819 4.86719C0.0200779 4.89806 -0.232451 5.6237 0.255772 5.99424L3.707 8.58802C3.90903 8.74241 4.01004 9.00487 3.9427 9.23646L2.81473 13.2043C2.66322 13.7601 3.31979 14.2079 3.85852 13.8991L7.61279 11.6913C7.84848 11.5523 8.13468 11.5523 8.35354 11.6913L12.1246 13.8991C12.6634 14.2079 13.3199 13.7601 13.1684 13.2043L12.0405 9.2519C11.99 9.02031 12.0741 8.77329 12.293 8.6189Z' fill='%23FF3F33'/%3E %3C/svg%3E"
												alt="평점 icon">
											<img
												src="data:image/svg+xml,%3Csvg width='16' height='14' viewBox='0 0 16 14' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M12.293 8.6189L15.7442 6.00968C16.2325 5.63914 15.9799 4.9135 15.3402 4.88263L10.8957 4.6356C10.6263 4.62016 10.3906 4.46577 10.2896 4.23418L8.65658 0.405277C8.42088 -0.135092 7.59595 -0.135092 7.36026 0.405277L5.72724 4.21874C5.62623 4.45033 5.39053 4.60472 5.12117 4.62016L0.659819 4.86719C0.0200779 4.89806 -0.232451 5.6237 0.255772 5.99424L3.707 8.58802C3.90903 8.74241 4.01004 9.00487 3.9427 9.23646L2.81473 13.2043C2.66322 13.7601 3.31979 14.2079 3.85852 13.8991L7.61279 11.6913C7.84848 11.5523 8.13468 11.5523 8.35354 11.6913L12.1246 13.8991C12.6634 14.2079 13.3199 13.7601 13.1684 13.2043L12.0405 9.2519C11.99 9.02031 12.0741 8.77329 12.293 8.6189Z' fill='%23FF3F33'/%3E %3C/svg%3E"
												alt="평점 icon">
											<img
												src="data:image/svg+xml,%3Csvg width='16' height='14' viewBox='0 0 16 14' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M12.293 8.6189L15.7442 6.00968C16.2325 5.63914 15.9799 4.9135 15.3402 4.88263L10.8957 4.6356C10.6263 4.62016 10.3906 4.46577 10.2896 4.23418L8.65658 0.405277C8.42088 -0.135092 7.59595 -0.135092 7.36026 0.405277L5.72724 4.21874C5.62623 4.45033 5.39053 4.60472 5.12117 4.62016L0.659819 4.86719C0.0200779 4.89806 -0.232451 5.6237 0.255772 5.99424L3.707 8.58802C3.90903 8.74241 4.01004 9.00487 3.9427 9.23646L2.81473 13.2043C2.66322 13.7601 3.31979 14.2079 3.85852 13.8991L7.61279 11.6913C7.84848 11.5523 8.13468 11.5523 8.35354 11.6913L12.1246 13.8991C12.6634 14.2079 13.3199 13.7601 13.1684 13.2043L12.0405 9.2519C11.99 9.02031 12.0741 8.77329 12.293 8.6189Z' fill='%23FF3F33'/%3E %3C/svg%3E"
												alt="평점 icon">
											<img
												src="data:image/svg+xml,%3Csvg width='16' height='14' viewBox='0 0 16 14' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M12.293 8.6189L15.7442 6.00968C16.2325 5.63914 15.9799 4.9135 15.3402 4.88263L10.8957 4.6356C10.6263 4.62016 10.3906 4.46577 10.2896 4.23418L8.65658 0.405277C8.42088 -0.135092 7.59595 -0.135092 7.36026 0.405277L5.72724 4.21874C5.62623 4.45033 5.39053 4.60472 5.12117 4.62016L0.659819 4.86719C0.0200779 4.89806 -0.232451 5.6237 0.255772 5.99424L3.707 8.58802C3.90903 8.74241 4.01004 9.00487 3.9427 9.23646L2.81473 13.2043C2.66322 13.7601 3.31979 14.2079 3.85852 13.8991L7.61279 11.6913C7.84848 11.5523 8.13468 11.5523 8.35354 11.6913L12.1246 13.8991C12.6634 14.2079 13.3199 13.7601 13.1684 13.2043L12.0405 9.2519C11.99 9.02031 12.0741 8.77329 12.293 8.6189Z' fill='%23FF3F33'/%3E %3C/svg%3E"
												alt="평점 icon">
											<img
												src="data:image/svg+xml,%3Csvg width='16' height='14' viewBox='0 0 16 14' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M12.293 8.6189L15.7442 6.00968C16.2325 5.63914 15.9799 4.9135 15.3402 4.88263L10.8957 4.6356C10.6263 4.62016 10.3906 4.46577 10.2896 4.23418L8.65658 0.405277C8.42088 -0.135092 7.59595 -0.135092 7.36026 0.405277L5.72724 4.21874C5.62623 4.45033 5.39053 4.60472 5.12117 4.62016L0.659819 4.86719C0.0200779 4.89806 -0.232451 5.6237 0.255772 5.99424L3.707 8.58802C3.90903 8.74241 4.01004 9.00487 3.9427 9.23646L2.81473 13.2043C2.66322 13.7601 3.31979 14.2079 3.85852 13.8991L7.61279 11.6913C7.84848 11.5523 8.13468 11.5523 8.35354 11.6913L12.1246 13.8991C12.6634 14.2079 13.3199 13.7601 13.1684 13.2043L12.0405 9.2519C11.99 9.02031 12.0741 8.77329 12.293 8.6189Z' fill='%23DDDDDD'/%3E %3Cmask id='mask0' mask-type='alpha' maskUnits='userSpaceOnUse' x='0' y='0' width='16' height='14'%3E %3Cpath d='M12.293 8.6189L15.7442 6.00968C16.2325 5.63914 15.9799 4.9135 15.3402 4.88263L10.8957 4.6356C10.6263 4.62016 10.3906 4.46577 10.2896 4.23418L8.65658 0.405277C8.42088 -0.135092 7.59595 -0.135092 7.36026 0.405277L5.72724 4.21874C5.62623 4.45033 5.39053 4.60472 5.12117 4.62016L0.659819 4.86719C0.0200779 4.89806 -0.232451 5.6237 0.255772 5.99424L3.707 8.58802C3.90903 8.74241 4.01004 9.00487 3.9427 9.23646L2.81473 13.2043C2.66322 13.7601 3.31979 14.2079 3.85852 13.8991L7.61279 11.6913C7.84848 11.5523 8.13468 11.5523 8.35354 11.6913L12.1246 13.8991C12.6634 14.2079 13.3199 13.7601 13.1684 13.2043L12.0405 9.2519C11.99 9.02031 12.0741 8.77329 12.293 8.6189Z' fill='%23FF3F33'/%3E %3C/mask%3E %3Cg mask='url(%23mask0)'%3E %3Cpath d='M0 0H7.9999V14H0V0Z' fill='%23FF3F33'/%3E %3C/g%3E %3C/svg%3E"
												alt="평점 icon">
										</div>
										<p class="Content_Grade4">4.6</p>
										<p class="Content_Grade5">•</p>
										<p class="Content_Grade6">12개 후기</p>
									</div>
									<p class="Content_Grade7">경험한 대원의 66%가 5점을 줬어요!</p>
								</div>
								<div class="Content_Review2">
									<div class="Content_Review3">
										<div class="image-slider Content_Review4 image-initialized" dir="ltr">
											<img data-role="none"
												class="Content_Review5 image-arrow image-prev image-disabled"
												src="data:image/png;base64,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"
												style="display: block;">
											
											<div class="image-list">
												<div class="image-track" style="width: 2196px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
													<div data-index="0" class="image-slide image-active image-current"
														tabindex="-1" aria-hidden="false" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/se0bzl2bngcis61p2zy1">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/se0bzl2bngcis61p2zy1">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="https://k.kakaocdn.net/dn/djXXkD/btq4YOVBhUo/hOaivCR1NRNgkXIgMK0Kv0/img_110x110.jpg">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img alt="user-1110936-profile" class="Content_Review_Profile3" width="40" height="40"
																									src="https://k.kakaocdn.net/dn/djXXkD/btq4YOVBhUo/hOaivCR1NRNgkXIgMK0Kv0/img_110x110.jpg">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">나루짱</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (여성)</p>
																	<span class="Content_Review_Comment">
																		확실히 같이 요리해서 먹는 즐거움이 있네요 혼자 집에있을때는 귀찮아서 
																		요리잘안하게되더라구요 ㅠ 두번째 참여했는데 재밌었습니다 
																	</span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">0
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="1" class="image-slide image-active" tabindex="-1"
														aria-hidden="false" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/h5degpmwsrj3nahgvxcz">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail"	class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/h5degpmwsrj3nahgvxcz">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/kds183mq28ossdlge5qe">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img alt="user-149241-profile" class="Content_Review_Profile3" width="40" height="40"
																									src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/kds183mq28ossdlge5qe">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">s.rain</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (여성)</p>
																	<span class="Content_Review_Comment">평소에
																		와인을 즐기는 편인데 다같이 와인안주 만들어서 먹으니 소꿉장난하는 것 같으면서 너무 재밌었어요ㅋㅋ
																		그릇이며 소품 하나하나 너무 귀엽고, 위치도 엄청 좋아요~ 색다른 경험 해보고 싶으신 분들에게
																		추천해요!!</span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">2
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="2" class="image-slide image-active"
														tabindex="-1" aria-hidden="false" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/review-android-137172-2021_07_03_22:37:13.320">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/review-android-137172-2021_07_03_22:37:13.320">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="http://k.kakaocdn.net/dn/x0cJw/btqtWg0R0G8/ByeUzYhUw4JlFobz8OWV8K/profile_110x110c.jpg">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img alt="user-646233-profile" class="Content_Review_Profile3" width="40" height="40"
																									src="http://k.kakaocdn.net/dn/x0cJw/btqtWg0R0G8/ByeUzYhUw4JlFobz8OWV8K/profile_110x110c.jpg">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">그레:)</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (여성)</p>
																	<span class="Content_Review_Comment">
																		기대와 설렘이 있던 제 첫 모임(?) 참가였어요:) 음식을해먹는재미도 새로운사람들을 만나는 설렘도 역이랑
																		가까운 위치도 좋았습니다! 호스트분께서 어색한 시작을 잘풀어주셨고 일단 여자들이 좋아할만한
																		아기자기함과 인테리어를 갖췄어요ㅋㅋ 로즈룸에걸맞는 조명색선택이가능한 등과 왕큰거울과
																		핑크핑크함까지ㅋㅋㅋ완전취향저격이였습니다ㅋㅋ 잘놀다가요옹 다음에또올게요주말에! </span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">3
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="3" class="image-slide" tabindex="-1"
														aria-hidden="true" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/gc3eqxruthci6em6y1w9">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/gc3eqxruthci6em6y1w9">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/c85tbetea1pd6kg2ehrn">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img alt="user-724690-profile" class="Content_Review_Profile3" width="40" height="40"
																									src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/c85tbetea1pd6kg2ehrn">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">JennyLee</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (여성)</p>
																	<span class="Content_Review_Comment">
																		여기 너무 좋아요...... 파스타는 제가 소스 비율을 잘못 맞춰서 밍밍했지만 그래도 만들어 먹는
																		재미가 쏠쏠했어요!!!! 그 날 멤버들이랑 바로 친해졌고 헤어지기 아쉬워서 2차까지 다녀왔어요~
																		또 신청하고 싶어요 ^_^*</span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">3
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="4" class="image-slide" tabindex="-1" aria-hidden="true" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/x29hxommegp4axqikcdk">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/x29hxommegp4axqikcdk">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="http://mud-kage.kakao.co.kr/14/dn/btqcZFDyyYn/aSGgk9mo7myqiA1MuoljB1/o.jpg">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img
																									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFkAAABZCAMAAABi1XidAAAAUVBMVEVHcEzz9Pby9Pb2+/vy8/f09/jq6/L////y9Pfz9ffy9ffz9Pfy8/fz9Pby9Pfy9Pby9Pfz9Pfy8/art8To6++wusi5ws7g5Orw8fTEzNbS1+C1FdKWAAAAEnRSTlMA5bIa8jsuC1GOZLnZzJ7Kt9TwOxZLAAADVklEQVRYw8VZ25arMAhNrdZqb1MgQPL/H3oe6kzb0ZBUJ+vwahfFLWxg41ze9t04NJfzroV2d740w9jt3Xbrj8Md5nYfjv02t1+Qtq/Vzg/XFmxrr4cVfrsGSqzpPo33BKV2+iTufoBPbCjG+7iDz2x3rBFwedj7G6yxW7Z4uhbWWZtJkqPCWlMT7BG22FjLseH6CFstAUinmz3r4mfct7Dd2oXk62/wF3abl8wAf2PD33+9xFfssyREEhk5CmXpqf8EC43B48N8iPoBHgf7t5ER0XMIgT0icrR//toKrA6iGhB9kEekKsEjBjPs00uNmAAzYnhFlwIim3A/66WxHXv59RbibddNCco6dzy51gKkr1ZSLDgGAPFofcbrlMsGYRAmPEREA4+2z5ZfSL41Y8gWopFy5FESjwQ9ZRKvt0okGbIqm0j3WTDCqmcPOAYz5ST5UMzEG5xzdxNmMjxbQN+d24OZc7TuIcDe5AyywjJfCKCzZgzd4nk0OX+L58HiuU0xN+5SKeaLO1eK+ex2lWLeubZSzK2DSpUCVsyg3uQNr2bMO7sJxhUMO+F8Nkcj5ORDm5/hbOYzSBpLQgMpALiYswZoutsFGwxoMrNiTOUd2WMBwJDZp1JBay5kGO2ZDkCWB46YQRmgM3vKA8+FIUm82V4fPcXqgxMes+mQOIcF3AtWH5oNnsRmc/3p3dndRzzyKyDCy1PkbN7oocC1fy4n0Rc4ht45576yP2NEZFEAUGFEo+R/tLyyVVA9MiJyiIERPdsk9zKL9rmFmxBJwrS1BckR83N+tmb+F76kGEKIlOHWt5k/tw3OPMVsNh9Kdqs5K2mWjZqyfXBh2YmZvOuKdtiFBU3VrpVTyd6tcXGpJH6tHWvvXiIPVZXIy4uwEiNyFFXNaSe/9A2VwOw9YjI0jR4RvWf+3vUT+sZ7IUaetAyOlFQQKPKkefDbvx/TOhIxog9RRMhMW1USkRj8m5YwpLUvYvSBAMrUO/2lSixoX996HZWw70JmUlKvmzRGDfl+sdh3giY1xsdXlGxTTrV4Seuizo3WUGTDHZDVlIlpXciPCXA0xfgsQaapNnOgOKwCAwDC4b/dJireUyregGrerSre2mreB2veNGveYWvejjfdu/8BI2K8ok7u95kAAAAASUVORK5CYII="
																									alt="user-84829-profile" class="Content_Review_Profile3" width="40" height="40">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">김신디</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (여성)</p>
																	<span class="Content_Review_Comment">
																		위치가 역근처라 접근성이 좋았어요! 아기자기한 분위기의 파티룸인데 음식도 직접 해먹을수도 있고, 음식
																		준비도 미리해주셔서 편했어요 나중에 친구들이랑 여기서 파티하고 놀고싶네요 :) 재밌게 놀다가용!
																		p.s 포토존은 이 왕거울인거같아요!!!</span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">4
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="5" class="image-slide" tabindex="-1" aria-hidden="true" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/ffyy4vbyxgpy71ujniwu">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/ffyy4vbyxgpy71ujniwu">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img
																									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFkAAABZCAMAAABi1XidAAAAUVBMVEVHcEzz9Pby9Pb2+/vy8/f09/jq6/L////y9Pfz9ffy9ffz9Pfy8/fz9Pby9Pfy9Pby9Pfz9Pfy8/art8To6++wusi5ws7g5Orw8fTEzNbS1+C1FdKWAAAAEnRSTlMA5bIa8jsuC1GOZLnZzJ7Kt9TwOxZLAAADVklEQVRYw8VZ25arMAhNrdZqb1MgQPL/H3oe6kzb0ZBUJ+vwahfFLWxg41ze9t04NJfzroV2d740w9jt3Xbrj8Md5nYfjv02t1+Qtq/Vzg/XFmxrr4cVfrsGSqzpPo33BKV2+iTufoBPbCjG+7iDz2x3rBFwedj7G6yxW7Z4uhbWWZtJkqPCWlMT7BG22FjLseH6CFstAUinmz3r4mfct7Dd2oXk62/wF3abl8wAf2PD33+9xFfssyREEhk5CmXpqf8EC43B48N8iPoBHgf7t5ER0XMIgT0icrR//toKrA6iGhB9kEekKsEjBjPs00uNmAAzYnhFlwIim3A/66WxHXv59RbibddNCco6dzy51gKkr1ZSLDgGAPFofcbrlMsGYRAmPEREA4+2z5ZfSL41Y8gWopFy5FESjwQ9ZRKvt0okGbIqm0j3WTDCqmcPOAYz5ST5UMzEG5xzdxNmMjxbQN+d24OZc7TuIcDe5AyywjJfCKCzZgzd4nk0OX+L58HiuU0xN+5SKeaLO1eK+ex2lWLeubZSzK2DSpUCVsyg3uQNr2bMO7sJxhUMO+F8Nkcj5ORDm5/hbOYzSBpLQgMpALiYswZoutsFGwxoMrNiTOUd2WMBwJDZp1JBay5kGO2ZDkCWB46YQRmgM3vKA8+FIUm82V4fPcXqgxMes+mQOIcF3AtWH5oNnsRmc/3p3dndRzzyKyDCy1PkbN7oocC1fy4n0Rc4ht45576yP2NEZFEAUGFEo+R/tLyyVVA9MiJyiIERPdsk9zKL9rmFmxBJwrS1BckR83N+tmb+F76kGEKIlOHWt5k/tw3OPMVsNh9Kdqs5K2mWjZqyfXBh2YmZvOuKdtiFBU3VrpVTyd6tcXGpJH6tHWvvXiIPVZXIy4uwEiNyFFXNaSe/9A2VwOw9YjI0jR4RvWf+3vUT+sZ7IUaetAyOlFQQKPKkefDbvx/TOhIxog9RRMhMW1USkRj8m5YwpLUvYvSBAMrUO/2lSixoX996HZWw70JmUlKvmzRGDfl+sdh3giY1xsdXlGxTTrV4Seuizo3WUGTDHZDVlIlpXciPCXA0xfgsQaapNnOgOKwCAwDC4b/dJireUyregGrerSre2mreB2veNGveYWvejjfdu/8BI2K8ok7u95kAAAAASUVORK5CYII="
																									alt="user-1128429-profile" class="Content_Review_Profile3" width="40" height="40">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">칼라치</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (남성)</p>
																	<span class="Content_Review_Comment">
																		역에서 가까워서 너무좋았고 분위기도 좋아서 즐거웠습니다 ㅎㅎ다음에 시간되면 또 찾아올게요 !!!!</span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">4
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="6" class="image-slide" tabindex="-1" aria-hidden="true" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/kkvrothb5ulsvev6nbef">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/kkvrothb5ulsvev6nbef">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/th85x4f0ie9apc2bxc8i">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img alt="user-734076-profile" class="Content_Review_Profile3" width="40" height="40"
																									src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/th85x4f0ie9apc2bxc8i">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">Julie12</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (여성)</p>
																	<span class="Content_Review_Comment">
																		위치도 좋고, 분위기도 좋았어요. 즐거운 시간보냈어요. </span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">4
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="7" class="image-slide" tabindex="-1" aria-hidden="true" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/qcqxwvznahifmubof1g9">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/qcqxwvznahifmubof1g9">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="https://k.kakaocdn.net/dn/djXXkD/btq4YOVBhUo/hOaivCR1NRNgkXIgMK0Kv0/img_110x110.jpg">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img alt="user-1110936-profile" class="Content_Review_Profile3" width="40" height="40"
																									src="https://k.kakaocdn.net/dn/djXXkD/btq4YOVBhUo/hOaivCR1NRNgkXIgMK0Kv0/img_110x110.jpg">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">나루짱</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (여성)</p>
																	<span class="Content_Review_Comment">
																		ㅋㅋ 이번기회에 제가 요리에 소질없다는걸또 느꼇네요 ㅋㅋㅋㅋ....ㅋㅋ 그래도 다들 같이해서 결과물을
																		좋았습니다^^잘 놀다가요</span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">0
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div data-index="8" class="image-slide" tabindex="-1" aria-hidden="true" style="outline: none; width: 244px;">
														<div>
															<div class="Content_Review6">
																<div class="Content_Review_Img1">
																	<a href="#">
																		<div class="Content_Img1">
																			<img class="Content_Img2" width="220"
																				src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/%EC%82%AC%EC%A7%84_rquxtq">
																			<div class="Content_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img alt="review-thumbnail" class="Content_Review_Img2" width="220"
																								src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_3,w_220/%EC%82%AC%EC%A7%84_rquxtq">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</a>
																</div>
																<div class="Content_Review7">
																	<div class="Content_Review_Profile1">
																		<div class="Content_Review_Profile2">
																			<div class="Content_Img1">
																				<img class="Content_Img2" width="40" height="40"
																					src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/Customer_1128503_74817_1624884173">
																				<div class="Content_Main2" style="opacity: 1; display: block;">
																					<div style="display: block;">
																						<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																							<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																								<img alt="user-1128503-profile" class="Content_Review_Profile3" width="40" height="40"
																									src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,h_40,q_auto,r_20,w_40/Customer_1128503_74817_1624884173">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="Content_Review_Profile4">
																			<h2 class="Content_Review_Profile5">tlsdl44</h2>
																		</div>
																	</div>
																	<p class="Content_Review8">참가비 (남성)</p>
																	<span class="Content_Review_Comment">크림파스타
																		인생 첫 도전! 완벽한 파스타는 아니었지만..ㅎㅎ 내가 만들어서 그런지 더 맛있었고 뿌듯한
																		시간이었습니다</span>
																	<button type="button" class="Good_Review_Btn">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='14' fill='none' viewBox='0 0 15 14'%3E %3Cpath stroke='%23FF3F33' stroke-miterlimit='10' stroke-width='1.5' d='M3.14 5.3l.645.382h0l.002-.003.004-.007.016-.028.062-.105.225-.385c.189-.323.447-.768.723-1.254.528-.929 1.145-2.042 1.461-2.725.015-.01.037-.025.07-.043.111-.063.273-.13.47-.192.406-.128.812-.19.967-.19.268 0 .488.217.488.492V6h5.332c.355 0 .645.287.645.65 0 .02-.001.04-.005.094l-.696 5.934s0 0 0 0c-.04.325-.314.572-.642.572h0H.75v-7.2h2.817l.218-.368L3.14 5.3z'/%3E %3Cpath fill='%23FF3F33' d='M3 6h1.5v7H3V6z'/%3E %3C/svg%3E"
																			alt="thumbs-icon">2
																	</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												
											</div>
											<img data-role="none" class="Review_Right_Btn image-arrow image-next"
												src="data:image/png;base64,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"
												style="display: block;">
										</div>
									</div>
									<div class="Content_Review_All1">
										<a class="Content_Review_All2" href="#">12개 후기 더보기
											<img
												src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='none' viewBox='0 0 12 12'%3E %3Cpath fill='%230075EF' fill-rule='evenodd' d='M3.97 1.72c.293-.293.767-.293 1.06 0L9.31 6l-4.28 4.28c-.293.293-.767.293-1.06 0-.293-.293-.293-.767 0-1.06L7.19 6 3.97 2.78c-.293-.293-.293-.767 0-1.06z' clip-rule='evenodd'/%3E %3C/svg%3E"
												alt="arrow-blue">
										</a>
									</div>
								</div>
							</div>
							<div class="Content_Intro1 accordion accordion-flush" id="accordionFlushExample">
								<section class="Content_Intro2">
									<header class="Content_Intro3">
										<h4 class="Content_Intro4">프립 소개</h4>
									</header>
									<div>
										<div class="Content_Intro5">
											<p style="line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">안녕하세요~&nbsp;</p>
											<p style="text-align: center; line-height: 2;">로즈룸입니다🌹❤</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<img style="height:600px; width:800px;"
													src="https://res.cloudinary.com/frientrip/image/upload/c_limit,dpr_3.0,f_auto,q_auto:best,w_500/ca5ibcannwk3gjozuh7j.jpg">
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<img style="height:600px; width:800px;"
													src="https://res.cloudinary.com/frientrip/image/upload/c_limit,dpr_3.0,f_auto,q_auto:best,w_500/dzf60k5tpkegj1nm3m0d.jpg">
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<strong>때로는 정해진 인연보다&nbsp;</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<strong>우연한 인연이 더 소중하다고 생각합니다.</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												비슷한 것 같기도, 다른 것 같기도 한&nbsp;</p>
											<p style="text-align: center; line-height: 2;">
												우리들의 사는 이야기&nbsp;</p>
											<p style="text-align: center; line-height: 2;">
												소중한 사람들과 함께 나눠봐요😚</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<img style="height:600px; width:800px;"
													src="https://res.cloudinary.com/frientrip/image/upload/c_limit,dpr_3.0,f_auto,q_auto:best,w_500/bio7othpxoicwqqyyasb.jpg">
											</p>
											<p style="line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<strong>와인 메뉴 같이 만들어 먹으면서</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<strong>와인도 한 잔씩-!&nbsp;🍷</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<img style="height:600px; width:800px;"
													src="https://res.cloudinary.com/frientrip/image/upload/c_limit,dpr_3.0,f_auto,q_auto:best,w_500/kh10t2exsnkvcx3or18c.jpg">
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">.</p>
											<p style="text-align: center; line-height: 2;">.</p>
											<p style="text-align: center; line-height: 2;">.</p>
											<p style="text-align: center; line-height: 2;">.</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<strong>"저.. 요리를 잘 못하는데 괜찮을까요?"</strong>
											</p>
											<p style="text-align: center; line-height: 2;">.</p>
											<p style="text-align: center; line-height: 2;">..</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<strong>네!!!! 걱정마세요!!!!!</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<strong>기가막힌 레시피를 쉽게 알려드립니다🍕</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												호스트가 직접 참여하진 않는 프립이지만</p>
											<p style="text-align: center; line-height: 2;">
												도움이 필요하시면 언제든 불러주세요!</p>
											<p style="text-align: center; line-height: 2;">
												바로 달려갑니다-!</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												메뉴에 필요한 모든 재료와 와인 2병이 제공됩니다 :)</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												메뉴는</p>
											<p style="text-align: center;">
												<strong>소고기 크림 파스타 &amp; 리조또</strong>
											</p>
											<p style="text-align: center;">
												<strong>스테이크 &amp; 감바스</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												대원님께서 원하시는 메뉴로 날짜를 선택해주세요!</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												와인은 White Wine과 Red Wine 각 1병씩 !</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center;">
												<strong>White wine : 모스카토</strong>
											</p>
											<p style="text-align: center;">
												<strong>Red wine : 카베르네 쇼비뇽 혹은 멜롯</strong>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												현재 와인모임은 두 타임으로 진행됩니다!!</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<ol>
												<li style="text-align: center; line-height: 2; font-weight: bold;">
													<strong>주말 오후 3시 30분 - 6시 30분 (3시간)</strong>
												</li>
												<li style="text-align: center; line-height: 2; font-weight: bold;">
													<strong>주말 저녁 7시 - 10시 (3시간)</strong>
												</li>
											</ol>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												최소 인원 : 2명 / 최대 인원 : 4명 (남자 2명, 여자 2명)</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												마지막 20분 동안에는</p>
											<p style="text-align: center; line-height: 2;">
												다 같이 뒷 정리를 해주세요💛</p>
											<p style="text-align: center; line-height: 2;">
												설거지, 음식물쓰레기, 분리수거 등</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												이에 대한 더 자세한 내용은</p>
											<p style="text-align: center; line-height: 2;">
												추후 알려드리도록 하겠습니다.</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												다양한 조리기구도 있으니</p>
											<p style="text-align: center; line-height: 2;">
												취향대로 같이 요리를 해보세요.</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												감성 공간에서</p>
											<p style="text-align: center; line-height: 2;">
												내가 만든 음식에 와인까지 곁들이면</p>
											<p style="text-align: center; line-height: 2;">
												최고의 분위기를 느끼실 수 있습니다 🌹</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												로즈룸에서</p>
											<p style="text-align: center; line-height: 2;">
												행복한 추억을 만들어보세요😊</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p style="text-align: center; line-height: 2;">
												<br>
											</p>
											<p>
												<br>
											</p>
											<p>
												<br>
											</p>
											<p style="text-align: center;">
												<img style="height:800px; width:800px;"
													src="https://res.cloudinary.com/frientrip/image/upload/c_limit,dpr_3.0,f_auto,q_auto:best,w_500/bottom-corona-notice_u2r6sx.jpg">
											</p>
										</div>
									</div>
								</section>
								<section class="Content_Intro2">
									<header class="Content_Intro3">
										<h4 class="Content_Intro4">포함 사항</h4>
									</header>
									<div>
										<div class="Content_Intro5">
											<p>장소 이용료</p>
											<p>재료비</p>
											<p>와인 2병</p>
											<p>다양한 조리 기구</p>
											<p>무선 와이파이</p>
										</div>
									</div>
								</section>
								<section class="Content_Intro2">
									<header class="Content_Intro3">
										<h4 class="Content_Intro4">불포함 사항</h4>
									</header>
									<div>
										<div class="Content_Intro5">
											<p>주차</p>
											<p>뒤풀이 비용</p>
										</div>
									</div>
								</section>
								<section class="Content_Intro2">
									<header class="Content_Intro3">
										<h4 class="Content_Intro4">세부 일정</h4>
									</header>
									<div>
										<table class="Content_Plan1">
											<tbody>
												<tr class="Content_Plan2">
													<td class="Content_Plan3">30분</td>
													<td>간단한 자기소개</td>
												</tr>
												<tr class="Content_Plan2">
													<td class="Content_Plan3">120분</td>
													<td>와인 메뉴 만들며 와인 즐기기</td>
												</tr>
												<tr class="Content_Plan2">
													<td class="Content_Plan3">30분</td>
													<td>마무리 및 뒤풀이</td>
												</tr>
											</tbody>
										</table>
									</div>
								</section>
								<section class="Content_Intro2">
									<header class="Content_Intro3">
										<h4 class="Content_Intro4">준비물</h4>
									</header>
									<p>기본매너와 건강한 마인드셋</p>
								</section>
								<section class="Content_Intro2">
									<header class="Content_Intro3">
										<h4 class="Content_Intro4">유의사항</h4>
									</header>
									<div class="Content_Warning">
										프립에서 구매하시지 않는 경우, 환불 거부, 서비스 불이행 등의 문제가 생길 수 있습니다.
									</div>
									<div>
										<div class="Content_Intro5">
											<p>
												<strong>·&nbsp;</strong>
												최소 인원 미달로 인한 취소 시 프립 마감 시간 24시간 전에 안내를 드리며 참가비는 전액 환불해 드립니다.
											</p>
											<p>
												<strong>·&nbsp;</strong>
												1인당 최대 구매 가능 수량 : 2장
											</p>
										</div>
									</div>
								</section>
								<section class="Content_Intro2">
									<header class="Content_Intro3">
										<h4 class="Content_Intro4">진행 장소</h4>
									</header>
									<p>서울 성동구 마조로1길 42 3층 로즈룸</p>
								</section>
								
								<div class="accordion" id="accordionExample">
									<div class="Content_Qna1">
										<div class="Content_Qna2" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true">
											자주 묻는 질문
										</div>
										<div class="accordion-collapse collapse" id="collapse1" data-bs-parent="#accordionExample" style="background-color: rgb(239, 247, 255);">
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>신청한 프립은 어디서 확인하나요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>[마이]의 [신청 내역] 탭에서 신청하신 프립을 확인하실 수 있습니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>환불 신청했는데 언제 환불되나요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>환불 신청한 날로부터 영업일 기준 최대 5일 이내에 환불될 예정입니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>두 명 신청하고 싶은데 어떻게 하나요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>프립에 따라 한 번에 여러명 신청하는 것이 가능하며, 1회 최대 신청 가능 인원 수는
														프립별로 다를 수 있으니 확인 부탁드립니다. 추가 신청을 원하시는 경우 추가 결제가 가능하니 참고
														부탁드립니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>인원 증원은 안되나요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>정해진 인원으로 진행되는 프립이기에 인원 증원이 어려운 점 양해 부탁드립니다. '대기
														알림' 또는 '대기 신청'을 하시면 공석이 생겼을 때, 알림 설정에 동의하신 분들에 한해 Push 알림과
														이메일로 안내해 드리고 있습니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>대기신청했을 경우 따로 연락을 주시나요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>공석이 생겼을 때, 알림 설정에 동의하신 분들에 한해 Push 알림과 이메일로 안내해
														드리고 있습니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>혼자 참석하기 민망하고 어색해요.</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>괜찮아요:) 참석하시는 97% 이상의 분들이 혼자 신청하셔서 오십니다! 어색함을 깨기
														위한 다양한 프로그램과 유머감각을 갖춘 호스트들이 있기 때문에 걱정 안 하셔도 됩니다!</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>요리를 못하는데 괜찮을까요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>전혀 문제가 되지 않습니다! 호스트들이 기가막힌 레시피를 미리 알려드립니다 :)</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>음식 재료와 와인은 어떻게 제공되는 건가요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>구매하신 프립에 모두 포함되어 있는 사항입니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>남녀 성비는 어떻게 되나요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>남녀 성비는 1:1로 맞춰서 진행됩니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>최대 참석 가능 인원수는 몇 명인가요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>5인이상 집합금지 정부 지침에 따라 4인까지만 신청받습니다.</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>우천 시 프립 진행은 어떻게 되나요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>프라이빗한 장소가 제공되기 때문에 우천 시에도 문제없이 좋은 시간을 보내실 수 있습니다 :)</div>
												</div>
											</div>
											<div class="accordion-body">
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M3 9.112C3 5.329 5.831 3 8.992 3 12.169 3 15 5.33 15 9.112c0 1.652-.543 3.023-1.432 4.047l1.4 1.553L13.468 16l-1.432-1.586a6.2 6.2 0 0 1-3.045.793C5.832 15.207 3 12.878 3 9.112zm2.354-.017c0 2.643 1.844 3.899 3.638 3.899.51 0 1.037-.1 1.498-.298l-1.827-2.015 1.514-1.305 1.827 2.048c.395-.594.642-1.37.642-2.329 0-2.643-1.844-3.898-3.654-3.898-1.794 0-3.638 1.255-3.638 3.898z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>주차 가능한가요?</div>
												</div>
												<div class="Content_Main13">
													<img
														src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M0 0h18v18H0z'/%3E %3Cpath fill='%23000' d='M12.436 15l-1.009-2.742H6.504L5.496 15H3L7.65 3h2.735L15 15h-2.564zm-3.47-9.41L7.29 10.126h3.35L8.966 5.59z'/%3E %3C/g%3E %3C/svg%3E"
														class="Content_Main14">
													<div>왕십리역 6번출구 인근 복잡한 관계로 주차가 불가능합니다. 근처 공영주차장 혹은
														왕십리역 비트플렉스 주차장(유료) 이용 부탁드립니다.</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								
								
								<a class="Content_Main15" href="#">문의하기
									<img
										style="padding-right: 20px;"
										src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='25' height='25' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M18 0H0v18h18z'/%3E %3Cpath stroke='%23000' stroke-width='1.5' d='M7 5l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E"
										alt="/products/151306/qnas">
								</a>
								
								<div class="accordion" id="accordionExample">
									<div class="Content_Qna1">
										<div class="Content_Qna2" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="true">
											환불 정책
										</div>
										<div class="accordion-collapse collapse" id="collapse2" data-bs-parent="#accordionExample" style="background-color: rgb(239, 247, 255);">
											<div class="accordion-body">
												<div class="Content_Intro5">
													<p>[국내 환불규정]</p>
													<p>- 신청 마감 4일 이전 취소시 : 전액 환불</p>
													<p>- 신청 마감 3일 이전 취소시 : 결제 금액의 20% 배상 후 환불</p>
													<p>- 신청 마감 2일 이전 취소시 : 결제 금액의 40% 배상 후 환불</p>
													<p>- 신청 마감 1일 이전 취소시 : 결제 금액의 50% 배상 후 환불</p>
													<p>- 신청 마감 이후 취소시, 또는 당일 불참 : 환불 불가</p>
													<br>
													<p>※ 신청 마감일은 무엇인가요?</p>
													<p>호스트님들이 장소 대관, 강습, 재료 구비 등 프립 진행을 준비하기 위해, 프립 참여일보다
														일찍 신청을 마감합니다.</p>
													<p>환불은 참여일이 아닌 신청 마감일 기준으로 이루어집니다. 프립마다 신청 마감일이 다르니, 꼭
														날짜와 시간을 확인 후 결제해주세요! : )</p>
													<br>
													<p>※신청 마감일 기준 환불 규정 예시</p>
													<ul>
														<li>프립 진행일: 10월 27일</li>
														<li>신청 마감일: 10월 26일</li>
													</ul>
													<p>10월 23일에 취소 할 경우,</p>
													<p>신청마감일 3일 전에 해당하며 20%의 수수료가 있습니다.</p>
													<br>
													<p>[환불 신청 방법]</p>
													<p>1. 해당 프립을 결제한 계정으로 로그인</p>
													<p>2. 마이 - 신청내역</p>
													<p>3. 취소를 원하는 프립 상세 정보 버튼 - 취소</p>
													<p>※ 결제 수단에 따라 예금주, 은행명, 계좌번호 입력</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="Under_Bar1">
							<div class="Under_Bar2">
								<button class="Frip_Pick" type="button">
									<img
										src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='none' viewBox='0 0 32 32'%3E %3Cpath stroke='%23333' stroke-width='1.5' d='M15.043 19.962l-.028.02-.027.021-7.571 6.384V5.827c0-1.273 1.155-2.41 2.73-2.41h11.706c1.569 0 2.73 1.138 2.73 2.41v20.56l-7.571-6.384-.027-.022-.028-.02c-.291-.203-.634-.293-.957-.293-.323 0-.665.09-.957.294z'/%3E %3C/svg%3E"
										alt="상품 저장">
									<span class="Frip_Pick_Count">135</span>
								</button>
								<button class="Under_Bar3 Under_Bar4" width="100%" height="56px" color="white" font-size="16px">
									<div class="Under_Bar5">참여하기</div>
								</button>
							</div>
						</div>
					</div>
					
					
					<section class="Content_Intro2 Content_Recommend1">
						<header class="Content_Intro3">
							<h4 class="Content_Intro4">이런 프립은 어때요?</h4>
						</header>
						<div class="Content_Recommend2">
							<div class="Content_Recommend3">
								<a class="Content_Recommend4" href="#">
									<div class="Content_Recommend5">
										<div class="Content_Recommend6">
											<div class="Content_Recommend_Place1">
												<span class="Content_Recommend_Place2"><span>용산구</span></span>
											</div>
											<div class="Content_Img1">
												<img class="Content_Img2" width="192"
													src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/WINE_MAIN_01_1504598552674">
												<div class="Content_Main2" style="opacity: 1; display: block;">
													<div style="display: block;">
														<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
															<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																<img alt="생활소믈리에 기초 와인 강의 썸네일" width="192"
																	class="Content_Img3"
																	src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/WINE_MAIN_01_1504598552674">
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Content_Recommend_State1">
												<div class="Content_Recommend_State2">판매중</div>
											</div>
										</div>
										<div class="Frip_Title1">19세이상｜이도경 강사와 함께하는</div>
										<div class="Frip_Title2">생활소믈리에 기초 와인 강의</div>
										<div class="Frip_Price1">
											<span class="Frip_Price2">50,000원</span>
											<span class="Frip_Price3">65,000</span>
										</div>
										<div class="Frip_Grade1">
											<div class="Frip_Grade2">
												<img
													src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
													alt="별점 icon"><span>4.92</span>
											</div>
										</div>
									</div>
								</a>
							</div>
							<div class="Content_Recommend3">
								<a class="Content_Recommend4" href="#">
									<div class="Content_Recommend5">
										<div class="Content_Recommend6">
											<div class="Content_Recommend_Place1">
												<span class="Content_Recommend_Place2"><span>강남/서초구</span></span>
											</div>
											<div class="Content_Img1">
												<img class="Content_Img2" width="192"
													src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/1586175181732_bf1jwj">
												<div class="Content_Main2" style="opacity: 1; display: block;">
													<div style="display: block;">
														<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
															<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																<img alt="Tea+Cocktail 차 마시며 배우는 테마가 있는 칵테일 만들기 썸네일" width="192"
																	class="Content_Img3"
																	src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/1586175181732_bf1jwj">
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Content_Recommend_State1">
												<div class="Content_Recommend_State2">판매중</div>
											</div>
										</div>
										<div class="Frip_Title1">19세이상｜직접 바텐더가 되어 만들어보는</div>
										<div class="Frip_Title2">Tea+Cocktail 차 마시며 배우는 테마가 있는 칵테일 만들기</div>
										<div class="Frip_Price1">
											<span class="Frip_Price2">43,000원</span>
											<span class="Frip_Price3"></span>
										</div>
										<div class="Frip_Grade1">
											<div class="Frip_Grade2">
												<img
													src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
													alt="별점 icon">
												<span>4.90</span>
											</div>
										</div>
									</div>
								</a>
							</div>
							<div class="Content_Recommend3">
								<a class="Content_Recommend4" href="#">
									<div class="Content_Recommend5">
										<div class="Content_Recommend6">
											<div class="Content_Recommend_Place1">
												<span class="Content_Recommend_Place2"><span>강남/서초구</span></span>
											</div>
											<div class="Content_Img1">
												<img class="Content_Img2" width="192"
													src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/product_banner_1560603284574_547509">
												<div class="Content_Main2" style="opacity: 1; display: block;">
													<div style="display: block;">
														<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
															<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																<img alt="신사 / 가로수길 칵테일 클래스 썸네일" width="192"
																	class="Content_Img3"
																	src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/product_banner_1560603284574_547509">
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Content_Recommend_State1">
												<div class="Content_Recommend_State2">판매중</div>
											</div>
										</div>
										<div class="Frip_Title1">19세이상｜바 안에서 만드는 칵테일</div>
										<div class="Frip_Title2">신사 / 가로수길 칵테일 클래스</div>
										<div class="Frip_Price1">
											<span class="Frip_Price2">35,000원</span>
											<span class="Frip_Price3">49,000</span>
										</div>
										<div class="Frip_Grade1">
											<div class="Frip_Grade2">
												<img
													src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
													alt="별점 icon">
												<span>4.91</span>
											</div>
										</div>
									</div>
								</a>
							</div>
							<div class="Content_Recommend3">
								<a class="Content_Recommend4" href="#">
									<div class="Content_Recommend5">
										<div class="Content_Recommend6">
											<div class="Content_Recommend_Place1">
												<span class="Content_Recommend_Place2"><span>송파/강동구</span></span>
											</div>
											<div class="Content_Img1">
												<img class="Content_Img2" width="192"
													src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/170212_beer_01_1486004849970">
												<div class="Content_Main2" style="opacity: 1; display: block;">
													<div style="display: block;">
														<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
															<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																<img alt="술술 놀면서 수제 맥주 만들기 썸네일" width="192"
																	class="Content_Img3"
																	src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/170212_beer_01_1486004849970">
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Content_Recommend_State1">
												<div class="Content_Recommend_State2">판매중</div>
											</div>
										</div>
										<div class="Frip_Title1">19세이상｜맥주를 즐기는 방법</div>
										<div class="Frip_Title2">술술 놀면서 수제 맥주 만들기</div>
										<div class="Frip_Price1">
											<span class="Frip_Price2">40,000원</span>
											<span class="Frip_Price3"></span>
										</div>
										<div class="Frip_Grade1">
											<div class="Frip_Grade2">
												<img
													src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
													alt="별점 icon">
												<span>4.80</span>
											</div>
										</div>
									</div>
								</a>
							</div>
							<div class="Content_Recommend3">
								<a class="Content_Recommend4" href="#">
									<div class="Content_Recommend5">
										<div class="Content_Recommend6">
											<div class="Content_Recommend_Place1">
												<span class="Content_Recommend_Place2"><span>송파/강동구</span></span>
											</div>
											<div class="Content_Img1">
												<img class="Content_Img2" width="192"
													src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/170212_beer_01_1486004849970">
												<div class="Content_Main2" style="opacity: 1; display: block;">
													<div style="display: block;">
														<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
															<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																<img alt="술술 놀면서 수제 맥주 만들기 썸네일" width="192"
																	class="Content_Img3"
																	src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_1.0,f_auto,q_auto,r_5,w_192/170212_beer_01_1486004849970">
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Content_Recommend_State1">
												<div class="Content_Recommend_State2">판매중</div>
											</div>
										</div>
										<div class="Frip_Title1">19세이상｜맥주를 즐기는 방법</div>
										<div class="Frip_Title2">술술 놀면서 수제 맥주 만들기</div>
										<div class="Frip_Price1">
											<span class="Frip_Price2">40,000원</span>
											<span class="Frip_Price3"></span>
										</div>
										<div class="Frip_Grade1">
											<div class="Frip_Grade2">
												<img
													src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
													alt="별점 icon">
												<span>4.80</span>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</section>
				</div>
			</div>


			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

</body>
</html>