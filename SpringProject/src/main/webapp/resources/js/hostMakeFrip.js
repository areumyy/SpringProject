//이전 버튼
function prevSelect() {
 		if($(".Main_line").attr("id") == "first"){
 			return;
 		}else if($(".nextButton").length == 0) {
 			$(".submitButton").remove();
 			$("form").append("<input type='button' value='다음' class='btn btn-primary nextButton' onclick='nextSelect()'>");
 			
 			var nextNode = $(".Main_line").prev();
			$(".Main_line").attr("class", "Main_line_hidden");
			nextNode.attr("class", "Main_line");
 		}else {
	 		var nextNode = $(".Main_line").prev();
			$(".Main_line").attr("class", "Main_line_hidden");
			nextNode.attr("class", "Main_line");
 		}
 	}
//다음 버튼
function nextSelect() {
	if($(".Main_line").attr("id") == "last"){
		$(".nextButton").remove();
		var nextNode = $(".Main_line").next();
		$(".Main_line").attr("class", "Main_line_hidden");
		nextNode.attr("class", "Main_line");
		$("form").append("<input type='submit' class='btn btn-primary submitButton' value='제출'>");
		
		var fripInfo = $("[name=fripTitle]").val();
		var include = $("[name=include]").val();
		var exclude  = $("[name=exclude]").val();
		var plan = $("[name=plan]").val();
		var end_area = $("[name=endArea]").val();
		var endArea_detail = $("[name=endArea_detail]").val();
		
		$("#fripTitle").text(fripInfo);
		$("#include").text(include);
		$("#exclude").text(exclude);
		$("#plan").text(plan);
		$("#location").text(end_area +""+endArea_detail);
	}else {
		var nextNode = $(".Main_line").next();
		$(".Main_line").attr("class", "Main_line_hidden");
		nextNode.attr("class", "Main_line");

	}
}

//옵션추가하기 버튼 눌렀을 때 함수
function addOption() {
	var Qtt = parseInt($(".optionQtt").val())+1;
	$(".optionTextDiv").append
		("<div class='"+Qtt+"'><input type='text' class='optionText' value='참가비 (1인)' " +
				"name='option"+Qtt+"'> <div class='deleteButton' " +
				"name='"+Qtt+"' onclick='deleteOption(this)'>삭제</div>" +
				"<br>" +
				"<input type='text' class='optionText'" +
				"value='5000' name='price"+Qtt+"' placeholder='가격'>" +
				"<span>원</span>" +
				"<hr width='80%'></div>");
	$(".optionQtt").val(Qtt);
}

//옵션 삭제버튼 눌렀을 때 함수
function deleteOption(obj) {
	var su = $(obj).attr("name");
	$("."+su).remove();
	var Qtt = parseInt($(".optionQtt").val());
	$(".optionQtt").val(Qtt-1);
	
	for(var i=su; i<=Qtt; i++) {
		if($("."+i).length != 0) {
			$("."+i).attr("class", i-1);
			$("[name=option"+i+"]").attr("name", "option"+(i-1));
			$("[name="+i+"]").attr("name", i-1);
			$("[name=price"+i+"]").attr("name", "price"+(i-1));
		}
	}
}

// 내장소 버튼을 눌렀을 때 이벤트
function myLocationButton() {
	$(".findAddress").attr("disabled", false);
	$(".detailAddress").attr("disabled", false);
	$(".detailAddress2").attr("disabled", false);
	$(".address").attr("placeholder", '기본주소');
	$(".detailAddress").attr("placeholder", '상세주소');
}

// 온라인 버튼을 눌렀을 때 이벤트
function onlineButton() {
	$(".findAddress").attr("disabled", true);
	$(".detailAddress").attr("disabled", true);
	$(".detailAddress2").attr("disabled", true);
	$(".address").attr("placeholder", '온라인 프립');
	$(".detailAddress").attr("placeholder", '');
}
		

//프립 진행지 API
function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            console.log(addr);
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("Location").value = extraAddr;
            
            } else {
                //document.getElementById("Location").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

//집결지에서 주소찾기버튼
function findAddr2() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("Location").value = extraAddr;
            
            } else {
                //document.getElementById("Location").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("address2").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress2").focus();
        }
    }).open();
}

//네이버 에디터
$(document).ready(function() {
	var oEditors=[];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder:"naverEditor",
		sSkinURI:"./resources/smartEditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams : 	{ 
			bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseModeChanger : false, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
			//aAdditionalFontList : aAdditionalFontSet, // 추가 글꼴 목록 
			/*fOnBeforeUnload : function() { 
				alert("완료!"); 
				} */
			}, //boolean 
			
			fOnAppLoad : function() { 
				// Editor 에 값 셋팅 
				oEditors.getById["naverEditor"].exec("PASTE_HTML", [""]); 
			}, 
				
	});
});

//유효성 검사 및 제출 확인 (유효성 추가해야됨)
function checkIt() {

	if(confirm('제출하시겠습니까?')){
		return true;
	}else {
		alert("실패");
		return false;
	}
}
