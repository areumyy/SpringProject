<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="<%=request.getContextPath() %>/resources/css/qna_list.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
</head>
<body>

	<div id="app">
		<div class="main">
			<jsp:include page="../include/menu.jsp" />
			<div class="article">

				<div class="qna_list_page">
					<h1 class="qna_list_title">자주 묻는 질문</h1>
					<form class="qna_search_form">
						<img src="<%=request.getContextPath() %>/resources/image/menu/search.svg" class="qna_search_img">
						<input type="text" placeholder="키워드를 입력하세요" value="">
					</form>
					<div class="qna_category">
						<span class="qna_category_item_select">전체</span>
						<span class="qna_category_item">이용안내</span>
						<span class="qna_category_item">회원정보</span>
						<span class="qna_category_item">결제/환불</span>
						<span class="qna_category_item">쿠폰/에너지</span>
						<span class="qna_category_item">호스트신청</span>
						<span class="qna_category_item">기타</span>
					</div>
					<div class="accordion" id="accordionExample">
					<ul class="qna_list">
						<li>
							<div class="qna_list_item" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true">프립(Frip)이란?</div>
							<div class="qna_list_item_ans accordion-collapse collapse" id="collapse1" data-bs-parent="#accordionExample">
								<p>프립은 호스트가 진행합니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 프립을 통해 다양한 액티비티 프로그램을 진행하는 진행자입니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 본인만이 가지고 있는 컨텐츠가 있다면 누구나 신청이 가능합니다.</p>
							</div>
						</li>
						<li>
							<div class="qna_list_item" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="true">진행 예정인 프립 보는 방법</div>
							<div class="qna_list_item_ans accordion-collapse collapse" id="collapse2" data-bs-parent="#accordionExample">
								<p>프립은 호스트가 진행합니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 프립을 통해 다양한 액티비티 프로그램을 진행하는 진행자입니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 본인만이 가지고 있는 컨텐츠가 있다면 누구나 신청이 가능합니다.</p>
							</div>
						</li>
						<li>
							<div class="qna_list_item" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="true">프립에 회원가입 하는 방법</div>
							<div class="qna_list_item_ans accordion-collapse collapse" id="collapse3" data-bs-parent="#accordionExample">
								<p>프립은 호스트가 진행합니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 프립을 통해 다양한 액티비티 프로그램을 진행하는 진행자입니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 본인만이 가지고 있는 컨텐츠가 있다면 누구나 신청이 가능합니다.</p>
							</div>	
						</li>
						<li>
							<div class="qna_list_item" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="true">프립 신청 방법</div>
							<div class="qna_list_item_ans accordion-collapse collapse" id="collapse4" data-bs-parent="#accordionExample">
								<p>프립은 호스트가 진행합니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 프립을 통해 다양한 액티비티 프로그램을 진행하는 진행자입니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 본인만이 가지고 있는 컨텐츠가 있다면 누구나 신청이 가능합니다.</p>
							</div>
						</li>
						<li>
							<div class="qna_list_item" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="true">프립은 누가 진행하나요?</div>
							<div class="qna_list_item_ans accordion-collapse collapse" id="collapse5" data-bs-parent="#accordionExample">
								<p>프립은 호스트가 진행합니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 프립을 통해 다양한 액티비티 프로그램을 진행하는 진행자입니다.</p>
								<p>
									<br>
								</p>
								<p>프립 호스트는 본인만이 가지고 있는 컨텐츠가 있다면 누구나 신청이 가능합니다.</p>
							</div>
						</li>
					</ul>
					</div>
					<!-- <footer class="qna_list_footer">
						<div class="pagination_prev_group">
							<button class="pagination_prev_item">
								<img
									src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='%23FFF' fill-opacity='0' fill-rule='nonzero' d='M0 0h40v40H0z'/%3E %3Cpath stroke='%23DDD' stroke-width='1.5' d='M16 16l4 4-4 4M21 16l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E"
									class="pagination_prev_item_img">
							</button>
							<button class="pagination_prev_item">
								<img
									src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath fill='none' d='M0 0h40v40H0z'/%3E %3Cpath stroke='%23DDD' stroke-width='1.5' d='M18 16l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E"
									class="pagination_prev_item_img">
							</button>
						</div>
						<button class="pagination_btn_select">1</button>
						<button class="pagination_btn">2</button>
						<button class="pagination_btn">3</button>
						<button class="pagination_btn">4</button>
						<button class="pagination_btn">5</button>
						<button class="pagination_btn">6</button>
						<button class="pagination_btn">7</button>
						<button class="pagination_btn">8</button>
						<button class="pagination_btn">9</button>
						<button class="pagination_btn">10</button>
						
						<div class="pagination_next_group">
							<button class="pagination_next_item">
								<img
									src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M18 0H0v18h18z'/%3E %3Cpath stroke='%23000' stroke-width='1.5' d='M7 5l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E"
									>
							</button>
							<button class="pagination_next_item"">
								<img
									src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Crect width='40' height='40' fill='%23FFF' fill-opacity='0' fill-rule='nonzero' rx='20'/%3E %3Cg stroke='%23000' stroke-width='1.5'%3E %3Cpath d='M16 16l4 4-4 4M21 16l4 4-4 4'/%3E %3C/g%3E %3C/g%3E %3C/svg%3E"
									>
							</button>
						</div>
					</footer> -->
					<nav aria-label="Page navigation example" class="qna_list_footer">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous" style="color: black;"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item active"><a class="page-link" href="#" style="color: white;">1</a></li>
							<li class="page-item"><a class="page-link" href="#" style="color: black;">2</a></li>
							<li class="page-item"><a class="page-link" href="#" style="color: black;">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next" style="color: black;"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>


			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>