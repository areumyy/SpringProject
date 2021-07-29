<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_정산 승인</title>

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
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/admin_cal_pass.css" rel="stylesheet" />
<script language="javascript">
	document.title = "관리자 정산 승인" ;
</script>
<link rel="shortcut icon" type="image/x-icon" 
	href="<%=request.getContextPath()%>/resources/logo/titlelogo.png">
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
							정산승인 대기
							<span class="pass_count">${wait_count } 건</span>
						</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">프립No</th>
						      <th scope="col">진행일자</th>
						      <th scope="col">프립명</th>
						      <th scope="col">매출</th>
						      <th scope="col">수수료</th>
						      <th scope="col">실 정산 금액</th>
						      <th scope="col">신청일자</th>
						      <th scope="col">상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  
						  <!-- key값 받기 -->
				  		  <c:set var="pass_wait" value="${calPass_wait }" />		<!-- 정산 승인대기 목록 -->
				  		  <c:set var="wait_host" value="${wait_host }" />			<!-- 승인대기 호스트 -->
						  <c:if test="${!empty pass_wait }">
						  	<c:forEach items="${pass_wait }" var="dto" varStatus="status">
							  <tbody>
							    <tr>
							      <th scope="row">${status.count}</th>
							      <c:forEach items="${wait_host }" var="host">
								      <c:if test="${dto.getCal_classNum() == host.getClass_num() }">
								      	<td>${host.getMem_name() }</td>
								      </c:if>
							      </c:forEach>
							      <td>${dto.getCal_classNum() }</td>
							      <td>
							      	<!-- 시작날짜 = 끝날짜  -->
							      	<c:if test="${dto.getCal_startDate() eq dto.getCal_endDate() }">
								      	${dto.getCal_startDate().substring(0, 10) }
								    </c:if>
							      	<!-- 시작날짜 != 끝날짜  -->
							      	<c:if test="${dto.getCal_startDate() ne dto.getCal_endDate() }">
								      	${dto.getCal_startDate().substring(0, 10) } ~ ${dto.getCal_endDate().substring(0, 10) }
								    </c:if>
							      </td>
							      <td>${dto.getCal_name() }</td>
							      <td><fmt:formatNumber value="${dto.getCal_sal() }" /></td>
							      <td><fmt:formatNumber value="${dto.getCal_sal() * 0.1 }" pattern="###,###" /></td>
							      <td><fmt:formatNumber value="${dto.getCal_total() }" /></td>
							      <td>${dto.getCal_regdate().substring(0, 10) }</td>
							      <c:if test="${dto.getCal_status() == 1}">
							      	<td>대기</td>
							      </c:if>
							      <td>
							      	<!-- Button trigger modal -->
									<button type="button" class="viewDetail_btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${dto.getCal_classNum() }">상세보기</button>
									<!-- Modal -->
									<div class="modal fade" id="exampleModal${dto.getCal_classNum() }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<div>
													<div class="modal-header">
														정산 상세보기
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													
													<form action="<%=request.getContextPath() %>/admin_cal_pass_ok.do" method="post">
													  	<input type="hidden" value="${dto.getCal_classNum() }" name="class_num">
														<div class="modal-body">
															<!-- 프립을 소개해 주세요 -->
															<div class="cal_modal">
																<div class="section01">
																	<!-- (클래스 사진) -->
																	<div><img alt="${wait_host[status.index].getClass_image() }" src="<%=request.getContextPath() %>/resources/upload/${wait_host[status.index].getClass_image() }" class="frip_img"></div>
																	<div class="frip_info">
																		<div>
																			<div class="frip_no">Class No.${dto.getCal_classNum() }</div>
																			<div class="frip_title">${dto.getCal_name() }</div>
																		</div>
																		<span class="frip_period">
																			<!-- 시작날짜 = 끝날짜  -->
																	      	<c:if test="${dto.getCal_startDate() eq dto.getCal_endDate() }">
																		      	${dto.getCal_startDate().substring(0, 10) }
																		    </c:if>
																	      	<!-- 시작날짜 != 끝날짜  -->
																	      	<c:if test="${dto.getCal_startDate() ne dto.getCal_endDate() }">
																		      	${dto.getCal_startDate().substring(0, 10) } ~ ${dto.getCal_endDate().substring(0, 10) }
																		    </c:if>
																      	</span>
																	</div>
																</div>
																<div class="section02">
																	<div class="cal_info_box">
																		<p class="cal_title">매출</p>
																		<p class="cal_price"><fmt:formatNumber value="${dto.getCal_sal() }" /> 원</p>
																	</div>
																	<div class="cal_info_box">
																		<p class="cal_title">수수료</p>
																		<p class="cal_price"><fmt:formatNumber value="${dto.getCal_sal() * 0.1 }" pattern="###,###" /> 원</p>
																	</div>
																	<div class="cal_info_box">
																		<p class="cal_title">실 정산금액</p>
																		<p class="cal_price"><fmt:formatNumber value="${dto.getCal_total() }" /> 원</p>
																	</div>
																</div>
																<div class="section03">
																	<div class="final_cal"><fmt:formatNumber value="${dto.getCal_total() }" /> 원</div>
																</div>
															</div>
															<!-- 프립 소개 end -->
														</div>
														<div class="modal-footer" style="display: block;">
															<button type="submit" class="btn btn-primary">승인처리</button>
														</div>
												 	 </form>
													
											    </div>
										     </div>
									     </div>
									  </div>	<!-- Modal end -->
							        </td>
							     </tr>
							   </tbody>
							</c:forEach>
						  </c:if>
						</table>
					</div> <!-- 승인 대기 end -->
					
					<!-- 승인 완료 -->
					<div class="pass_box">
						<div class="pass_box_title">
							정산승인 완료
							<span class="pass_count">${finish_count } 건</span>
						</div>
						<table class="table table-hover">
						  <thead class="table_title">
						    <tr>
						      <th scope="col">No</th>
						      <th scope="col">호스트 이름</th>
						      <th scope="col">프립No</th>
						      <th scope="col">진행일자</th>
						      <th scope="col">프립명</th>
						      <th scope="col">매출</th>
						      <th scope="col">수수료</th>
						      <th scope="col">실 정산 금액</th>
						      <th scope="col">승인일자</th>
						      <th scope="col">상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  
						  <!-- key값 받기 -->
				  		  <c:set var="pass_finish" value="${calPass_finish }" />		<!-- 정산 승인대기 목록 -->
				  		  <c:set var="finish_host" value="${finish_host }" />			<!-- 승인대기 호스트 -->
						  <c:if test="${!empty pass_finish }">
						  	<c:forEach items="${pass_finish }" var="dto2" varStatus="status">
							  <tbody>
							    <tr>
							      <th scope="row">${status.count}</th>
							      <c:forEach items="${finish_host }" var="host">
								      <c:if test="${dto2.getCal_classNum() == host.getClass_num() }">
								      	<td>${host.getMem_name() }</td>
								      </c:if>
							      </c:forEach>
							      <td>${dto2.getCal_classNum() }</td>
							      <td>
							      	<!-- 시작날짜 = 끝날짜  -->
							      	<c:if test="${dto2.getCal_startDate() eq dto2.getCal_endDate() }">
								      	${dto2.getCal_startDate().substring(0, 10) }
								    </c:if>
							      	<!-- 시작날짜 != 끝날짜  -->
							      	<c:if test="${dto2.getCal_startDate() ne dto2.getCal_endDate() }">
								      	${dto2.getCal_startDate().substring(0, 10) } ~ ${dto2.getCal_endDate().substring(0, 10) }
								    </c:if>
							      </td>
							      <td>${dto2.getCal_name() }</td>
							      <td><fmt:formatNumber value="${dto2.getCal_sal() }" /></td>
							      <td><fmt:formatNumber value="${dto2.getCal_sal() * 0.1 }" pattern="###,###" /></td>
							      <td><fmt:formatNumber value="${dto2.getCal_total() }" /></td>
							      <td>${dto2.getCal_okDate().substring(0, 10) }</td>
							      <c:if test="${dto2.getCal_status() == 2}">
							      	<td>완료</td>
							      </c:if>
							      <td>
							      	<!-- Button trigger modal -->
									<button type="button" class="viewDetail_btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${dto2.getCal_classNum() }">상세보기</button>
									<!-- Modal -->
									<div class="modal fade" id="exampleModal${dto2.getCal_classNum() }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<div>
													<div class="modal-header">
														정산 상세보기
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
	
														<!-- 프립을 소개해 주세요 -->
														<div class="cal_modal">
															<div class="section01">
																<!-- (클래스 사진) -->
																<div><img alt="${finish_host[status.index].getClass_image() }" src="<%=request.getContextPath() %>/resources/upload/${finish_host[status.index].getClass_image() }" class="frip_img"></div>
																<div class="frip_info">
																	<div>
																		<div class="frip_no">Class No.${dto2.getCal_classNum() }</div>
																		<div class="frip_title">${dto2.getCal_name() }</div>
																	</div>
																	<span class="frip_period">
																		<!-- 시작날짜 = 끝날짜  -->
																      	<c:if test="${dto2.getCal_startDate() eq dto2.getCal_endDate() }">
																	      	${dto.getCal_startDate().substring(0, 10) }
																	    </c:if>
																      	<!-- 시작날짜 != 끝날짜  -->
																      	<c:if test="${dto2.getCal_startDate() ne dto2.getCal_endDate() }">
																	      	${dto2.getCal_startDate().substring(0, 10) } ~ ${dto2.getCal_endDate().substring(0, 10) }
																	    </c:if>
															      	</span>
																</div>
															</div>
															<div class="section02">
																<div class="cal_info_box">
																	<p class="cal_title">매출</p>
																	<p class="cal_price"><fmt:formatNumber value="${dto2.getCal_sal() }" /> 원</p>
																</div>
																<div class="cal_info_box">
																	<p class="cal_title">수수료</p>
																	<p class="cal_price"><fmt:formatNumber value="${dto2.getCal_sal() * 0.1 }" pattern="###,###" /> 원</p>
																</div>
																<div class="cal_info_box">
																	<p class="cal_title">실 정산금액</p>
																	<p class="cal_price"><fmt:formatNumber value="${dto2.getCal_total() }" /> 원</p>
																</div>
															</div>
															<div class="section03">
																<div class="final_cal"><fmt:formatNumber value="${dto2.getCal_total() }" /> 원</div>
															</div>
														</div>
														<!-- 프립 소개 end -->
													</div>
													<div class="modal-footer" style="display: block;">
														<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
							      </td>
							    </tr>
							  </tbody>
							</c:forEach>
						  </c:if>
						</table>
					</div> <!-- 승인 완료 end -->
				</div>
				
			</div>	
		</div>
		
	<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
	
</body>
</html>