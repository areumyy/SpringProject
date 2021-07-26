//시작함수
$(document).ready(function() {
	//썸머노트
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: 500,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '프립을 소개해주세요',	//placeholder 설정
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			//toolbar end
			
			//이미지 관련 메서드
			 callbacks : { 
	            	onImageUpload : function(files, editor, welEditable) {
	            // 파일 업로드(다중업로드를 위해 반복문 사용)
	            for (var i = files.length - 1; i >= 0; i--) {
	            uploadSummernoteImageFile(files[i],
	            this);
	            		}
	            	}
	            }
	});//썸머노트 end
});
//써머노트에 이미지 업로드하는 메서드
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			//setTimeout(function() { $(el).summernote('editor.insertImage', data.url) }, 4000);
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}

//이전 버튼
function prevSelect() {
	if($("[value=a1]").attr("id").substring(8) != 1) {
		var num = $("[value=a1]").prev().prev().attr("id").substring(8);
		$("#btnradio"+num).trigger("click");
	} 
 }
//다음 버튼
function nextSelect() {
	var num = $("[value=a1]").next().next().attr("id").substring(8);
	$("#btnradio"+num).trigger("click");
}
// 보이는 화면을 바꾸는 메서드 
function change_div(i){
	
	$(".Main_line").attr("class", "Main_line_hidden");
	$("#main_"+i).attr("class", "Main_line");

	
	
	//입력한 정보 가져오기
	var fripInfo = $("[name=class_title]").val();
	var include = $("[name=class_include]").val();
	var exclude  = $("[name=class_exclude]").val();
	var plan = $("[name=class_plan]").val();
	var end_area = $("[name=class_endArea2]").val();
	var endArea_detail = $("[name=class_endAreaDetail]").val();
	var fripcont = $("#summernote").val();
	// 정보칸 비워주기
	$("#fripInfo").empty();
	$("#fripTitle").empty();
	$("#include").empty();
	$("#exclude").empty();
	$("#plan").empty();
	$("#location").empty();
	// 입력한 정보 최종 확인 칸에 넣어주기
	$("#fripInfo").append(fripcont);
	$("#fripTitle").append("<p style='white-space: pre-line;'>"+fripInfo+"</p>");
	$("#include").append("<p style='white-space: pre-line;'>"+include+"</p>");
	$("#exclude").append("<p style='white-space: pre-line;'>"+exclude+"</p>");
	$("#plan").append("<p style='white-space: pre-line;'>"+plan+"</p>");
	$("#location").append("<p style='white-space: pre-line;'>"+end_area+" "+endArea_detail+"</p>");
	$("[name=class_endArea]").val(end_area);
	
	//최종 확인에서 이미지 크기 수정해주기
	$(".confirm_img").find("img").css("width", "100%");
	$("#fripInfo").find("img").css("width", "100%");
	
	//클래스 바꿔주기
	$("[value=a1]").val("a2");
	$("#btnradio"+i).val("a1");
	
	//히든값바꿔주기
	var qt = $(".optionText").length/2
	$(".optionQtt").val(qt);
	
	if(i == 11 && $(".submitButton").length == 0) {
		$(".nextButton").remove();
		$("form").append("<input type='submit' class='btn btn-primary submitButton' value='제출'>");
	}else if($(".submitButton").length != 0) {
		$(".submitButton").remove();
		$("form").append("<input type='button' value='다음' class='btn btn-primary nextButton' onclick='nextSelect()'>");
	}
}

// 카테고리 1에따라 2를 바꾸는 메서드
function change_cate_two() {
	var val = $(".selectBox").val();

	if(val.length != 0) {
		$.ajax({
		    type : "post",
		    url : '/controller/cate_two.do', 
		    data : {"cate_one":val},
		    dataType: 'json',
		    error : function(error) {
		    	console.log("error");
		    },
		    success : function(data) {
		    	var clist = data.clist;
				var select = $("[name=class_category2]");
				select.empty();
				select.append("<option value=''>::: 선택 :::</option>");
				
				for(var i=0; i<clist.length; i++) {
					select.append("<option value='"+clist[i].cate_two+"'>"+clist[i].cate_two+"</option>")
				}
		    }
		}); 
	}
	
}

//옵션추가하기 버튼 눌렀을 때 함수
function addOption() {
	var Qtt = ($(".optionText").length/2)+1;
	
	$(".optionTextDiv").append
		("<div class='"+Qtt+"'><input type='text' class='optionText' value='참가비 (1인)' " +
				"name='option_name"+Qtt+"'> <div class='deleteButton' " +
				"name='"+Qtt+"' onclick='deleteOption(this)'>삭제</div>" +
				"<br>" +
				"<input type='text' class='optionText'" +
				"value='5000' name='option_price"+Qtt+"' placeholder='가격'>" +
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
			$("[name=option_name"+i+"]").attr("name", "option_name"+(i-1));
			$("[name="+i+"]").attr("name", i-1);
			$("[name=option_price"+i+"]").attr("name", "option_price"+(i-1));
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

//유효성 검사 및 제출 확인 (유효성 추가해야됨)
function checkIt() {
	if(confirm('제출하시겠습니까?')){
		
		if($(".selectBox").eq(0).val().length == 0 
				&& $(".selectBox").eq(1).val().length == 0) { // 카테고리
			alert("카테고리를 확인해 주세요!");
			$("#btnradio1").trigger("click");
			return false;
		}else if($("[name=class_hash]").val().length==0 || $("#nowByte1").text() > 20) { // 프립명
			alert("캐치프레이즈를 확인해 주세요!");
			$("#btnradio2").trigger("click");
			return false;			
		}else if($("[name=class_title]").val().length==0 || $("#nowByte2").text() > 20) { // 프립명
			alert("프립명을 확인해 주세요!");
			$("#btnradio2").trigger("click");
			return false;			
		}else if($("#upload").val().length==0) { // 이미지
			alert("대표이미지를 업로드해 주세요!");
			$("#btnradio3").trigger("click");
			return false;			
		}else if($("[name=option_startDate]").val().length == 0) { // 진행일
			alert("시작일을 확인해 주세요!");
			$("#btnradio4").trigger("click");
			return false;
		}else if($(".optionNumber").val().length == 0) { // 인원 및 (옵션)
			alert("인원수를 입력해주세요!");
			$("#btnradio5").trigger("click");
			return false;
		}else if($(".optionNumber").val() <= 0) { // 인원 및 (옵션)
			alert("최소 인원수는 1명입니다!");
			$("#btnradio5").trigger("click");
			return false;
		}else if($("#address").val().length == 0 
					|| $(".detailAddress").val().length == 0) {
			alert("프립 진행지를 확인해주세요");
			$("#btnradio6").trigger("click");
			return false;
		}else if($("[name=class_plan]").val().length == 0 || $("#nowByte7").text() > 500) {
			alert("상세 일정을 확인해 주세요");
			$("#btnradio7").trigger("click");
			return false;
		}else if($("[name=class_include]").val().length==0 || $("#nowByte3").text() > 500) {
			alert("포함사항을 확인해 주세요");
			$("#btnradio8").trigger("click");
			return false;
		}else if($("[name=class_exclude]").val().length==0 || $("#nowByte4").text() > 500) {
			alert("불포함사항을 확인해 주세요");
			$("#btnradio8").trigger("click");
			return false;
		}else if($("#nowByte5").text() > 500 || $("#nowByte6").text() > 500) {
			alert("준비물과 유의사항 글자수를 확인해주세요");
			$("#btnradio9").trigger("click");
			return false;
		}else if($("#summernote").val().length==0) {
			alert("프립 소개를 확인해 주세요");
			$("#btnradio10").trigger("click");
			return false;
		}else if(true) { // (인원) 및 옵션
			var index = $(".optionText").length/2;
			
			for(var i=0; i<index; i++) {
				if($(".optionText").eq((2*i)).val().length == 0
						|| $(".optionText").eq((2*i)+1).val().length == 0){
					alert("모든 옵션의 이름과 가격을 확인해주세요!");
					$("#btnradio5").trigger("click");
					return false;
				}
			}
		}
	}else {
		console.log($(".optionText").eq(0).val().length == 0 
				|| $(".optionText").eq(1).val().length == 0);
		return false;
	}
}

function fn_checkByte(obj ,mb, id){
    var maxByte = mb; //최대 1000바이트
    var text_val = obj.value; //입력한 문자
    var text_len = text_val.length; //입력한 문자수
    
    var totalByte=0;
    for(let i=0; i<text_len; i++){
    	var each_char = text_val.charAt(i);
        var uni_char = escape(each_char); //유니코드 형식으로 변환
        if(uni_char.length>4){
        	// 한글 : 2Byte
            totalByte += 1;
        }else{
        	// 영문,숫자,특수문자 : 1Byte
            totalByte += 1;
        }
    }
    
    if(totalByte>maxByte){
    	alert('최대 '+mb+'Byte까지만 입력가능합니다.');
        	document.getElementById("nowByte"+id).innerText = totalByte;
            document.getElementById("nowByte"+id).style.color = "red";
        }else{
        	document.getElementById("nowByte"+id).innerText = totalByte;
            document.getElementById("nowByte"+id).style.color = "green";
        }
    }
