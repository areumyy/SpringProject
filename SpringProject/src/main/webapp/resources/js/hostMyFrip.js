$(document).ready(function() {
	//$("#btnradio1").trigger("click");
});


function getClassList(class_pass, state) { // 승인 상태 번호를 넘겨받음
	$.ajax({
	    type : "post",
	    url : '/controller/hostClassList.do', 
	    data : {"class_pass":class_pass},
	    dataType: 'json',
	    error : function(error) {
	    	console.log("error");
	    },
	    success : function(data) {
	    	var clist = data.clist;
	    	$(".class_group").empty();
	    	if(clist[0]==null) {
	    		$(".class_group").append(state+"인 클래스가 없습니다.");
	    	}else {
	    		for(var i=0; i<clist.length; i++) {
	    			
	    			$(".class_group").append
	    				("<div class='class_item'>" +
	    				"<div class='class_item_div'>" +
	    				"<div class='class_item_thumbnail'>" +
	    				"<div class='class_item_top'>" +
	    				"<span class='class_area'>"+clist[i].class_endArea.substring(0,2)+"</span>" +
						"</div>" +
						"<div class='class_item_image'>" +
						"<img class='class_img' src='/controller/resources/upload/"+clist[i].class_image+"' height='150px'>" +
						"</div></div>" +
						"<div class='class_item_hash'>"+clist[i].class_hash+"</div>" +
						"<div class='class_item_title'><p class='main-block-desc'>"+clist[i].class_title+"</p></div>" +
						"<div class='class_item_state'>상태 <span class='state_text'>"+state+"</span></div>" +
						"<div class='class_Button_div1'>" +
						"<a href='/controller/hostUpdateFrip.do?class_num="+clist[i].class_num+"'>수정</a></div></div></div>");
	    		}
	    		
	    	}
	    	
	    	
	    }
	}); 
}