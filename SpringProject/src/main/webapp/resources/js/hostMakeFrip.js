//시작함수
$(document).ready(function() {
	//썸머노트
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: 500,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
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
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
		        }
			}
          
	});//썸머노트 end
});

//파일 업로드
function sendFile(file, el) {
	var form_data = new FormData();
  	form_data.append('file', file);
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: '/controller/uploadSummernoteImageFile.do',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
      		$(el).summernote('editor.insertImage', img_name.url);
      		console.log(img_name);
      		console.log(img_name.url);
    	}
  	});
}

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
		console.log($("[name=class_title]").val());
		var fripInfo = $("[name=class_title]").val();
		var include = $("[name=class_include]").val();
		var exclude  = $("[name=class_exclude]").val();
		var plan = $("[name=class_plan]").val();
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
	var Qtt = parseInt($(".optionQtt").val())+1;
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
		return true;
	}else {
		alert("실패");
		return false;
	}
}

