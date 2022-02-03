<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨, 마음을 나누다</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<style>    
    * div{
        box-sizing: border-box;
    }
    * a{
        text-decoration: none;
    }
    /*헤더*/
    #header{
        min-width: 1500px;
        width: 100%;
        height: 105px;
        position: fixed;
        background-color: rgba(166,166,166,0.2);  
    }
   
    #header-logo-area{ /*로고*/
        width: 20%;
        height: 100%;
        float: left;   
    }
    #header-logo-img{
        width: 45%;
        height: 100%;
        padding-left: 10%;        
    }
    #header-meun-area{ /*센터메뉴*/
        width: 60%;
        height: 100%;
        float: left;
        margin:0 auto;
        padding-top: 30px;
        text-align: center;    
    }
    #header-menu-ul {
        margin:  auto;
        padding: 0px;
        width: 100%;
        height: 50%;   
    }
   
    #header-menu-ul>li {
        height: 100%;
        width: 10%;
        line-height: 35px;
        display: inline-block;
        text-align: center;
    }

    #header-menu-ul>li>a {
        width: 100%;
        height: 100%;
        color: white;
        font-family: 'Noto Sans KR';
        text-decoration: none;
        font-size: 16px;
        display: block;
    }
    #header-login-area{/*로그인쪽*/
        width: 20%;
        height: 100%;
        float: left;
        text-align: center;
        padding-top: 2.5%;
        font-family: 'Noto Sans KR';
        font-size: 16px;
    }
    .header-login-text{
        width: 100%;
        height: 10%;
        color: white;
        text-decoration: none;  
    }
   
    
    #hover-menu{/*고객센터 호버시 나오는 서브메뉴*/
        width: 170px;
        background-color: black;
        border-radius: 20px;
        margin-left: -40px;
        position: absolute;
    }
    .hover-text{
        color: white;
        font-family: 'Noto Sans KR';
        font-size: 11px; 
    }
    

    
    /*배경 img*/
    #header-img{
        min-width: 1500px;
        width: 100%;
       
    
    }
    /*콘텐츠*/
    #content{
        min-width: 1500px;
        width: 100%;
    }
    .content-side-back{/*사이드 빈공간*/
        border: 1px solid white;
        width: 15%;
        float: left;
    }
    #content-center{/*중앙 컨텐츠 공간*/
        width: 70%;
        float: left;
    }
    #content-center-empty-top-area{
        width: 100%;
        height: 100px;
    }
    
    #content-center-menu1{/*center 위 컨텐츠*/
        width: 16%;
        height: 300px;
        float: left;
        background-color: #FFFCF1;
        text-align: center;
        font-family: '상주곶감체';
        padding-top: 70px;
        font-size: 20px;
        color: black;
        box-shadow: 3px 3px 5px gray;
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        
    }
    #content-center-menu2{
        width: 16%;
        height: 300px;
        float: left;
        background-color: #FFFFFF;
        text-align: center;
        font-family: '상주곶감체';
        padding-top: 70px;
        font-size: 20px;
        color: black;
        box-shadow: 3px 3px 5px gray;
        
    }
    #content-center-menu3{
        width: 16%;
        height: 300px;
        float: left;
        background-color: #FFFCF1;
        text-align: center;
        font-family: '상주곶감체';
        padding-top: 90px;
        font-size: 20px;
        color: black;
        box-shadow: 3px 3px 5px gray;
    }
    #content-center-menu4{
        width: 16%;
        height: 300px;
        float: left;
        background-color: #FFFFFF;
        text-align: center;
        font-family: '상주곶감체';
        padding-top: 70px;
        font-size: 20px;
        color: black;
        box-shadow: 3px 3px 5px gray;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
    }
    .center-menu-img{
        width: 80px;
    }
    #content-center-company-count{
        width: 33%;
        height: 300px;
        float: right;
        background-color: #FFFCF1;
        text-align: center;
        font-family: '상주곶감체';
        padding-top: 10px;
        font-size: 20px;
        color: #666666;
        box-shadow: 3px 3px 5px gray;
        border-radius: 5px;
    }
    #company-count{
        font-size: 30px;
        color: #CA2929;
        font-weight: bolder;
    }
    #content-center-empty-center-area{
        width: 100%;
        height: 100px;
        float: left;
    }
    #content-center-noti-area1{/*center 아래 컨텐츠(공지사항 관련)*/
        width: 48%;
        height: 300px;
        float: left;
        box-shadow: 3px 3px 5px gray;
        border-radius: 8px;
        
    }
    .noti {
        width: 85%;
        height: 70px; 
        padding-top: 30px;
        padding-left: 30px;
        float: left;
    }
    .noti-top-title{
        font-size: 20px;
        font-weight: bolder;
        font-family: 'Noto Sans KR';
        
    }
    .plus-button-area{
        width: 15%;
        height: 70px; 
        padding-top: 30px;
        padding-left: 30px;
        float: right;
    }
    .noti-plus-button{
        width: 15px;
        float: 
    }
    .noti-title {
        width: 70%;
        height: 70%;
        float: left;
        padding-top: 5px;
        
    }
    .noti-sysdate{
        width: 30%;
        height: 70%;
        float: left;
        padding-top: 5px;
    }
    .noti-title li{
        list-style-type : square;
        margin-bottom: 10px;
        
    }
    .noti-sysdate li{
        margin-bottom: 10px;
        list-style-type: none;
        color:#666666;
        font-family: 'Noto Sans KR';
    }
    .noti-title li a{
        color:#666666;
        font-family: 'Noto Sans KR';
        
    }
   
    hr{
        border: 0px;
        width: 430px;
        height: 2px;
        background-color: #FBEEBC;
        
    }
    #content-center-noti-area2{
        width: 48%;
        height: 300px;
        float: right;
        box-shadow: 3px 3px 5px gray;
        border-radius: 8px;
        
    }
    #content-center-empty-bottom-area{
        width: 100%;
        height: 100px;
        float: left;
    }
    
    
    /*푸터*/
    #footer{
        min-width: 1500px;
        width: 100%;
        height: 150px;
        border: 1px solid #383838;
        background-color: #383838;
        opacity: 0.8; 
        float: left;
    }
    #footer-img-area{
        width: 20%;
        height: 100%;
        float: left;
    }
    #footer-img{
        widows: 55%;
        height: 55%;
        padding-left: 35%;
        padding-top: 11%;  
    }
    #footer-text-area{
        width: 80%;
        height: 100%;
        float: left;
    }
    #footer-text{
        width: 50%;
        height: 50%;
        margin-top: 4.3%;
        color: white;
        font-family: 'Noto Sans KR';
        font-weight: lighter;
        font-size: 13px;
    }
    
   
</style>
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
           <a class="header-login-text" href="">로그인</a> &nbsp;&nbsp;<a class="header-login-text">/</a>&nbsp;&nbsp; <a class="header-login-text" href="">회원가입</a>
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
	
	<a href="/admin/adminMain.jsp">관리자</a>

</body>
</html>