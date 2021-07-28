<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/rating.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypageCommon.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/mypageReview.css" rel="stylesheet"/>
</head>
<body>
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">



				<div class="pg_main">
					<div class="pg_wrapper">
						<div class="pg_container">
							<header class="pg_header_wrapper">
								<h1 class="pg_header_txt">후기</h1>
							</header>
							<div class="mypage_review_wrapper">
								<div class="mypage_review_header">
									<div class="review_metaData">
										<div class="review_title">
											한밀푸드 명가토종 순대국
										</div>
										<div class="review_row">
											<div class="review_star_readonly">
												<div id="dataReadonlyReview" style="font-size: 0.8em;"
													data-rating-stars="5" data-rating-value="3" 
													data-rating-readonly="true" data-rating-input="#dataReadonlyInput">
												</div>
											</div>
											<div class="review_date">
												2021년 7월 16일 9:03 작성
											</div>
										</div>
									</div>
									
									<div class="reviewWrite_button">
										<a href="<%=request.getContextPath()%>/mypage_reviewWrite.do" class="reviewWrite_button_style">후기 편집</a>
									</div>
								</div>
								<div class="mypage_review_body">
									맛있어요. 다대기는 맛없어요.
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