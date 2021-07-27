<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_프립 승인</title>

<!-- 반응형 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<!-- CSS 파일 -->
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/admin_frip_pass.css" rel="stylesheet" />

<script type="text/javascript">

	/* $('.modal').on('hidden.bs.modal', function(e) {
            $(this).removeData();
    }) ; */
	
    // 모달창 높이 조절
	$(document).ready(function () {
	    $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .7) + 
	    						'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
	});

</script>

</head>
<body>

	<div class="mainFrame">
	<jsp:include page="../include/adminMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../include/adminSideBar.jsp"></jsp:include>
	
				<div class="Main">
					<!-- 승인 대기 -->
					<div class="pass_box">
						<div class="pass_box_title">
							프립승인 대기
							<span class="pass_count">${wait_count } 건</span>
						</div>
						<table class="table table-hover table_cal_pass">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">프립No</th>
						      <th scope="col">프립명</th>
						      <th scope="col">1차 카테고리</th>
						      <th scope="col">2차 카테고리</th>
						      <th scope="col">신청일자</th>
						      <th scope="col">상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						
						  <!-- key값 받기 -->
				  		  <c:set var="pass_wait" value="${fripPass_wait }" />		<!-- 프립 승인대기 목록 -->
						  <c:if test="${!empty pass_wait }">
						  	<c:forEach items="${pass_wait }" var="dto" varStatus="status">
							  <tbody>
							    <tr>
							      <th scope="row">${status.count}</th>
							      <td>${dto.getMem_name() }</td>
							      <td>${dto.getClass_num()}</td>
							      <td>${dto.getClass_title() }</td>
							      <td>${dto.getClass_category1() }</td>
							      <td>${dto.getClass_category2() }</td>
							      <td>${dto.getClass_regdate().substring(0, 10) }</td>
							      <c:if test="${dto.getClass_pass() == 0}">
							      	<td>대기</td>
							      </c:if>
							      <td>
							      	<!-- Button trigger modal -->
									<button type="button" class="viewDetail_btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${dto.getClass_num() }">상세보기</button>
									<!-- Modal -->
									<div class="modal fade" id="exampleModal${dto.getClass_num() }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<div>
													<div class="modal-header">
														프립 상세보기
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													
													<form action="<%=request.getContextPath() %>/admin_frip_pass_ok.do" method="post">
													  <input type="hidden" value="${dto.getClass_num() }" name="class_num">
													  <div class="modal-body">
														<!-- 프립을 소개해 주세요 -->
														<div class="Main_line_hidden" id="final">
															<div class="Main_line_1">
																<div class="final_confirm">
																	<div class="final_confirm_frame">
																		<div class="confirm_img_box">
																			<!-- 사진 수정필요(클래스 사진) -->
																			<img alt="${dto.getClass_image() }" src="<%=request.getContextPath() %>/resources/image/like/${dto.getClass_image() }" name="confirm_img" class="confirm_img">
																		</div>
																		<div class="final_frip_info">
																			<section class="info_section">
																				<div class="info_title" id="fripTitle">
																					${dto.getClass_title() }
																				</div>
																				<div class="info_price">
																					<span class="salePrice">34% </span> 123,456원
																				</div>
																			</section>
																			<section class="info_section1">
																				<div class="info_hostInfo">
																					<!-- 사진 수정필요(호스트=유저 사진) -->
																					<img width="56px" height="56px" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${dto.getMem_profileImg() }" >
																					<div class="info_hostInfo_text">
																						<div>${dto.getMem_name() } ></div>
																						<div class="count_example">프립 14 | 후기 14 | 저장 342</div>
																					</div>
																					
																				</div>
																				
																				<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='none' viewBox='0 0 32 32'%3E %3Cpath fill='%23F4F4F4' stroke='%23CCC' stroke-width='1.5' d='M15.043 19.962l-.029.02-.026.021-7.571 6.384V5.827c0-1.273 1.155-2.41 2.73-2.41h11.706c1.569 0 2.73 1.138 2.73 2.41v20.56l-7.572-6.384-.026-.022-.028-.02c-.292-.203-.634-.293-.957-.293-.324 0-.666.09-.957.294z'/%3E %3C/svg%3E" alt="상품 저장 아이콘">
																			</section>
																			
																			<section class="info_section2">
																				<div class="section_title">
																					프립소개
																				</div>
																				<div class="fripInfo">
																					${dto.getClass_cont() }
																				</div>
																			</section>
																			
																			<section class="info_section2">
																				<div class="section_title">
																					포함 사항
																				</div>
																				<div class="fripInfo">
																					${dto.getClass_include() }
																				</div>
																			</section>
																			
																			<section class="info_section2">
																				<div class="section_title">
																					불포함 사항
																				</div>
																				<div class="fripInfo">
																					${dto.getClass_exclude() }
																				</div>
																			</section>
																			
																			<section class="info_section2">
																				<div class="section_title">
																					세부일정
																				</div>
																				<div class="fripInfo">
																					${dto.getClass_plan() }
																				</div>
																			</section>
																			
																			<section class="info_section2">
																				<div class="section_title">
																					유의 사항
																				</div>
																				<div class="fripInfo">
																					<p class="notice">* 프립에서 구매하시지 않는 경우, 환불 거부, 서비스 불이행 등의 문제가 생길 수 있습니다.</p>
																					${dto.getClass_notice() }
																				</div>
																			</section>
																			
																			<section class="info_section2">
																				<div class="section_title">
																					진행 장소
																				</div>
																				<div class="fripInfo">
																					${dto.getClass_endArea() }
																				</div>
																			</section>
																		</div>
																	</div>
																</div>
															</div>
														</div><!-- 프립 소개 end -->
													</div>
													<div class="modal-footer" style="display: block;">
														<button type="submit" class="btn btn-primary">승인처리</button>
													</div>
												  </form>
												  
											  </div>
											</div>
										 </div>
									  </div>  <!-- Modal end -->
							       </td>
							    </tr>
							  </tbody>
							</c:forEach>
						  </c:if>
						</table>
					</div>  <!-- 승인 대기  end -->
					
					<!-- 승인 완료 -->
					<div class="pass_box">
						<div class="pass_box_title">
							프립승인 완료
							<span class="pass_count">${finish_count } 건</span>
						</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">프립No</th>
						      <th scope="col">프립명</th>
						      <th scope="col">1차 카테고리</th>
						      <th scope="col">2차 카테고리</th>
						      <th scope="col">승인일자</th>
						      <th scope="col">상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  
						  <!-- key값 받기 -->
						  <c:set var="pass_finish" value="${fripPass_finish }" />	<!-- 프립 승인완료 목록 -->
						  <c:if test="${!empty pass_finish }">
						  	<c:forEach items="${pass_finish }" var="dto2" varStatus="status">
								  <tbody>
								    <tr>
								      <th scope="row">${status.count}</th>
								      <td>${dto2.getMem_name() }</td>
								      <td>${dto2.getClass_num() }</td>
								      <td>${dto2.getClass_title() }</td>
								      <td>${dto2.getClass_category1() }</td>
								      <td>${dto2.getClass_category2() }</td>
								      <td>${dto2.getClass_pass_regdate().substring(0, 10) }</td>
								      <c:if test="${dto2.getClass_pass() == 1}">
								      	<td>완료</td>
								      </c:if>
								      <td>
								      	<!-- Button trigger modal -->
										<button type="button" class="viewDetail_btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${dto2.getClass_num() }">상세보기</button>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal${dto2.getClass_num() }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered modal-lg">
												<div class="modal-content">
													<div>
														<div class="modal-header">
															프립 상세보기
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														
														<form action="<%=request.getContextPath() %>/admin_frip_pass_ok.do" method="post">
														  <input type="hidden" value="${dto2.getClass_num() }" name="class_num">
														  <div class="modal-body">
															<!-- 프립을 소개해 주세요 -->
															<div class="Main_line_hidden" id="final">
																<div class="Main_line_1">
																	<div class="final_confirm">
																		<div class="final_confirm_frame">
																			<div class="confirm_img_box">
																				<!-- 사진 수정필요(클래스 사진) -->
																				<img alt="${dto2.getClass_image() }" src="<%=request.getContextPath() %>/resources/image/like/${dto2.getClass_image() }" name="confirm_img" class="confirm_img">
																			</div>
																			<div class="final_frip_info">
																				<section class="info_section">
																					<div class="info_title" id="fripTitle">
																						${dto2.getClass_title() }
																					</div>
																					<div class="info_price">
																						<span class="salePrice">34% </span> 123,456원
																					</div>
																				</section>
																				<section class="info_section1">
																					<div class="info_hostInfo">
																						<!-- 사진 수정필요(호스트=유저 사진) -->
																						<img width="56px" height="56px" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${dto2.getMem_profileImg() }" >
																						<div class="info_hostInfo_text">
																							<div>${dto2.getMem_name() } ></div>
																						<div class="count_example">프립 14 | 후기 14 | 저장 342</div>
																					</div>
																					</div>
																					
																					<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='none' viewBox='0 0 32 32'%3E %3Cpath fill='%23F4F4F4' stroke='%23CCC' stroke-width='1.5' d='M15.043 19.962l-.029.02-.026.021-7.571 6.384V5.827c0-1.273 1.155-2.41 2.73-2.41h11.706c1.569 0 2.73 1.138 2.73 2.41v20.56l-7.572-6.384-.026-.022-.028-.02c-.292-.203-.634-.293-.957-.293-.324 0-.666.09-.957.294z'/%3E %3C/svg%3E" alt="상품 저장 아이콘">
																				</section>
																				
																				<section class="info_section2">
																					<div class="section_title">
																						프립소개
																					</div>
																					<div class="fripInfo">
																						${dto2.getClass_cont() }
																					</div>
																				</section>
																				
																				<section class="info_section2">
																					<div class="section_title">
																						포함 사항
																					</div>
																					<div class="fripInfo">
																						${dto2.getClass_include() }
																					</div>
																				</section>
																				
																				<section class="info_section2">
																					<div class="section_title">
																						불포함 사항
																					</div>
																					<div class="fripInfo">
																						${dto2.getClass_exclude() }
																					</div>
																				</section>
																				
																				<section class="info_section2">
																					<div class="section_title">
																						세부일정
																					</div>
																					<div class="fripInfo">
																						${dto2.getClass_plan() }
																					</div>
																				</section>
																				
																				<section class="info_section2">
																					<div class="section_title">
																						유의 사항
																					</div>
																					<div class="fripInfo">
																						<p class="notice">* 프립에서 구매하시지 않는 경우, 환불 거부, 서비스 불이행 등의 문제가 생길 수 있습니다.</p>
																						${dto2.getClass_notice() }
																					</div>
																				</section>
																				
																				<section class="info_section2">
																					<div class="section_title">
																						진행 장소
																					</div>
																					<div class="fripInfo">
																						${dto2.getClass_endArea() }
																					</div>
																				</section>
																			</div>
																		</div>
																	</div>
																</div>
															</div><!-- 프립 소개 end -->
														</div>
														<div class="modal-footer" style="display: block;">
															<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
														</div>
													  </form>
													  
													</div>
												</div>
											 </div>
										  </div>  <!-- Modal end -->
								      </td>
								    </tr>
								  </tbody>
							 </c:forEach>
						   </c:if>
						</table>
					</div> <!-- 승인 완료  end -->
				</div>
				
			</div>
		</div>
		
	<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
	
</body>
</html>