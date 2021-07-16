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
<link href="<%=request.getContextPath()%>/resources/css/hostExam.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/admin_member_list.css" rel="stylesheet" />
</head>
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
								<a href="#" class="cate_item active">전체</a>
								<a href="#" class="cate_item">호스트</a>
								<a href="#" class="cate_item">회원</a>
								<a href="#" class="cate_item">탈퇴</a>
							</div>
							<div class="search_section">
								<select class="form-select search_select" aria-label="Default select example">
									<option value="" selected>전체</option>
									<option value="">이름</option>
									<option value="">닉네임</option>
									<option value="">핸드폰 번호</option>
								</select>
								<form class="search_form">
									<input class="search_input" type="search" placeholder="검색어">
									<button class="btn btn-primary" type="submit">검색</button>
								</form>
							</div>
						</div>
						<div class="member_body">
							<div class="search_cate">
								<div>회원번호</div>
								<div>아이디(이메일)</div>
								<div>닉네임</div>
								<div>핸드폰 번호</div>
								<div>가입일</div>
								<div>상태</div>
								<div><input type="checkbox"></div>
							</div>
							<form>
								<div class="search_item">
									<div>3</div>
									<div>sd02052@nate.com</div>
									<div class="nick">
										<span class="profile_section">
											<img class="profile_img" src="<%=request.getContextPath() %>/resources/image/mypage/profile/nana.jpg">
										</span>	
										<span>성욱성욱성욱성욱</span>
									</div>
									<div>010-2484-0902</div>
									<div>2021-02-02</div>
									<div><span class="badge_host">호스트</span></div>
									<div><input type="checkbox"></div>
								</div>
								<div class="search_item">
									<div>2</div>
									<div>sd02052@nate.com</div>
									<div class="nick">
										<span class="profile_section">
											<img class="profile_img" src="<%=request.getContextPath() %>/resources/image/mypage/profile/nana.jpg">
										</span>	
										<span>성욱성욱</span>
									</div>
									<div>010-2484-0902</div>
									<div>2021-02-02</div>
									<div><span class="badge_member">회원</span></div>
									<div><input type="checkbox"></div>
								</div>
								<div class="search_item">
									<div>1</div>
									<div>sd02052@nate.com</div>
									<div class="nick">
										<span class="profile_section">
											<img class="profile_img" src="<%=request.getContextPath() %>/resources/image/mypage/profile/nana.jpg">
										</span>	
										<span>성욱성욱</span>
									</div>
									<div>010-2484-0902</div>
									<div>2021-02-02</div>
									<div><span class="badge_default">탈퇴</span></div>
									<div><input type="checkbox"></div>
								</div>
								<button type="submit" class="btn btn-outline-primary pull-right delete_btn">강제탈퇴</button>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
				<jsp:include page="../include/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>