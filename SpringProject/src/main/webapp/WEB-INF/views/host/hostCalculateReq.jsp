<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>host 정산요청</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/hostCalculateReq.css" rel="stylesheet" />
</head>
<script type="text/javascript">
function calReq(target){
	$.ajax({
        type : "post",
        url : '/controller/cal_req', 
        data : {"target": target},
        dataType: 'json',
        error : function(error) {
            console.log("error");
        },
        success : function(data) {
            var res = data.res;
            
            if(res == 1) { // 정산 신청 성공
            	$("#btn" + target).removeClass('btn-primary');
            	$("#btn" + target).addClass('btn-secondary');
            	$("#btn" + target).attr('disabled','disabled');
            	$("#btn" + target).text('정산 요청중');
            } else { // 실패
            	$("#btn" + target).css("color", "black");
            }
        }
    });
}

function changeType() {
	var type= $("#type").val();
	window.location.href="<%=request.getContextPath() %>/hostCalculateReq.do?type=" + type;
}

$(function(){
	var typeValue = "<%=request.getAttribute("type") %>";
	
	$("#type").val(typeValue).attr('selected', 'selected');
})
</script>
<body>
	<div class="mainFrame">
		<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>

		<div class="Frame">
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>

				<div class="Main">
					
					<div class="cal_page">
							<div class="cal_header">
								<h2 class="cal_title">정산 요청</h2>
								<div style="width: 190px;">
									<select class="form-select form-select-lg mb-3 cal_select" id="type" onchange="changeType();">
										<option value="total">전체</option>
										<option value="before">정산 요청 전</option>
										<option value="ing">정산 요청 완료</option>
										<option value="after">정산 완료</option>
									</select>
								</div>
							</div>
							<div class="cal_body">
								<div class="cal_cate">
									<div>프립 진행일</div>
									<div>프립명</div>
									<div>구매</div>
									<div>참석</div>
									<div>불참</div>
									<div>매출</div>
									<div>수수료</div>
									<div>실 정산 금액</div>
									<div>상태</div>
								</div>
								<c:if test="${!empty list }">
									<c:forEach items="${list }" var="dto">
										<div class="cal_item">
											<div>${dto.getCal_startDate().substring(0,10) }</div>
											<div class="item_title"><p>${dto.getCal_name() }</p></div>
											<div>${dto.getCal_buyCount() }</div>
											<div>${dto.getCal_enterCount() }</div>
											<div>${dto.getCal_enterNoCount() }</div>
											<div>${dto.getCal_sal() }</div>
											<div>${dto.getCal_sal() * 0.1 }</div>
											<div>${dto.getCal_total() }</div>
											<div>
												<c:if test="${dto.getCal_status() == 3 }">
													<button class="btn btn-primary" onclick="calReq(${dto.getCal_classNum()})" id="btn${dto.getCal_classNum() }">정산 요청</button>
												</c:if>
												<c:if test="${dto.getCal_status() == 1 }">
													<button class="btn btn-secondary" disabled>정산 요청중</button>
												</c:if>
												<c:if test="${dto.getCal_status() == 2 }">
													<button class="btn btn-success" disabled>정산 완료</button>
												</c:if>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${empty list}">
									<div class="cal_item">
											<h3>종료된 프립이 없습니다.</h3>
										</div>
								</c:if>
							</div>
							<nav aria-label="Page navigation example" class="list_footer">
								<ul class="pagination">
									<c:if test="${Paging.getPage() > Paging.getBlock() }">
										<li class="page-item">
											<a class="page_link" href="hostCalculateReq.do?type=${type }">
												<span aria-hidden="true">&laquo;</span>
											</a>
											<a class="page_link" href="hostCalculateReq.do?type=${type }&page=${Paging.getPage() - 1 }">	
												<span aria-hidden="true">&lt;</span>
											</a>
										</li>
									</c:if>
									<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
										<c:if test="${i == Paging.getPage() }">
											<li class="page-item"><a class="page_link paging_active">${i }</a></li>
										</c:if>
										<c:if test="${i != Paging.getPage() }">
											<li class="page-item"><a class="page_link" href="hostCalculateReq.do?type=${type }&page=${i }">${i }</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
										<li class="page-item">
											<a class="page_link" href="hostCalculateReq.do?type=${type }&page=${Paging.getPage() + 1 }">	
												<span aria-hidden="true">&gt;</span>
											</a>
											<a class="page_link" href="hostCalculateReq.do?type=${type }&page=${Paging.getAllPage() }">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:if>
								</ul>
							</nav>
						</div>
				</div>
			</div>

		</div>

		<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
</body>
</html>