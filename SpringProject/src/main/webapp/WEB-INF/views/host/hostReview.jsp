<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트_후기관리</title>
<!-- 반응형 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<!-- CSS 파일 -->
<link href="<%=request.getContextPath()%>/resources/css/hostReview.css" rel="stylesheet" />
<script language="javascript">
	document.title = "호스트 후기관리" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
<script>
function check(su) {
	if($("#textarea"+su).length == 0) {
		alert('내용을 입력하세요');
	}else {
		return true;
	}
}
</script>
</head>
<body>
	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<div class="Main_title_box">
						<h1 class="Main_title">후기관리</h1>
						<div>
							<select class="form-select form-select-lg mb-3 cal_select">
								<option value="">전체</option>
								<option value="">프립명</option>
							</select>
						</div>
					</div>
					
					<div class="info_frame">
						<div class="state">
							<div class="review_header">
								<div>평균 평점</div> 
								<div><img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%23E6E6E6' fill-rule='evenodd' d='M8.032 12.715l-4.72 2.482.9-5.257L.394 6.217l5.279-.767L8.032.667l2.361 4.783 5.279.767-3.82 3.723.902 5.257z'/%3E %3C/svg%3E"></div>
								<div><fmt:formatNumber value="${average }" pattern=".00"/>
								 (총 ${total }개)</div>
							</div>
							<c:set var="list" value="${rList }"/>
							<c:if test="${!empty list }">
							<!-- 아코디언 -->
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<c:forEach items="${rList }" var="dto" varStatus="index">
								  <div class="accordion-item">
								    <h2 class="accordion-header" id="flush-heading${index.count }">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${index.count }" aria-expanded="false" aria-controls="flush-collapse${index.count }">
								        <!-- 버튼 -->
								        <div class="host_review_box">
								      		<div class="user_info">
								      			<div class="user_img_box">
								      				<img alt="user_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
								      			</div>
								      			<div class="user_detail">
								      				<div class="user_name">
								      					<span>${dto.getMem_name() }</span>
								      					<span class="review_score"><img alt="review_score" src="<%=request.getContextPath() %>/resources/image/like/review_star_icon.svg"></span>
								      					<span class="review_regdate">${dto.getClass_startDate().substring(0,10) }&nbsp;참여</span>
								      					<span class="frip_option_name">| ${dto.getOption_name() }</span>
								      				</div>
								      			</div>
								      		</div>
								      	</div>
								      </button>
								    </h2>
								    <div id="flush-collapse${index.count }" class="accordion-collapse collapse" aria-labelledby="flush-heading${index.count }" data-bs-parent="#accordionFlushExample">
								      <div class="accordion-body">
								      	<!-- 후기내용 -->
								      	<div class="host_review_box">
								      		<div class="review_cont" style='white-space: pre-line;'>${dto.getReview_cont() }</div>
								      		<div class="booking_info">
								      			<div class="class_startDate">
								      				<span>${dto.getReview_regdate() }</span>
								      			</div>
								      		</div>
								      		<div class="review_footer_box">
								      			<img alt="review_image" src="<%=request.getContextPath() %>/resources/image/like/review_image.jpg" class="review_image">
								      			
									      			<div class="reply_btn_box">
									      				<!-- 답변하기 모달창 -->
									      				<!-- Button trigger modal -->
														<button type="button" class="btn btn-outline-secondary reply_btn" data-bs-toggle="modal" data-bs-target="#exampleModal${index.count }">
															<c:if test="${empty dto.getReview_reply() }">
																답변하기
															</c:if>
															<c:if test="${!empty dto.getReview_reply() }">
																수정하기
															</c:if>
														</button>
														<!-- Modal -->
														<div class="modal fade" id="exampleModal${index.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered">
																<div class="modal-content">
																	<div>
																		<div class="modal-header">
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal" aria-label="Close"></button>
																		</div>
																		<div class="modal-body">
						
																			<!-- 답변내용 -->
																		<form method="post" action="<%=request.getContextPath() %>/reviewReplyOk.do" onsubmit="check(${index.count });")>
																			<input type="hidden" value="${dto.getReview_num() }" name="review_num">
																			<input type="hidden" value="${Paging.getPage()}" name="page">
																			<div>
																				<div class="reply_modal">답변내용 작성</div>
																				<div class="reply_textarea">
																					<textarea id="textarea${index.count }" rows="7" cols="50" name="review_reply">${dto.getReview_reply() }</textarea>
																				</div>
																			</div>
								
																			</div>
																			<div class="modal-footer">
																				<input type="submit" value="작성하기" class="btn btn-outline-secondary"></button>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
														</div>
									      			</div>
								      		</div>
								        </div>
								        <!-- 호스트답변 -->
								        <div class="host_reply_box">
								      		<div class="host_info">
								      			<div class="host_img_box">
								      				<img alt="host_img" src="<%=request.getContextPath() %>/resources/image/like/user_img.jpg" class="user_img">
								      			</div>
								      			<div class="host_detail">
								      				<div class="host_name">
								      					<span>${loginDto.getMem_nick() }</span>
								      					<span class="reply_regdate">${dto.getReview_replyDate() }</span>
								      				</div>
								      			</div>
								      		</div>
								      		<div class="reply_cont">${dto.getReview_reply() }</div>
								      	</div>
								      </div>
								   </div>
								  </div>
								  </c:forEach>
						   </div> <!-- 아코디언 end  -->
						   
						   <!-- 페이징  -->
						   <nav aria-label="Page navigation example" class="list_footer">
								<ul class="pagination">
									<c:if test="${Paging.getPage() > Paging.getBlock() }">
										<li class="page-item">
											<a class="page_link" href="hostReview.do?page=1">
												<span aria-hidden="true">&laquo;</span>
											</a>
											<a class="page_link" href="hostReview.do?page=${Paging.getPage() - 1 }">	
												<span aria-hidden="true">&lt;</span>
											</a>
										</li>
									</c:if>
									<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
										<c:if test="${i == Paging.getPage() }">
											<li class="page-item"><a class="page_link paging_active">${i }</a></li>
										</c:if>
										<c:if test="${i != Paging.getPage() }">
											<li class="page-item"><a class="page_link" href="hostReview.do?page=${i }">${i }</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
										<li class="page-item">
											<a class="page_link" href="qna_list.do?page=${Paging.getPage() + 1 }">	
												<span aria-hidden="true">&gt;</span>
											</a>
											<a class="page_link" href="qna_list.do?page=${Paging.getAllPage() }">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:if>
								</ul>
							</nav>
						   		</c:if>
						   		
						   		<c:if test="${empty list }">
						   			<span class="nonReview">관리할 후기가 없습니다.</span>
						   		</c:if>
						</div>
					</div>
				</div> <!-- class="Main" end -->
			</div>
		</div>
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>