<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>    
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/communityMsg.css">
</head>
<body>
        <div class="modal hidden">
            <div class="modal_overlay"></div>
            <div class="modal_body">
                <div class="modal_header">
                    <img src="/resources/images/exclamation.png" alt="">
                </div>
                <br><br>
                <div class="modal_content">${requestScope.msg }</div>
                <br>
                <div class="modal_footer">
                <button><a href="${requestScope.view }">확인</a></button>
                </div>
            </div>
        </div>
    <script>
        const openButton = $("#open");
        const modal = $(".modal:first");
        const overlay = $(".modal_overlay:first");
        const modalContent = $(".modal_content:first");
        
        const alertMsg = "당일예약만 이용 가능합니다."+ "<br>" + "예약 진행하시겠습니까?";
        const close = "예약이 마감되었습니다."+ "<br>" + "익일부터 예약 가능합니다.";
        const fail = "타 지역 식당은 예약 할 수 없습니다.";

        if(true){
            modalContent.html(alertMsg);
        }
        
        const closeBtn = $(".modal_footer>button:first");
        
        overlay.click(function(){
            modal.addClass("hidden");
        })
        
        closeBtn.click(function(){
            modal.addClass("hidden");
        });
        
        openButton.click(function(){
            modal.removeClass("hidden");  
        });
    </script>    
</body>
</html>