<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="<%=request.getContextPath() %>/resources/css/option_select.css" rel="stylesheet"/>
<script>
	function Option(index) {
		var title = $("#a"+index).find(".option_item_date").text();
		var optionPrice = $("#optionPrice"+index).val();
		var option_num = $("#option_num"+index).val();
		
		if($("#b"+index).length == 0) {
			$(".sel_section").remove();
			$("form").prepend
			("<div id='b"+index+"' class='sel_section'>"+
			 "<div class='sel_div'><button class='option_btn sel_cancle_btn'" +
			 "type='button' onclick='deleteOption("+index+")'>" +
			 "<i class='fa fa-times' aria-hidden='true' class='option_img'></i>"+
			 "</button><div class='sel_name'><div>2021년 7월 17일(토요일) 06:50</div>"+
			 "<div class='sel_title'>"+title+"</div></div>"+
			 "<div class='price_ctn_section'><div class='sel_price'>"+optionPrice+"</div>"+
			 "</div></div></div></div>");
			$("[name=option_num]").val(option_num);
		}else {
			return;
		}
		
	}
	
	function deleteOption(index) {
		$("#b"+index).remove();
	}
	
	function plusSu(index) {
		var su = Number($("#n"+index).val()) +1;
		$("#n"+index).val(su);
		$("#minusIcon").attr("class", "far fa-minus-square");
	}
	
	function minusSu(index){
		console.log($("#n"+index).val());
		if($("#n"+index).val() != 1) {
			var su = Number($("#n"+index).val()) -1;
			$("#n"+index).val(su);	
			
			if($("#n"+index).val() == 2) {
				$("#minusIcon").attr("class", "far fa-minus-square gray");
			}
		}else if($("#n"+index).val() == 1) {
			return;
		}
	}
</script>
</head>
<body>

	<div id="app">
		<div class="main">
			<%-- <jsp:include page="../include/menu.jsp" /> --%>
			
			<div class="option_page1">
				<div class="option_page2">
					<div class="option_page3">
					
						<header class="option_header">
							<button class="option_btn" type="button">
								<img
									src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M12 19.071L4.929 12 12 4.929M5 12h15'/%3E %3C/g%3E %3C/svg%3E"
									class="option_img">
							</button>
						</header>

						<div id="option_body" class="option_body">
							<div class="option_sel_tile">
								옵션 선택
							</div>
							<div class="option_select_section">
								<div class="option_arcodion">
									<button class=" accordion-button collapsed arcodion_selector" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										<div class="arcodion_div">
											<div>옵션</div>
										</div>
									</button>
									<div class="option_list accordion-collapse collapse" id="collapseOne">
										<c:forEach var="dto" items="${odto }" varStatus="index">
											<div id="a${index.count}" class="option_item" onclick="Option(${index.count})">
												<c:if test="${dto.getOption_price() != dto.getOption_editPrice() }">
													<input type="hidden" value="${dto.getOption_editPrice() }" id="optionPrice${index.count }">
												</c:if>
												<c:if test="${dto.getOption_price() == dto.getOption_editPrice() }">
													<input type="hidden" value="${dto.getOption_price() }" id="optionPrice${index.count }">
												</c:if>
												<input type="hidden" value="${dto.getOption_num() }" id="option_num${index.count }">
												<div class="option_item_date">${dto.getOption_name() }</div>
												<div class="option_item_name">${bookingCount } / ${cdto.getClass_count() }명</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						
						<form method="post" action="<%=request.getContextPath() %>/payment.do">
							<input type="hidden" value="${cdto.getClass_num() }" name="class_num">
							<input type="hidden" value="" name="option_num">
							<div class="next_section">
								<button class="next_btn">다음</button>
							</div>
						</form>
					</div>
				</div>	
			</div>
			<%-- <jsp:include page="../include/footer.jsp" /> --%>
		</div>
	</div>
</body>
</html>