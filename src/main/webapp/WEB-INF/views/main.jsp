<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨, 마음을 나누다</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/commons/main-header.css">
<link rel="stylesheet" href="/resources/commons/main-footer.css">
</head>

<body>
	<div id=header>
       <div id="header-logo-area">
           <a href=""><img id="header-logo-img" src="/resources/images/ddasum_header_logo.png"></a>
        </div>
       <div id="header-meun-area">
           <ul id="header-menu-ul">
               <li><a href="">스토리</a></li>
               <li><a href="">후원식당</a></li>
               <li><a href="">할인식당</a></li>
               <li><a href="">커뮤니티</a></li>
               <li id="notice-button"><a href="">고객센터</a>
                   <div id="hover-menu" style="display: none">
                   <a class="hover-text" href="">공지사항</a> &nbsp;&nbsp; <a class="hover-text" href="">자주 묻는 질문</a></div>
               </li>
           </ul>           
       </div>
       <div id="header-login-area">
	       <c:choose>
				<c:when test="">
					
				</c:when>
				<c:otherwise>
		           <a class="header-login-text" href="/member/loginPage.do">로그인</a> &nbsp;&nbsp;<a class="header-login-text">/</a>&nbsp;&nbsp; 
		           <a class="header-login-text" href="/member/joinPage">회원가입</a>
	           	</c:otherwise>
	       </c:choose>
       </div>
   </div>
   
   
   <img id="header-img" src="/resources/images/mainpageimg.jpg">
   
   
   <div id=content>
       <div class="content-side-back"></div>
       <div id="content-center">
           <div id="content-center-empty-top-area"></div>
           <a href=""><div id="content-center-menu1">
               <span>베스트</span><br><br>
               <span>후원식당</span><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu1.png" >
           </div></a>
           <a href=""><div id="content-center-menu2">
               <span>베스트</span><br><br>
               <span>할인식당</span><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu2.png" >
           </div></a>
           <a href=""><div id="content-center-menu3">
               <span>예약 확인</span><br><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu3.png" >
           </div></a>
           <a href=""><div id="content-center-menu4">
               <span>혼밥시러</span><br><br>
               <span>커뮤니티</span><br><br>
               <img class="center-menu-img" src="/resources/images/center-menu4.png" >
           </div></a>
           <div id="content-center-company-count">
              <br>
               <span>현재</span><br><br>
               <a id="company-count" href="">100</a><span> 여개의 업체가</span><br><br>
               <span>"따뜻한 숨결"을 불어넣고 있습니다.</span><br><br>
               <img src="/resources/images/center-menu5.png" style="width: 180px;">
           </div>
           <div id="content-center-empty-center-area"></div>
           <div id="content-center-noti-area1">
               <div class="noti"><span class="noti-top-title">공지사항</span> </div> <div class="plus-button-area"><a href=""><img class="noti-plus-button" src="/resources/images/plusbutton.png"></a></div>
               <hr>
               <div class="noti-title">
                   <ul >
                       <li><a href="">꿈나무 카드 인증안내</a></li>
                       <li><a href="">사업자 등록증 인증 안내</a></li>
                       <li><a href="">후원 증빙 내역 다운로드 안내</a></li>
                       <li><a href="">2021년 배스트 후원 업체 선정</a></li>
                       <li><a href="">인증 횟수 만료 회원 재인증 관련안내</a></li>
                   </ul>
               </div>
               <div class="noti-sysdate">
                   <ul>
                       <li>2022.01.29</li>
                       <li>2022.01.27</li>
                       <li>2022.01.23</li>
                       <li>2022.01.22</li>
                       <li>2022.01.21</li>
                   </ul>
               </div>
           </div>
           <div id="content-center-noti-area2">
               <div class="noti"><span class="noti-top-title">자주 묻는 질문</span> </div> <div class="plus-button-area"><a href=""><img class="noti-plus-button" src="/resources/images/plusbutton.png"></a></div>
               <hr>
               <div class="noti-title">
                   <ul >
                       <li><a href="">꿈나무 카드 인증안내</a></li>
                       <li><a href="">사업자 등록증 인증 안내</a></li>
                       <li><a href="">후원 증빙 내역 다운로드 안내</a></li>
                       <li><a href="">2021년 배스트 후원 업체 선정</a></li>
                       <li><a href="">인증 횟수 만료 회원 재인증 관련안내</a></li>
                   </ul>
               </div>
               <div class="noti-sysdate">
                   <ul>
                       <li>2022.01.29</li>
                       <li>2022.01.27</li>
                       <li>2022.01.23</li>
                       <li>2022.01.22</li>
                       <li>2022.01.21</li>
                   </ul>
               </div>
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
            $('#hover-menu').css("display","block");
            
        }, function() {
        $('#hover-menu').css("display","none");


        });
       
       $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll > 900) {
          $('#header').css("background-color" , "rgba(166,166,166,0.8)");
        }
        else{
          $('#header').css("background-color" , "rgba(166,166,166,0.2)");   
        }
      });
    </script>

</body>
</html>