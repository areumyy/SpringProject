<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<link href="<%=request.getContextPath() %>/resources/css/searchAll.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
			
				<div class="main_page">

					<!-- 이번주 픽 -->
					<jsp:useBean id="weekago" class="java.util.Date" />
					<jsp:setProperty name="weekago" property="time" value="${weekago.time - 60*60*24*1000*7}"/>
					<fmt:formatDate var="weekago1" value="${weekago }" pattern="yyyy-MM-dd HH:mm:ss" />
					<div class="class_list">
						<div class="cateImg_list_div1" style="opacity: 1; display: block;">
							<section class="class_list_section" style="margin-top: 30px;">
								<div class="class_list_title_div1">
									<div class="class_list_title_div2">
										<h2 class="class_list_title">"${search_input}" &nbsp;검색결과</h2>
									</div>
									<div class="class_list_all">
										<a class="class_list_all_link" href="<%=request.getContextPath() %>/frip_all.do?type=best">전체보기</a>
									</div>
								</div>
									<div class="class_group">
										<c:if test="${!empty cList}">
											<c:forEach items="${cList }" var="dto">
												<div class="class_item">
													<a class="class_item_link" href="<%=request.getContextPath() %>/frip_content.do?num=${dto.getClass_num() }&memnum=${dto.getClass_memNum() }&cate_num=${dto.getCate_num()}">
														<div class="class_item_div">
															<div class="class_item_thumbnail">
																<div class="class_item_top">
																	<span class="class_area">${dto.getClass_endArea() }</span>
																	<c:forEach items="${likeList }" var="i">
																		<c:if test="${i.getClass_num() == dto.getClass_num() }">
																			<!-- 스크랩 누른상태 -->
																			<i class="fas fa-bookmark fa-2x push" data-placement="left"></i>
																		</c:if>
																	</c:forEach>
																	<c:forEach items="${nolikeList }" var="i">
																		<c:if test="${i.getClass_num() == dto.getClass_num() }">
																			<!-- 스크랩 안누른 상태 -->
																			<i class="far fa-bookmark fa-2x nopush" data-placement="left"></i>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="class_item_image">
																	<img class="class_img" src="<%=request.getContextPath() %>/resources/upload/${dto.getClass_image()}">
																</div>
															</div>
															<div class="class_item_hash">${dto.getClass_hash() }</div>
															<div class="class_item_title"><p class="main-block-desc">${dto.getClass_title() }</p></div>
															<div class="class_item_price">
																<c:if test="${dto.getOption_price() == dto.getOption_editprice()}">
																	<span class="class_price_after">${dto.getOption_price() }원</span>
																</c:if>
																<c:if test="${dto.getOption_price() != dto.getOption_editprice()}">
																	<span class="class_price_after">${dto.getOption_editprice() }원</span>
																	<span class="class_price_before">${dto.getOption_price() }원</span>
																</c:if>
															</div>
															<div class="class_star_div1">
																<div class="class_star_div2">
																	<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E">
																	<span>${dto.getReview_score() }</span>
																</div>
																<c:if test="${dto.getClass_regdate() > weekago1}">
																	<img style="margin-left: 5px;" src="<%=request.getContextPath() %>/resources/image/class/new.JPG" width='30' height='16'>
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
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>