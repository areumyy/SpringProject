<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="<%=request.getContextPath()%>/resources/css/admin.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/admin_notice.css" rel="stylesheet" />
</head>
<body>

	<div class="mainFrame">
		<jsp:include page="../include/adminMenuBar.jsp"></jsp:include>

		<div class="Frame">
			<div class="Frame_Frame">
				<jsp:include page="../include/adminSideBar.jsp"></jsp:include>
				<div class="Main">
				
					<div class="notice_page">
						<div class="notice_header">
							<h2 class="notice_title">공지사항 관리</h2>
							<div>
								<input type="button" class="btn btn-primary" value="공지사항 등록">
							</div>
						</div>
						<div class="notice_cate">
							<a href="#" class="cate_item active">전체</a>
							<a href="#" class="cate_item">호스트</a>
							<a href="#" class="cate_item">회원</a>
						</div>
						<div class="notice_body">
							
							<div class="accordion" id="accordionExample">
								<ul class="notice_list">
									<li>
										<div class="notice_list_item">
											<div class="badge_host">호스트</div>
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse5" data-bs-parent="#accordionExample">
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
										<div class="notice_list_item">
											<div class="badge_member">회원</div>
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse6" data-bs-parent="#accordionExample">
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
										<div class="notice_list_item">
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse7" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse7" data-bs-parent="#accordionExample">
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
										<div class="notice_list_item">
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse8" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse8" data-bs-parent="#accordionExample">
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
										<div class="notice_list_item">
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse9" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse9" data-bs-parent="#accordionExample">
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
										<div class="notice_list_item">
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse10" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse10" data-bs-parent="#accordionExample">
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
							
						</div>
					</div>
				
				</div>
			</div>
		</div>
				<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>