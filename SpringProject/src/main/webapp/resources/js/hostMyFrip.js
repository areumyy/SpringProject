function ing() {
	$.ajax({
	    type : "post",
	    url : '/controller/.do', 
	    data : {"cate_one":val},
	    dataType: 'json',
	    error : function(error) {
	    	console.log("error");
	    },
	    success : function(data) {
	    	
	    }
	}); 
}