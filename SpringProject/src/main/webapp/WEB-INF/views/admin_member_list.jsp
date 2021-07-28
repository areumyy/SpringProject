<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/admin_member_list.css" rel="stylesheet" />
</head>
<script type="text/javascript">
$(function(){
	<% 
		String sort = (String)request.getAttribute("sort");
		if(sort.equals("total")){
	%>
	$("#sort_total").addClass('active');
	<% } else if(sort.equals("host")) { %>
	$("#sort_host").addClass('active');
	<% } else if(sort.equals("member")){ %>
	$("#sort_member").addClass('active');
	<%} else if(sort.equals("out")){%>
	$("#sort_out").addClass('active');
	<%} %>
	}
);

function checkAll(){
	$("input[name=check]").prop("checked", $("#checkAll").prop("checked"));
};

function checkDel(){
	var cnt = $("input:checkbox[name=check]:checked").length;
	if(cnt == 0){
		alert("선택된 회원이 없습니다.");
		return false;
	} else {
		var res = confirm("회원탈퇴를 진행하시겠습니까?");
		if(res) {
			return true;
		} else {
			return false;
		}
	}
}
</script>
<body>

	<div class="mainFrame">
		<jsp:include page="../include/adminMenuBar.jsp"></jsp:include>

		<div class="Frame">
			<div class="Frame_Frame">
				<jsp:include page="../include/adminSideBar.jsp"></jsp:include>
				<div class="Main">
				
					<div class="member_page">
						<div class="member_header">
							<h2 class="member_title">회원조회</h2>
						</div>
						<div class="member_cate">
							<div>
								<a href="<%=request.getContextPath() %>/admin_member_list.do?sort=total" id="sort_total" class="cate_item">전체</a>
								<a href="<%=request.getContextPath() %>/admin_member_list.do?sort=host" id="sort_host" class="cate_item">호스트</a>
								<a href="<%=request.getContextPath() %>/admin_member_list.do?sort=member" id="sort_member" class="cate_item">회원</a>
								<a href="<%=request.getContextPath() %>/admin_member_list.do?sort=out" id="sort_out" class="cate_item">탈퇴</a>
							</div>
							<div class="search_section">
								<form class="search_form" method="post" action="<%=request.getContextPath() %>/admin_member_search.do">
									<input type="hidden" name="sort" value="${sort }">
									<select class="form-select search_select" aria-label="Default select example" name="field">
										<option value="total" selected>전체</option>
										<option value="email">아이디(이메일)</option>
										<option value="name">이름</option>
										<option value="nick">닉네임</option>
										<option value="phone">핸드폰 번호</option>
									</select>
									<input class="search_input" type="search" placeholder="검색어" name="keyword">
									<button class="btn btn-primary" type="submit">검색</button>
								</form>
							</div>
						</div>
						<div class="member_body">
							<div class="search_cate">
								<div>회원번호</div>
								<div>아이디(이메일)</div>
								<div>닉네임</div>
								<div>이름</div>
								<div>가입일</div>
								<div>상태</div>
								<div><input type="checkbox" onclick="checkAll()" name="checkAll" id="checkAll"></div>
							</div>
							<form method="post" action="<%=request.getContextPath() %>/admin_member_del.do" onsubmit="return checkDel();">
								<input type="hidden" name="sort" value="${sort }">
								<input type="hidden" name="page" value="${Paging.getPage() }">
								<c:if test="${!empty list }">
									<c:forEach items="${list }" var="dto">
										<div class="search_item">
											<div>${dto.getMem_num() }</div>
											<div>${dto.getMem_email() }</div>
											<div class="nick">
												<span class="profile_section">
													<c:choose>
														<c:when test="${dto.getMem_profileimg() == null}">
															<img class="profile_img" src="<%=request.getContextPath() %>/resources/image/mypage/profile/profile_no_img.png">
														</c:when>
														<c:otherwise>
															<img class="profile_img" src="<%=request.getContextPath() %>/resources/image/mypage/profile/${dto.getMem_profileimg()}">
														</c:otherwise>
													</c:choose>
												</span>	
												<span>${dto.getMem_nick() }</span>
											</div>
											<div>${dto.getMem_name() }</div>
											<div>${dto.getMem_regdate().substring(0,10) }</div>
											<div>
												<c:if test="${dto.getMem_status() == 2}">
													<span class="badge_host">호스트</span>
												</c:if>
												<c:if test="${dto.getMem_status() == 1}">
													<span class="badge_member">회원</span>
												</c:if>
												<c:if test="${dto.getMem_status() == 3}">
													<span class="badge_default">탈퇴</span>
												</c:if>
											</div>
											<div>
												<c:if test="${dto.getMem_status() != 3 }">
													<input type="checkbox" name="check" value="${dto.getMem_num() }">
												</c:if>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<button type="submit" class="btn btn-outline-primary pull-right delete_btn">강제탈퇴</button>
							</form>
						</div>
					</div>
					<nav aria-label="Page navigation example" class="list_footer">
						<ul class="pagination">
							<c:if test="${Paging.getPage() > Paging.getBlock() }">
								<li class="page-item">
									<a class="page_link" href="admin_member_list.do?page=1&sort=${sort }">
										<span aria-hidden="true">&laquo;</span>
									</a>
									<a class="page_link" href="admin_member_list.do?page=${Paging.getPage() - 1 }&sort=${sort}">	
										<span aria-hidden="true">&lt;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${Paging.getStartBlock() }" end="${Paging.getEndBlock() }" var="i">
								<c:if test="${i == Paging.getPage() }">
									<li class="page-item"><a class="page_link paging_active">${i }</a></li>
								</c:if>
								<c:if test="${i != Paging.getPage() }">
									<li class="page-item"><a class="page_link" href="admin_member_list.do?page=${i }&sort=${sort}">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
								<li class="page-item">
									<a class="page_link" href="admin_member_list.do?page=${Paging.getPage() + 1 }&sort=${sort}">	
										<span aria-hidden="true">&gt;</span>
									</a>
									<a class="page_link" href="admin_member_list.do?page=${Paging.getAllPage() }&sort=${sort}">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
				<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>