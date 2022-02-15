<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨, 마음을 나누다</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/commons/main-header.css">
<link rel="stylesheet" href="/resources/commons/main-footer.css">
</head>

<body>
	<div id=header>
       <div id="header-logo-area">
           <a href="/"><img id="header-logo-img" src="/resources/images/ddasum_header_logo.png"></a>
        </div>
       <div id="header-meun-area">
           <ul id="header-menu-ul">
               <li><a href="/member/storyBoard.do">스토리</a></li>
               <li><a href="/spRestaurant/spRestaurantList.do">후원식당</a></li>
               <li><a href="/dcRestaurant/dcRestaurantList.do">할인식당</a></li>
               <li><a href="/community/communityList.do">커뮤니티</a></li>
               <li id="notice-button">
                   <a href="">고객센터</a>
                   <div id="hover-menu1" style="display: none">
                   <a class="hover-text1" href="/board/noticeBoard.do">공지사항</a> &nbsp;&nbsp; <a class="hover-text1" href="/board/faqBoard.do">자주 묻는 질문</a></div>
               </li>
           </ul>
       </div>
       
       <div id="header-login-area">
	       <c:choose>
				<c:when test="${sessionScope.member != null }">
           			<div id="header-myPage-hover-text"><a href="">${sessionScope.member.userId } 님</a>
		               <div id="hover-menu2" style="display: none">
			               <div id="myPage-img-area">
				               <img src="/resources/images/user.png" style="width: 18px; padding-right: 5px">
				               <a class="hover-text2" href="/member/myPage.do">마이페이지</a>
			               </div>
			               <div id="resolvation-check-img-area">
				               <img src="/resources/images/reception-bell.png" style="width: 18px; padding-right: 5px">
				               <a class="hover-text2" href="/member/reservationPage.do">예약 내역 확인</a>
			               </div>
            		   </div>
           			</div>
            		<div id="header-logout-text"><a href="/member/logout.do">로그아웃</a></div>
				</c:when>
				<c:otherwise>
		           <a class="header-login-text" href="/member/loginPage.do">로그인</a> &nbsp;&nbsp;&nbsp;&nbsp; 
		           <a class="header-login-text" href="/member/joinPage.do">회원가입</a>
	           	</c:otherwise>
	       </c:choose>
       </div>
   </div>
   
   
   <img id="header-img" src="/resources/images/mainpageimg.jpg">
   
   
   <div id=content>
       <div class="content-side-back"></div>
       <div id="content-center">
           <div id="content-center-empty-top-area"></div>
           <a href="/spRestaurant/spRestaurantList.do"><div id="content-center-menu1">
               <span>베스트</span><br><br>
               <span>후원식당</span><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu1.png" >
           </div></a>
           <a href="/dcRestaurant/dcRestaurantList.do"><div id="content-center-menu2">
               <span>베스트</span><br><br>
               <span>할인식당</span><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu2.png" >
           </div></a>
           <a href="/member/reservationPage.do"><div id="content-center-menu3">
               <span>예약 확인</span><br><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu3.png" >
           </div></a>
           <a href="/community/communityList.do"><div id="content-center-menu4">
               <span>혼밥시러</span><br><br>
               <span>커뮤니티</span><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu4.png" >
           </div></a>
           <div id="content-center-company-count">
              <br>
               <span>현재</span><br><br>
               <a id="company-count" href="">100</a><span> 여개의 업체가</span><br><br>
               <span>"따뜻한 숨결"을 불어넣고 있습니다.</span><br><br>
               <img src="/resources/images/center-menu5.png" style="width: 250px;">
           </div>
           <div id="content-center-empty-center-area"></div>
           <div id="content-center-noti-area1"> 
               <div class="noti"><span class="noti-top-title">공지사항</span> </div> <div class="plus-button-area"><a href="/board/noticeBoard.do"><img class="noti-plus-button" src="/resources/images/plusbutton.png"></a></div>
               <hr>
               <c:choose>
	               <c:when test="${!requestScope.list1.isEmpty() }">
		               <div class="noti-title">
		               <ul >
		                   <c:forEach items="${requestScope.list1}" var="n" >
		                   	
		                   		<li><a href="/board/noticeDetail.do?iNo=${n.iNo }">${n.iTitle}</a></li>
		                   	
		                   </c:forEach>
		               </ul>
		               </div>
		               <div class="noti-sysdate">
		                   <ul>
		                   <c:forEach items="${requestScope.list1}" var="n" >
		                       <li>${n.iRegdate }</li>
		                    </c:forEach>
		                   </ul>
		               </div>
	               </c:when> 
	               <c:otherwise>
	               	<div class="noti-title">

		                  <h3>공지사항이 없습니다.</h3>
		              
		             </div>
	               </c:otherwise>
	            </c:choose>
           </div>
           <div id="content-center-noti-area2">
               <div class="noti"><span class="noti-top-title">자주 묻는 질문</span> </div> <div class="plus-button-area"><a href="/board/faqBoard.do"><img class="noti-plus-button" src="/resources/images/plusbutton.png"></a></div>
               <hr>
               <c:choose>
	               <c:when test="${!requestScope.list2.isEmpty() }">
		               <div class="noti-title">
		                   <ul>
		                   
		                   <c:forEach items="${requestScope.list2}" var="f">
		                  	 
		                     <li><a href="">${f.iTitle } </a></li>
		                        
		                    </c:forEach>
		                   
		                   </ul>
		               </div>
		               <div class="noti-sysdate">
		                   <ul>
		                   <c:forEach items="${requestScope.list2}" var="f">
		                       <li>${f.iRegdate }</li>
		         
		                    </c:forEach>
		                   </ul>
		               </div>
		           	</c:when> 
		       </c:choose>
           </div>
           
            <div id="content-center-empty-bottom-area"></div>
       </div>
       <div class="content-side-back"></div>
   </div>
   
      
      
      
    <div id=footer>
       <div id="footer-img-area">
           <img id="footer-img" src="/resources/images/ddasum_footer_logo.png">
       </div>
       <div id="footer-text-area">
          <div id="footer-text">
            <p>07212 서울특별시 영등포구 선유동2로 57 이레빌딩 TEL : 02-1544-9970</p>
            <p>COPYRIGHT ⓒ 나눠조. ALL RIGHTS RESERVED.</p>
          </div>
       </div>
   </div>
   
   
   <script>
	   $('#notice-button').hover(function(){
	       $('#hover-menu1').css("display","block");   
	   }, function() {
	       $('#hover-menu1').css("display","none");
	   });
	   
	  
	   $('#header-myPage-hover-text').hover(function(){
	       $('#hover-menu2').css("display","block");    
	   }, function() {
	       $('#hover-menu2').css("display","none");
	   });
       
       $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll > 1300) {
          $('#header').css("background-color" , "rgba(166,166,166,0.8)");
        }
        else{
          $('#header').css("background-color" , "rgba(166,166,166,0.2)");   
        }
      });
       
       
       
    </script>

</body>
</html>