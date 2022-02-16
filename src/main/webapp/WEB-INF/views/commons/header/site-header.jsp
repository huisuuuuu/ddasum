<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
   href="/resources/commons/site-header.css">
<title>따숨, 마음을 나누다.</title>
</head>
<body>
    <div id="header">
       <div id="logo">
           <a href="/"><img id="logoImg" src="/resources/images/ddasum_header_logo.png"></a>
       </div> 
        <div id="navigation">
            <ul id="gnb_list">
                <li><a href="/member/storyBoard.do">스토리</a></li>
                <li><a href="/spRestaurant/spRestaurantList.do">후원식당</a></li>
                <li><a href="/dcRestaurant/dcRestaurantList.do">할인식당</a></li>
                <li><a href="/community/communityList.do">커뮤니티</a></li>
                <li id="customercenter"><a href="/board/noticeBoard.do">고객센터</a>
                <div id="submenu"><a href="/board/noticeBoard.do">공지사항</a>&nbsp;&nbsp;&nbsp;<a href="/board/faqBoard.do">자주 묻는 질문</a></div>
                </li>
            </ul>
        </div>
        <div id="member">
        <c:choose>
           <c:when test="${sessionScope.member != null}">
              <span id="join"><a href="/member/logout.do">로그아웃</a></span>
              <c:choose>
              	<c:when test="${sessionScope.member.userId eq 'ADMIN' }">
               <span id="login"><a href="/admin/adminMain.do">${sessionScope.member.nick }님</a></span>
               </c:when>
               <c:otherwise>
               <span id="login">${sessionScope.member.nick }님</span>
               <div id="mypage_submenu">
                  <div id="mypage">
                  <img src="/resources/images/user.png"><a href="/member/myPage.do">마이페이지</a>
                  </div>
                  <div id="reservation">
                  <img src="/resources/images/reception-bell.png"><a href="/member/reservationPage.do">예약 내역 확인</a>
                  </div>
               </div>
               </c:otherwise>
              </c:choose> 
           </c:when>
           <c:when test="${sessionScope.bizMember != null}">
              <span id="join"><a href="/member/logout.do">로그아웃</a></span>
               <span id="login"><a href="/member/bizMemberLoginPage.do">${sessionScope.bizMember.bizName }님</a></span>
           </c:when>
           <c:otherwise>
               <span id="join"><a href="/member/joinPage.do">회원가입</a></span>
               <span id="login"><a href="/member/loginPage.do">로그인</a></span>
            </c:otherwise>
        </c:choose>    
        </div>
    </div>
    
    <script>
        $('#customercenter').hover(function() {
            $('#submenu').css("display", "block");

        }, function() {
            $('#submenu').css("display", "none");
        });
        
        $('#login').hover(function() {
            $('#mypage_submenu').css("display", "block");
            $('#login').css("cursor", "pointer");

        }, function() {
            $('#mypage_submenu').css("display", "none");
        });
        
        $('#mypage_submenu').hover(function() {
            $(this).css("display", "block");
        }, function() {
            $(this).css("display", "none");
        });
    </script>
</body>
</html>