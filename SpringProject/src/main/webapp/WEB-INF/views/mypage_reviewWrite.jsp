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
<link href="<%=request.getContextPath() %>/resources/css/mypageReviewWrite.css" rel="stylesheet"/>
<script type="text/javascript">
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $('#counter').html(content.length + ' / 1000');
    });
    $('#content').keyup();
});
</script>
</head>

<body>
	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">



				<div class="pg_main">
					<div class="pg_wrapper">
						<div class="pg_container">
							<header class="mypage_reviewWrite_header_wrapper">
								<h1 class="pg_header_txt">후기 작성하기</h1>
							</header>
							<div class="mypage_reviewWrite_cont">
								<div class="reviewWrite_img">
									<img class="img_style"
										src="<%=request.getContextPath()%>/resources/image/mypage/profile/${dto.getMem_profileimg() }">
								</div>
								<h3 class="reviewWrite_question">
									<p>{dto.getClass_title() }</p>
									만족하셨나요?
								</h3>
								<div class="reviewWrite_star">
									<div id="dataReview" style="font-size: 1.5em;"
										data-rating-stars="5" data-rating-value="3"
										data-rating-input="#dataInput"></div>

									<p class="reviewWrite_comment">선택해주세요.</p>

								</div>
							</div>
							<div class="mypage_reviewWrite_textarea">
								<textarea placeholder="15글자 이상의 사진후기를 작성해주시면 500에너지가 적립됩니다.&#13;&#10;무분별한 비방 또는 욕설이 포함된 후기는 사전고지 없이 삭제될 수 있습니다." maxlength="1000" class="textarea_style" id="content">{dto.getReview_cont() }</textarea>
								<p class="textarea_count" id="counter"></p>
							</div>
							<div>
								<label class="imgUpload">
									<input type="file" accept=".jpg, .jpeg, .png" multiple>
									<span>사진 첨부하기</span>
								</label>
							</div>
							<div class="mypage_reviewWrite_footer">
								<input type="submit" class="reviewWrite_button" value="등록하기">
							</div>
						</div>
					</div>



				</div>
				<jsp:include page="../include/footer.jsp" />
			</div>
		</div>
	</div>
</body>
</html>