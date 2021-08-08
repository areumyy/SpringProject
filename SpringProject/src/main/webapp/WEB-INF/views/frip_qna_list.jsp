<%@page import="com.market.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="<%=request.getContextPath() %>/resources/css/frip_qna_all.css" rel="stylesheet"/>
<script type="text/javascript">
$(function() {
	<%
	HttpSession session1 = request.getSession();
	MemberDTO dto = (MemberDTO)session1.getAttribute("loginDto");
	%>
})

function deleteQna(target){
	const result = confirm('해당 질문을 삭제하시겠습니까?');
	if(result > 0) {
		location.href="qna_delete.do?class_qna_num=" + target;
	}
}
</script>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">
			
				<div class="main_page">
				
					<!-- 이번주 픽 -->
					<div class="class_list">
						<div class="cateImg_list_div1" style="opacity: 1; display: block;">
							<section class="class_list_section">
								<div class="class_list_title_div1">
									<div class="class_list_title_div2">
										<h2 class="class_list_title">문의하기</h2>
									</div>
									<%if(dto != null) { %>
									<button class="insert_btn" onclick="location.href='qna_insert.do?class_num=${class_num}&mem_num=<%=dto.getMem_num()%>'">문의 작성</button>
									<%} else if(dto == null) {%>
									<button class="insert_btn" onclick="location.href='login.do'">문의 작성</button>
									<%} %>
								</div>
								
								<c:if test="${!empty list }">
								<c:forEach items="${list }" var="dto" varStatus="status">
								<div class="review_list">
									<div class="host_review_box">
				                        <div class="user_info">
				                           <div class="user_img_box">
				                              <!-- (유저 사진) -->
				                              <c:choose>
											  	  <c:when test="${memList[status.index].getMem_profileimg() == null}">
													  <img alt="프로필 이미지" src="<%=request.getContextPath() %>/resources/image/mypage/profile/profile_no_img.jpg" class="user_img">
												  </c:when>
												  <c:otherwise>
													  <img alt="${memList[status.index].getMem_profileimg() }" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${memList[status.index].getMem_profileimg() }" class="user_img">
												  </c:otherwise>										
											  </c:choose>
				                           </div>
				                           <div class="user_detail">
				                           	<div style="display: flex; justify-content: space-between;">
				                              	<c:if test="${dto.getClass_qna_writer() == loginDto.getMem_num() }">
				                              		<div class="user_name">${memList[status.index].getMem_nick() }</div>
				                              		<div style="cursor: pointer; color: #dc3545;" onclick="deleteQna(${dto.getClass_qna_num()})">삭제</div>
				                              	</c:if>
				                              	<c:if test="${dto.getClass_qna_writer() != loginDto.getMem_num() }">
				                              		<div class="user_name">
				                              			${memList[status.index].getMem_nick().substring(0,1) }
				                              			<c:forEach begin="2" end="${memList[status.index].getMem_nick().length() }">
				                              			*
				                              			</c:forEach>
				                              		</div>
				                              	</c:if>
				                            </div>
				                              <div>
				                                 <span class="review_regdate">${dto.getClass_qna_regdate() } 작성<c:if test="${dto.getClass_qna_pri() == 0 }">| 비공개</c:if></span>
				                              </div>
				                           </div>
				                        </div>
				                        <c:if test="${dto.getClass_qna_pri() == 1 }">
				                        	<div class="review_cont">${dto.getClass_qna_cont() }</div>
				                        </c:if>
				                        <c:if test="${dto.getClass_qna_pri() == 0 }">
				                        	<c:if test="${dto.getClass_qna_writer() == loginDto.getMem_num() }">
				                        		<div class="review_cont">${dto.getClass_qna_cont() }</div>
				                        	</c:if>
				                        	<c:if test="${dto.getClass_qna_writer() != loginDto.getMem_num() }">
				                        		<div class="review_cont">비밀글</div>
				                        	</c:if>
				                        </c:if>
				                        
				                        <!-- 답변이 있을때 -->
				                        <c:if test="${dto.getClass_ans_cont() != null }">
					                        <div class="ans_div">
					                        	<div class="ans_div2">
					                        		<div class="host_info_section">
					                        			<div class="host_img_section">
					                        				<c:choose>
														  	  <c:when test="${host.getMem_profileimg() == null}">
																  <img class="host_img" src="<%=request.getContextPath() %>/resources/image/mypage/profile/profile_no_img.jpg">
															  </c:when>
															  <c:otherwise>
																  <img class="host_img" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${host.getMem_profileimg() }">
															  </c:otherwise>										
															</c:choose>
					                        			</div>
														<div>
															<div class="user_name">${host.getMem_nick() }</div>
															<div class="review_regdate">${dto.getClass_ans_regdate() }작성<c:if test="${dto.getClass_qna_pri() == 0 }">| 비공개</c:if></div>
														</div>
													</div>
													<c:if test="${dto.getClass_qna_pri() == 1 }">
							                        	<div class="review_cont">${dto.getClass_ans_cont() }</div>
							                        </c:if>
							                        <c:if test="${dto.getClass_qna_pri() == 0 }">
							                        	<c:if test="${dto.getClass_qna_writer() == loginDto.getMem_num() }">
							                        		<div class="review_cont">${dto.getClass_qna_cont() }</div>
							                        	</c:if>
							                        	<c:if test="${dto.getClass_qna_writer() != loginDto.getMem_num() }">
							                        		<div class="review_cont">비밀글</div>
							                        	</c:if>
							                        </c:if>
					                        	</div>
					                        </div>
				                        </c:if>
				                     </div>
								</div>
								</c:forEach>
								</c:if>
								<c:if test="${empty list }">
									<h3>등록된 문의가 없습니다.</h3>
								</c:if>
							</section>
						</div>
					</div>
				</div>
			
			
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>