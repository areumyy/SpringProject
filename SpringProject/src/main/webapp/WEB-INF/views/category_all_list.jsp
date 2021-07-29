<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>memCategoryAllList</title>
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
<script language="javascript">
	document.title = "카테고리별 리스트" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			
			<c:set var="cate_name" value="${CategoryName }" />
			<div class="Category_Main1">
				<div class="Category_Main2" style="opacity: 1; display: block;">
					<div class="Category_Name">
						<span>${cate_name.getClass_category1() }</span>
					</div>
					
					<c:set var="category_num" value="${category_num }" />
					<div>
						<!-- 소분류 -->
						<div class="Small_Category">
							<a href="<%=request.getContextPath() %>/category_all_list.do?num=${category_num }">전체</a>
							<c:set var="list" value="${CategoryNameList }" />
							<c:if test="${!empty list }">
								<c:forEach items="${list }" var="dto">
									<a href="<%=request.getContextPath() %>/category_list.do?num=${dto.getCate_num() }">${dto.getCate_two() }</a>
								</c:forEach>
							</c:if>
						</div>
					</div>
					
					<div class="Category_Main3">
						<br><br>
						<div>
							<!-- 카테고리 리스트 메인부분 -->
							<div class="Category_Main2" style="opacity: 1; display: block;">
								
								<!-- 인기 쿠킹 -->
								<div>
									<div class="Category_Title" font-size="14px">
										<div class="Category_Title1" font-size="18">
											<h2 class="Category_Title2">인기 ${cate_name.getClass_category1() }</h2>
											<span class="Category_Title_Count">${TotalAllCount }</span>
										</div>
										<c:if test="${TotalAllCount == 0 }">
											<div class="Category_List_All">
												<a class="Category_List_All1" href="#">
													전체 보기
												</a>
											</div>
										</c:if>
										<c:if test="${TotalAllCount != 0 }">
											<div class="Category_List_All">
												<a class="Category_List_All1"
													href="<%=request.getContextPath() %>/category_more_all_bestlist.do?num=${cate_name.getCate_num() }&title1=인기&title2=프립">
													전체 보기
												</a>
											</div>
										</c:if>
									</div>
									
									<div class="Category_Main2" style="opacity: 1; display: block;">
										<section class="Category_List">
											<div class="Category_List1">
												
												<jsp:useBean id="weekago" class="java.util.Date" />
												<jsp:setProperty name="weekago" property="time" value="${weekago.time - 60*60*24*1000*7}"/>
												<fmt:formatDate var="weekago1" value="${weekago }" pattern="yyyy-MM-dd HH:mm:ss" />
												<c:set var="list" value="${BestAllList }" />
												<c:if test="${!empty list }">
													<c:forEach items="${list }" var="dto" begin="0" end="4">
													
														<div class="Category_List2">
															<a class="Category_List3" href="<%=request.getContextPath() %>/frip_content.do?num=${dto.getClass_num() }&memnum=${dto.getClass_memNum() }&cate_num=${cate_name.getCate_num() }">
																<div class="Category_List4">
																	<div class="Category_List5">
																		<div class="Category_List6">
																			<span class="Category_List_Place"><span>${dto.getClass_endArea() }</span></span>
																			<button class="Category_Pick" width="24px" height="24px">
																				<img
																					src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																					alt="찜하기">
																			</button>
																		</div>
																		<div class="Category_List7">
																			<img class="Category_List_Img" width="192"
																				src="<%=request.getContextPath() %>/resources/image/class/${dto.getClass_image() }">
																			<div class="Category_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img
																								class="Category_List_Img1" width="192"
																								src="<%=request.getContextPath() %>/resources/image/class/${dto.getClass_image() }">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="Frip_Title">${dto.getClass_hash() }</div>
																	<div class="Frip_Title1">${dto.getClass_title() }</div>
																	<div class="Frip_Price">
																		<span class="Frip_Price1">${dto.getOption_editprice() }원</span>
																		<c:if test="${dto.getOption_price() != dto.getOption_editprice()}">
																			<span class="Frip_Price2">${dto.getOption_price() }원</span>
																		</c:if>
																	</div>
																	<div class="Frip_Grade">
																		<div class="Frip_Grade1">
																			<img
																				src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																				alt="별점 icon"><span>${dto.getReview_score() }</span>
																		</div>
																		<c:if test="${dto.getClass_regdate() > weekago1}">
																			<img
																				class="Frip_New"
																				src="<%=request.getContextPath() %>/resources/image/class/new.JPG" width='30' height='16'>
																		</c:if>
																	</div>
																</div>
															</a>
														</div>
														
													</c:forEach>
												</c:if>
											</div>
										</section>
									</div>
								</div>
								
								<!-- 금주의 쿠킹 -->
								<div>
									<div font-size="14px"
										class="Category_Title">
										<div font-size="18" class="Category_Title1">
											<h2 class="Category_Title2">금주의 ${cate_name.getClass_category1() }</h2>
											<span class="Category_Title_Count">${WeekAllCount }</span>
										</div>
										<c:if test="${WeekAllCount == 0 }">
											<div class="Category_List_All">
												<a class="Category_List_All1" href="#">
													전체 보기
												</a>
											</div>
										</c:if>
										<c:if test="${WeekAllCount != 0 }">
											<div class="Category_List_All">
												<a class="Category_List_All1"
													href="<%=request.getContextPath() %>/category_more_all_weeklist.do?num=${cate_name.getCate_num() }&title1=금주의&title2=프립">
													전체 보기
												</a>
											</div>
										</c:if>
									</div>
									<div class="Category_Main2" style="opacity: 1; display: block;">
										<section class="Category_List">
											<div class="Category_List1">
												
												<c:set var="list" value="${WeekAllList }" />
												<c:if test="${!empty list }">
													<c:forEach items="${list }" var="dto" begin="0" end="4">
													
														<div class="Category_List2">
															<a class="Category_List3" href="<%=request.getContextPath() %>/frip_content.do?num=${dto.getClass_num() }&memnum=${dto.getClass_memNum() }&cate_num=${cate_name.getCate_num() }">
																<div class="Category_List4">
																	<div class="Category_List5">
																		<div class="Category_List6">
																			<span class="Category_List_Place"><span>${dto.getClass_endArea() }</span></span>
																			<button class="Category_Pick" width="24px" height="24px">
																				<img
																					src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																					alt="찜하기">
																			</button>
																		</div>
																		<div class="Category_List7">
																			<img class="Category_List_Img" width="192"
																				src="<%=request.getContextPath() %>/resources/image/class/${dto.getClass_image() }">
																			<div class="Category_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img
																								class="Category_List_Img1" width="192"
																								src="<%=request.getContextPath() %>/resources/image/class/${dto.getClass_image() }">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="Frip_Title">${dto.getClass_hash() }</div>
																	<div class="Frip_Title1">${dto.getClass_title() }</div>
																	<div class="Frip_Price">
																		<span class="Frip_Price1">${dto.getOption_editprice() }원</span>
																		<c:if test="${dto.getOption_price() != dto.getOption_editprice()}">
																			<span class="Frip_Price2">${dto.getOption_price() }원</span>
																		</c:if>
																	</div>
																	<div class="Frip_Grade">
																		<div class="Frip_Grade1">
																			<img
																				src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																				alt="별점 icon"><span>${dto.getReview_score() }</span>
																		</div>
																		<c:if test="${dto.getClass_regdate() > weekago1}">
																			<img
																				class="Frip_New"
																				src="<%=request.getContextPath() %>/resources/image/class/new.JPG" width='30' height='16'>
																		</c:if>
																	</div>
																</div>
															</a>
														</div>
														
													</c:forEach>
												</c:if>
												
											</div>
										</section>
									</div>
								</div>
								
								<!-- 신규 쿠킹 -->
								<div>
									<div class="Category_Title" font-size="14px">
										<div class="Category_Title1" font-size="18">
											<h2 class="Category_Title2">신규 ${cate_name.getClass_category1() }</h2>
											<span class="Category_Title_Count">${NewAllCount }</span>
										</div>
										<c:if test="${NewAllCount == 0 }">
											<div class="Category_List_All">
												<a class="Category_List_All1" href="#">
													전체 보기
												</a>
											</div>
										</c:if>
										<c:if test="${NewAllCount != 0 }">
											<div class="Category_List_All">
												<a class="Category_List_All1"
													href="<%=request.getContextPath() %>/category_more_all_newlist.do?num=${cate_name.getCate_num() }&title1=신규&title2=프립">
													전체 보기
												</a>
											</div>
										</c:if>
									</div>
									<div class="Category_Main2" style="opacity: 1; display: block;">
										<section class="Category_List">
											<div class="Category_List1">
												
												<c:set var="list" value="${NewAllList }" />
												<c:if test="${!empty list }">
													<c:forEach items="${list }" var="dto" begin="0" end="4">
													
														<div class="Category_List2">
															<a class="Category_List3" href="<%=request.getContextPath() %>/frip_content.do?num=${dto.getClass_num() }&memnum=${dto.getClass_memNum() }&cate_num=${cate_name.getCate_num() }">
																<div class="Category_List4">
																	<div class="Category_List5">
																		<div class="Category_List6">
																			<span class="Category_List_Place"><span>${dto.getClass_endArea() }</span></span>
																			<button class="Category_Pick" width="24px" height="24px">
																				<img
																					src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'%3E %3Cpath fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/%3E %3C/svg%3E"
																					alt="찜하기">
																			</button>
																		</div>
																		<div class="Category_List7">
																			<img class="Category_List_Img" width="192"
																				src="<%=request.getContextPath() %>/resources/image/class/${dto.getClass_image() }">
																			<div class="Category_Main2" style="opacity: 1; display: block;">
																				<div style="display: block;">
																					<div style="height: 0px; position: relative; width: 100%; padding-top: 100%;">
																						<div style="height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;">
																							<img
																								class="Category_List_Img1" width="192"
																								src="<%=request.getContextPath() %>/resources/image/class/${dto.getClass_image() }">
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="Frip_Title">${dto.getClass_hash() }</div>
																	<div class="Frip_Title1">${dto.getClass_title() }</div>
																	<div class="Frip_Price">
																		<span class="Frip_Price1">${dto.getOption_editprice() }원</span>
																		<c:if test="${dto.getOption_price() != dto.getOption_editprice()}">
																			<span class="Frip_Price2">${dto.getOption_price() }원</span>
																		</c:if>
																	</div>
																	<div class="Frip_Grade">
																		<div class="Frip_Grade1">
																			<img
																				src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E"
																				alt="별점 icon"><span>${dto.getReview_score() }</span>
																		</div>
																		<c:if test="${dto.getClass_regdate() > weekago1}">
																			<img
																				class="Frip_New"
																				src="<%=request.getContextPath() %>/resources/image/class/new.JPG" width='30' height='16'>
																		</c:if>
																	</div>
																</div>
															</a>
														</div>
														
													</c:forEach>
												</c:if>
												
											</div>
										</section>
									</div>
								</div>
	      						
	      						<c:if test="${TotalAllCount == 0 }">
									<div class="Category_List_All2" font-size="13px">
										<a class="Category_List_All3" href="#">
											${TotalAllCount }개의 ${cate_name.getClass_category1() }
											전체보기
										</a>
									</div>
								</c:if>
								<c:if test="${TotalAllCount != 0 }">
									<div class="Category_List_All2" font-size="13px">
										<a class="Category_List_All3" href="<%=request.getContextPath() %>/category_more_all_list.do?num=${cate_name.getCate_num() }&title1=전체&title2=프립">
											${TotalAllCount }개의 ${cate_name.getClass_category1() }
											전체보기
										</a>
									</div>
								</c:if>
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
