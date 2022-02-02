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
<title>Insert title here</title>
</head>
<body>
    <div id="header">
       <div id="logo">
           <a href="/"><img id="logoImg" src="/resources/images/ddasum_header_logo.png"></a>
       </div> 
        <div id="navigation">
            <ul id="gnb_list">
                <li><a href="">스토리</a></li>
                <li><a href="">후원식당</a></li>
                <li><a href="/member/saleRestaurantPage.do">할인식당</a></li>
                <li><a href="">커뮤니티</a></li>
                <li id="customercenter"><a href="">고객센터</a>
                <div id="submenu"><a href="">공지사항</a>&nbsp;&nbsp;&nbsp;<a href="">자주 묻는 질문</a></div>
                </li>
            </ul>
        </div>
        <div id="member">
            <span id="join"><a href="/member/joinPage.do">회원가입</a></span>
            <span id="login"><a href="/member/loginPage.do">로그인</a></span>
        </div>
    </div>
    
    <script>
        $('#customercenter').hover(function() {
            $('#submenu').css("display", "block");

        }, function() {
            $('#submenu').css("display", "none");
        });
    </script>
</body>
</html>