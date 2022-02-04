$(document).ready(function(){
//Admin 네비게이션 토글
    $(".mdl_nav>li").click(function() {
    	
    	if($(this).next(".sub_nav").css("display")=="none"){
    		$(this).next(".sub_nav").slideDown(250);
    		$(this).find(".fa-chevron-down").css("transform","rotate(0deg)");
    		
    		$(".sub_nav").not($(this).next(".sub_nav")).slideUp(250);
			$(".fa-chevron-down").not($(this).find(".fa-chevron-down")).css("transform","rotate(-90deg)");
    	}else {
    		$(this).next(".sub_nav").slideUp(250);
    		$(this).find(".fa-chevron-down").css("transform","rotate(-90deg)");
    	}

    });
    
});