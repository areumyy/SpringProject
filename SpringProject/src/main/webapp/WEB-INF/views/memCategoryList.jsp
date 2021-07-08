<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>memCategoryList</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<script src="${path}/resources/js/test.js"></script>

<style type="text/css">

element.style {
}

element.style {
    opacity: 1;
    display: block;
}

element.style {
    display: block;
}

element.style {
    height: 0px;
    position: relative;
    width: 100%;
    padding-top: 100%;
}

element.style {
    height: 100%;
    left: 0px;
    position: absolute;
    top: 0px;
    width: 100%;
}

a {
    color: inherit;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}

a, area, button, input, label, select, textarea, [tabindex] {
    -ms-touch-action: manipulation;
    touch-action: manipulation;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
}

* {
    outline: none;
    outline-color: initial;
    outline-style: none;
    outline-width: initial;
    font-family: inherit;
}

*, ::before, ::after {
    background-repeat: no-repeat;
    box-sizing: inherit;
}

div {
    display: block;
}


/* --------------------------------------------------------------- */

body.fontLoaded {
    font-family: "UI Frip", "Noto Sans KR", Helvetica, Arial, sans-serif;
}

body {
    font-family: "UI Frip", "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.article {
    display: flex;
    flex-flow: column nowrap;
    align-content: flex-start;
    margin: 0px auto;
    max-width: 808px;
    width: 100%;
    padding: 0px 20px;
    min-height: 1px;
}

.Category_Nav {
    width: auto;
    height: auto;
    transition: opacity 200ms ease-in-out 0s;
    display: none;
    opacity: 0;
    min-width: 0px;
    min-height: 1px;
}

.small_Category {
    box-sizing: content-box;
    padding-bottom: 20px;
    font-size: 12px;
    overflow: auto hidden;
    white-space: nowrap;
}

.small_Category > * {
    margin-right: 20px;
}

.Category_Filter {
    display: flex;
    padding-top: 5px;
    padding-bottom: 40px;
    overflow-x: auto;
    white-space: nowrap;
}

.Category_Filter > * {
    margin-right: 16px;
}

.FilterDate {
    display: flex;
}

.FilterButton {
    display: flex;
    position: relative;
    -webkit-box-align: center;
    align-items: center;
}

.Filter_btn {
    width: auto;
    height: auto;
    line-height: 14px;
    padding: 11px 20px;
    background-color: transparent;
    text-align: center;
    cursor: pointer;
    border: 1px solid rgb(238, 238, 238);
    border-radius: 5px;
    color: initial;
    font-size: 14px;
    font-weight: 500;
}

.FilterLocation {
    display: inline;
    position: relative;
}



</style>

</head>
<body>

	<div id="app">
		<div class="main">
		
			<%-- <jsp:include page="../include/side.jsp" /> --%>
			<div class="article">
				<div class="Category_Nav" style="opacity: 1; display: block;">
					<h2>쿠킹</h2>
				</div>
				
				<div>
					<!-- 소분류 -->
					<div class="small_Category">
						<a href="" style="font-weight: bold; color: rgb(51, 151, 255);">전체</a>
						<a href="">요리</a>
						<a href="">음료</a>
						<a href="">베이킹</a>
					</div>
				</div>
				
				<div>
					<!-- 필터 -->
					<div class="Category_Filter">
						<div class="FilterDate">
							<div class="FilterButton">
								<button height="auto" color="initial" font-size="14px"
									font-weight="500" class="Filter_btn">언제</button>
							</div>
						</div>
						<div class="FilterLocation">
							<div class="FilterButton">
								<button height="auto" color="initial" font-size="14px"
									font-weight="500" class="Filter_btn">어디서</button>
							</div>
						</div>
						<div>
							<div class="FilterButton">
								<button height="auto" color="initial" font-size="14px"
									font-weight="500" class="Filter_btn">누구와</button>
							</div>
						</div>
						<div class="FilterOthers">
							<div class="FilterButton">
								<button height="auto" color="initial" font-size="14px"
									font-weight="500" class="Filter_btn">필터</button>
							</div>
						</div>
					</div>
					<div>
						<!-- 카테고리 리스트 메인부분 -->
						<div class="Main_Article"
							style="opacity: 1; display: block;">
							<div>
								<!-- 인기 쿠킹 -->
								<div>
								
								
								</div>
							</div>
							
							
						</div>
					</div>
				
				
				
				
				
				
				</div>
			</div>
			
			
			
			<%-- <jsp:include page="../include/fo.jsp" /> --%>
		</div>
	</div>
	
</body>
</html>
