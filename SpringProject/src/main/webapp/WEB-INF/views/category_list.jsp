<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>memCategoryList</title>
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
<link href="<%=request.getContextPath() %>/resources/css/category_list.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />

			<div class="Category_Main1">
				<div class="Category_Main2" style="opacity: 1; display: block;">
					<div class="Category_Name">
						<span>쿠킹</span>
					</div>
					
					<div>
						<!-- 소분류 -->
						<div class="Small_Category">
							<a href="#" style="font-weight: bold; color: rgb(51, 151, 255);">전체</a>
							<a href="#">요리</a>
							<a href="#">음료</a>
							<a href="#">베이킹</a>
						</div>
					</div>
					
					<div class="Category_Main3">
						<!-- 필터 -->
						<div class="Category_Filter">
							<div class="Category_Filter_When">
								<div class="Category_Filter1">
									<button height="auto" color="initial" font-size="14px"
										font-weight="500" class="Category_Filter2">언제</button>
								</div>
							</div>
							<div class="Category_Filter_Where">
								<div class="Category_Filter1">
									<button height="auto" color="initial" font-size="14px"
										font-weight="500" class="Category_Filter2">어디서</button>
								</div>
							</div>
							<div>
								<div class="Category_Filter1">
									<button height="auto" color="initial" font-size="14px"
										font-weight="500" class="Category_Filter2">누구와</button>
								</div>
							</div>
							<div>
								<div class="Category_Filter1">
									<button height="auto" color="initial" font-size="14px"
										font-weight="500" class="Category_Filter2">필터</button>
								</div>
							</div>
						</div>
						<div>
							<!-- 카테고리 리스트 메인부분 -->
							<div class="Category_Main2" style="opacity: 1; display: block;">
								
								<!-- 인기 쿠킹 -->
								<div>
									<div class="Category_Title" font-size="14px">
										<div class="Category_Title1" font-size="18">
											<h2 class="Category_Title2">인기 쿠킹</h2>
											<span class="Category_Title_Count">181</span>
										</div>
										<div class="Category_List_All">
											<a class="Category_List_All1" href="#">전체 보기</a>
										</div>
									</div>
									
									<div class="Category_Main2" style="opacity: 1; display: block;">
										<section class="Category_List">
											<div class="Category_List1">
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>마포/서대문구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1624943057862_556589">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img
																						alt="[41%▼] [초급] 나만의 칵테일 만들기 원데이 클래스 (예약 가능) 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1624943057862_556589">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">나만의 특별한 칵테일 만들기</div>
															<div class="Frip_Title1">[41%▼] [초급] 나만의 칵테일 만들기 원데이 클래스 (예약 가능)</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">23,000원</span>
																<span class="Frip_Price2">39,000</span>
															</div>
															<div class="Frip_Grade">
																<div class="Frip_Grade1">
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																		alt="별점 icon"><span>5.00</span>
																</div>
																<img
																	src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='16' viewBox='0 0 30 16'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='30' height='16' fill='%233397FF' rx='5'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M11.25 10.688H9.887L7.87 7.147v3.54H6.5V5h1.371l2.012 3.54V5h1.367v5.688zm4.895-2.41h-2.157v1.355h2.547v1.055h-3.918V5h3.926v1.059h-2.555v1.199h2.157v1.02zM22 8.565L22.652 5h1.36l-1.207 5.688h-1.422l-.762-3.243-.746 3.242h-1.418L17.247 5h1.362l.653 3.566L20.043 5h1.164L22 8.566z'/%3E %3C/g%3E %3C/svg%3E"
																	class="Frip_New">
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>동작/관악구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/KakaoTalk_20210630_182825457_03_j1z30k">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="내만내칵 (내가 만들어서 내가 마시는 칵테일) 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/KakaoTalk_20210630_182825457_03_j1z30k">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">2가지 칵테일 만들어보기</div>
															<div class="Frip_Title1">내만내칵 (내가 만들어서 내가 마시는 칵테일)</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">40,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<img
																	src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='16' viewBox='0 0 30 16'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='30' height='16' fill='%233397FF' rx='5'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M11.25 10.688H9.887L7.87 7.147v3.54H6.5V5h1.371l2.012 3.54V5h1.367v5.688zm4.895-2.41h-2.157v1.355h2.547v1.055h-3.918V5h3.926v1.059h-2.555v1.199h2.157v1.02zM22 8.565L22.652 5h1.36l-1.207 5.688h-1.422l-.762-3.243-.746 3.242h-1.418L17.247 5h1.362l.653 3.566L20.043 5h1.164L22 8.566z'/%3E %3C/g%3E %3C/svg%3E"
																	class="Frip_New">
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>송파/강동구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/170212_beer_01_1486004849970">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="술술 놀면서 수제 맥주 만들기 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/170212_beer_01_1486004849970">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">19세이상｜맥주를 즐기는 방법</div>
															<div class="Frip_Title1">술술 놀면서 수제 맥주 만들기</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">40,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<div class="Frip_Grade1">
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																		alt="별점 icon"><span>4.80</span>
																</div>
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>강남/서초구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1622442349266_977596">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="[강남] 와인 대회 우승 전문가와 함께 하는 원데이 기초 클래스! 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1622442349266_977596">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">19세이상｜와인 첫 시작은 주도락가와 함께</div>
															<div class="Frip_Title1">[강남] 와인 대회 우승 전문가와 함께 하는 원데이 기초 클래스!</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">55,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<div class="Frip_Grade1">
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																		alt="별점 icon"><span>5.00</span>
																</div>
															</div>
														</div>
													</a>
												</div>
											</div>
										</section>
									</div>
								</div>
								
								<!-- 금주의 쿠킹 -->
								<div>
									<div font-size="14px"
										class="Category_Title">
										<div font-size="18" class="Category_Title1">
											<h2 class="Category_Title2">금주의 쿠킹</h2>
											<span class="Category_Title_Count">11</span>
										</div>
										<div class="Category_List_All">
											<a class="Category_List_All1" href="#">전체 보기</a>
										</div>
									</div>
									<div class="Category_Main2" style="opacity: 1; display: block;">
										<section class="Category_List">
											<div class="Category_List1">
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>강남/서초구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/1586175181732_bf1jwj">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img
																						alt="Tea+Cocktail 차 마시며 배우는 테마가 있는 칵테일 만들기 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/1586175181732_bf1jwj">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">19세이상｜직접 바텐더가 되어 만들어보는</div>
															<div class="Frip_Title1">Tea+Cocktail 차 마시며 배우는 테마가 있는 칵테일 만들기</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">43,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<div class="Frip_Grade1">
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																		alt="별점 icon"><span>4.90</span>
																</div>
															</div>
														</div></a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>강남/서초구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1622442349266_977596">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="[강남] 와인 대회 우승 전문가와 함께 하는 원데이 기초 클래스! 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1622442349266_977596">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">19세이상｜와인 첫 시작은 주도락가와 함께</div>
															<div class="Frip_Title1">[강남] 와인 대회 우승 전문가와 함께 하는 원데이 기초 클래스!</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">55,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<div class="Frip_Grade1">
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																		alt="별점 icon"><span>5.00</span>
																</div>
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>강남/서초구</span></span>
																	<button class="Category_Pick"width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1560603284574_547509">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="신사 / 가로수길 칵테일 클래스 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1560603284574_547509">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">19세이상｜바 안에서 만드는 칵테일</div>
															<div class="Frip_Title1">신사 / 가로수길 칵테일 클래스</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">35,000원</span>
																<span class="Frip_Price2">49,000</span>
															</div>
															<div class="Frip_Grade">
																<div class="Frip_Grade1">
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																		alt="별점 icon"><span>4.91</span>
																</div>
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>강남/서초구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1565941920026_463598">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="알록달록 컬러 파스타 만들기 (예약 가능) 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1565941920026_463598">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">기분에 맞춰 건강에 맞춰 다양한 컬러로 요리를!</div>
															<div class="Frip_Title1">알록달록 컬러 파스타 만들기 (예약 가능)</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">30,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<div class="Frip_Grade1">
																	<img
																		src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																		alt="별점 icon"><span>4.89</span>
																</div>
															</div>
														</div>
													</a>
												</div>
											</div>
										</section>
									</div>
								</div>
								
								<!-- 신규 쿠킹 -->
								<div>
									<div class="Category_Title" font-size="14px">
										<div class="Category_Title1" font-size="18">
											<h2 class="Category_Title2">신규 쿠킹</h2>
											<span class="Category_Title_Count">6</span>
										</div>
										<div class="Category_List_All">
											<a class="Category_List_All1" href="#">전체 보기</a>
										</div>
									</div>
									<div class="Category_Main2" style="opacity: 1; display: block;">
										<section class="Category_List">
											<div class="Category_List1">
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>동작/관악구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/KakaoTalk_20210630_182825457_03_j1z30k">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="내만내칵 (내가 만들어서 내가 마시는 칵테일) 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/KakaoTalk_20210630_182825457_03_j1z30k">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">2가지 칵테일 만들어보기</div>
															<div class="Frip_Title1">내만내칵 (내가 만들어서 내가 마시는 칵테일)</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">40,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<img
																	src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='16' viewBox='0 0 30 16'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='30' height='16' fill='%233397FF' rx='5'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M11.25 10.688H9.887L7.87 7.147v3.54H6.5V5h1.371l2.012 3.54V5h1.367v5.688zm4.895-2.41h-2.157v1.355h2.547v1.055h-3.918V5h3.926v1.059h-2.555v1.199h2.157v1.02zM22 8.565L22.652 5h1.36l-1.207 5.688h-1.422l-.762-3.243-.746 3.242h-1.418L17.247 5h1.362l.653 3.566L20.043 5h1.164L22 8.566z'/%3E %3C/g%3E %3C/svg%3E"
																	class="Frip_New">
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>강릉</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1613645925913_343246">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="[1박 2일] 맛탐방꾼의 전국 노포맛집 찾기 (강릉편) 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1613645925913_343246">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">#19세이상 #미식여행 #로드트립</div>
															<div class="Frip_Title1">[1박 2일] 맛탐방꾼의 전국 노포맛집 찾기 (강릉편)</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">199,000원</span>
																<span class="Frip_Price2">250,000</span>
															</div>
															<div class="Frip_Grade">
																<img
																	src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='16' viewBox='0 0 30 16'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='30' height='16' fill='%233397FF' rx='5'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M11.25 10.688H9.887L7.87 7.147v3.54H6.5V5h1.371l2.012 3.54V5h1.367v5.688zm4.895-2.41h-2.157v1.355h2.547v1.055h-3.918V5h3.926v1.059h-2.555v1.199h2.157v1.02zM22 8.565L22.652 5h1.36l-1.207 5.688h-1.422l-.762-3.243-.746 3.242h-1.418L17.247 5h1.362l.653 3.566L20.043 5h1.164L22 8.566z'/%3E %3C/g%3E %3C/svg%3E"
																	class="Frip_New">
																<img
																	src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='33' height='16' viewBox='0 0 33 16'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='33' height='16' fill='%23003471' rx='5'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M11.127 8.04c0 .554-.103 1.045-.309 1.472a2.28 2.28 0 0 1-.877.986c-.379.23-.81.346-1.295.346-.484 0-.914-.112-1.289-.334a2.277 2.277 0 0 1-.877-.955c-.21-.414-.32-.89-.33-1.426v-.32c0-.558.102-1.05.307-1.475.204-.426.497-.755.879-.986A2.459 2.459 0 0 1 8.638 5c.482 0 .912.115 1.29.344.377.229.67.555.88.978.21.423.316.908.319 1.455v.262zM9.732 7.8c0-.564-.094-.993-.283-1.286a.908.908 0 0 0-.81-.44c-.688 0-1.051.516-1.09 1.547l-.004.418c0 .557.092.986.277 1.285.185.3.46.45.824.45a.896.896 0 0 0 .8-.442c.188-.294.283-.717.286-1.27v-.261zm7.352 2.966H15.72l-2.015-3.54v3.54h-1.371V5.078h1.37l2.012 3.54v-3.54h1.368v5.688zm2.738-1.055h2.387v1.055H18.45V5.078h1.37v4.633zm4.457-2.164l1.047-2.469h1.48l-1.832 3.645v2.043h-1.39V8.723l-1.829-3.645h1.473l1.05 2.469z'/%3E %3C/g%3E %3C/svg%3E"
																	class="Frip_New">
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>송파/강동구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7">
																	<img class="Category_List_Img" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1624940968552_494044">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="[송파] 직접 로스팅한 원두 추출하기 (예약 가능) 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1624940968552_494044">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">한 잔을 마셔도 정확하게~</div>
															<div class="Frip_Title1">[송파] 직접 로스팅한 원두 추출하기 (예약 가능)</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">45,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<img
																	src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='16' viewBox='0 0 30 16'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='30' height='16' fill='%233397FF' rx='5'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M11.25 10.688H9.887L7.87 7.147v3.54H6.5V5h1.371l2.012 3.54V5h1.367v5.688zm4.895-2.41h-2.157v1.355h2.547v1.055h-3.918V5h3.926v1.059h-2.555v1.199h2.157v1.02zM22 8.565L22.652 5h1.36l-1.207 5.688h-1.422l-.762-3.243-.746 3.242h-1.418L17.247 5h1.362l.653 3.566L20.043 5h1.164L22 8.566z'/%3E %3C/g%3E %3C/svg%3E"
																	class="Frip_New">
															</div>
														</div>
													</a>
												</div>
												<div class="Category_List2">
													<a class="Category_List3" href="#">
														<div class="Category_List4">
															<div class="Category_List5">
																<div class="Category_List6">
																	<span class="Category_List_Place"><span>송파/강동구</span></span>
																	<button class="Category_Pick" width="24px" height="24px">
																		<img
																			src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																			alt="찜하기">
																	</button>
																</div>
																<div class="Category_List7" width="192"
																		src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1624940405214_480229">
																	<div class="Category_Main2" style="opacity: 1; display: block;">
																		<div style="display: block;">
																			<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																				<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																					<img alt="[송파] 로스팅 &amp; 핸드드립 (예약 가능) 썸네일"
																						class="Category_List_Img1" width="192"
																						src="https://res.cloudinary.com/frientrip/image/upload/ar_1:1,c_fill,dpr_2,f_auto,w_310/product_banner_1624940405214_480229">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="Category_List_State">
																	<div class="Category_List_State1">판매중</div>
																</div>
															</div>
															<div class="Frip_Title">직접 로스팅한 커피 추출~</div>
															<div class="Frip_Title1">[송파] 로스팅 &amp; 핸드드립 (예약 가능)</div>
															<div class="Frip_Price">
																<span class="Frip_Price1">45,000원</span>
																<span class="Frip_Price2"></span>
															</div>
															<div class="Frip_Grade">
																<img
																	src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='16' viewBox='0 0 30 16'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='30' height='16' fill='%233397FF' rx='5'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M11.25 10.688H9.887L7.87 7.147v3.54H6.5V5h1.371l2.012 3.54V5h1.367v5.688zm4.895-2.41h-2.157v1.355h2.547v1.055h-3.918V5h3.926v1.059h-2.555v1.199h2.157v1.02zM22 8.565L22.652 5h1.36l-1.207 5.688h-1.422l-.762-3.243-.746 3.242h-1.418L17.247 5h1.362l.653 3.566L20.043 5h1.164L22 8.566z'/%3E %3C/g%3E %3C/svg%3E"
																	class="Frip_New">
															</div>
														</div>
													</a>
												</div>
											</div>
										</section>
									</div>
								</div>
								<div class="Category_List_All2" font-size="13px">
									<a class="Category_List_All3" href="#">181개의 쿠킹 전체보기</a>
								</div>
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
