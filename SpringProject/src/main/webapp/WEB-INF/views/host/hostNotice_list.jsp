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
	
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/hostNotice_list.css" rel="stylesheet" />
</head>
<body>

	<div class="mainFrame">
	<jsp:include page="../hostInclude/hostMenuBar.jsp"></jsp:include>
	
		<div class="Frame"> 
			<div class="Frame_Frame">
				<jsp:include page="../hostInclude/hostSideBar.jsp"></jsp:include>
	
				<div class="Main">
				
					<div class="notice_page">
						<div class="notice_header">
							<h2 class="notice_title">공지사항</h2>
						</div>
						<div class="notice_body">
							
							<div class="accordion" id="accordionExample">
								<ul class="notice_list">
									<li>
										<div class="notice_list_item">
											<div class="notice_item_title collapsed" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse1" data-bs-parent="#accordionExample" style="">
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
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse2" data-bs-parent="#accordionExample">
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
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse3" data-bs-parent="#accordionExample">
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
											<div class="notice_item_title" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="true">6월 6일(일) 고객센터 단축 운영 안내</div>
											<div class="notice_item_regdate">2021-05-31 10:34</div>
										</div>
										<div class="notice_list_item_ans accordion-collapse collapse" id="collapse4" data-bs-parent="#accordionExample">
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
		
	<jsp:include page="../hostInclude/hostFooter.jsp"></jsp:include>
	</div>
	
</body>
</html>