<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비밀번호 확인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

</head>
<style>
    * div {
        box-sizing: border-box;
    }

    * a {
        color: white;
        text-decoration: none;
    }

    * hr {
        margin-top: 0px;
        width: 85%;
        background-color: #707070;
        border: 0px;
        height: 1px;
        margin-left: 50px;
    }

    /*헤더*/
    #header {
        min-width: 1500px;
        width: 100%;
        height: 105px;
        background-color: rgba(255, 167, 126, 0.5);
    }

    #header-logo-area {
        /*로고*/
        width: 20%;
        height: 105px;
        float: left;
    }

    #header-logo-img {
        width: 79px;
        height: 66px;
        margin: 18px 0px 0px 80px;
    }

    #header-meun-area {
        /*센터메뉴*/
        width: 60%;
        height: 100%;
        float: left;
        margin: 0 auto;
        text-align: center;
    }

    #header-menu-ul {
        margin: auto;
        padding: 0px;
        width: 100%;
        height: 65%;
        line-height: 105px;
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

    #header-login-area {
        /*로그인쪽*/
        width: 20%;
        height: 80%;
        float: left;
        text-align: center;
        font-family: 'Noto Sans KR';
        font-size: 16px;
        line-height: 105px;

    }

    #header-login-text {
        width: 100%;
        height: 100%;
        color: white;
        text-decoration: none;

    }


    #hover-menu1 {
        /*고객센터 호버시 나오는 서브메뉴*/
        width: 170px;
        height: 40px;
        background-color: black;
        border-radius: 20px;
        margin-left: -15px;
        position: absolute;
    }

    .hover-text1 {
        color: white;
        font-family: 'Noto Sans KR';
        font-size: 11px;
    }

    /*새로운 호버*/
    #header-myPage-hover-text {
        width: 50%;
        color: white;
        text-decoration: none;
        float: left;

    }

    #header-logout-text {
        width: 20%;
        height: 10%;
        text-decoration: none;
        float: left;
    }

    #hover-menu2 {
        /*아이디 호버시 나오는 서브메뉴*/
        width: 140px;
        line-height: 40px;
        background-color: white;
        border-radius: 15px;
        text-align: left;
        margin-left: 45px;
        padding-left: 10px;
        position: absolute;
    }

    .hover-text2 {
        color: black;
        font-family: 'Noto Sans KR';
        font-size: 14px;
    }



    /*컨텐츠*/
    #content {
        min-width: 1500px;
        width: 100%;
    }

    .content-side-back {
        /*사이드 빈공간*/
        border: 1px solid white;
        width: 17.5%;
        float: left;
    }

    #content-center {
        /*중앙 컨텐츠 공간*/
        width: 65%;
        float: left;
    }

    #content-center-empty-top-area {
        width: 100%;
        height: 95px;
    }

    #passwordCheck-title-area {
        width: 100%;
        height: 200px;
        text-align: center;
        font-family: 'Noto Sans KR';
    }

    pre {
        font-size: 17px;
        color: #A5A5A5;
    }

    #under {
        width: 80px;
        height: 5px;
        margin-bottom: 30px;
        background: #FFA77E;
        position: relative;
        display: inline-block;
    }

    #content-center-empty-center-area {
        width: 100%;
        height: 34px;
    }
    
    
    .contents_wrap {
        width: 100%;
        height: auto;
        position: relative;
        display: inline-block;
    }

    .login_area {
        width: 50%;
        margin: 0 auto;

    }

    .btn_login {

        width: 450px;
        height: 60px;
        line-height: normal;
        text-align: center;
        color: white;
        font-size: 16px;
        font-weight: bold;
        margin: 0 auto;
        margin-top: 10px;
        margin-bottom: 20px;
        cursor: pointer;
        background-color: #FFA77E;
        display: block;
        border: none;
        padding: 2%;
    }

    .login_area input:not(:last-child) {
        display: block;
        width: 450px;
        height: 40px;
        border: 1px solid #ddd;
        margin: 0 auto;
        margin-bottom: 20px;
        font-size: 15px;
        padding: 2%;
        line-height: normal;
        border-radius: 0;
    }
    #content-center-empty-bottom-area{
        width: 100%;
        height: 95px;
    }



    /*푸터*/
    #footer {
        min-width: 1500px;
        width: 100%;
        height: 150px;
        background-color: #5D5D5D;
        opacity: 0.8;
        float: left;
    }

    #footer-img-area {
        width: 15%;
        height: 100%;
        float: left;
    }

    #footer-img {
        width: 79px;
        height: 66px;
        margin: 50px 0px 0px 80px;
    }

    #footer-text-area {
        width: 85%;
        height: 100%;
        float: left;
    }

    #footer-text {
        width: 50%;
        height: 50%;
        margin-top: 60px;
        color: white;
        font-weight: 400;
        font-size: 14px;
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
                <li id="notice-button">
                    <a href="">고객센터</a>
                    <div id="hover-menu1" style="display: none">
                        <a class="hover-text1" href="">공지사항</a> &nbsp;&nbsp; <a class="hover-text1" href="">자주 묻는 질문</a>
                    </div>
                </li>
            </ul>
        </div>
        <div id="header-login-area">
            <div id="header-myPage-hover-text"><a href="">${sessionScope.member.userId }</a>
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
            <div id="header-logout-text"><a href="">로그아웃</a></div>
        </div>
    </div>

    <div id=content>
        <div class="content-side-back"></div>
        <div id="content-center">
            <div id="content-center-empty-top-area"></div>
            <div id="passwordCheck-title-area">
                <div class="main_tit">
                    <h1>비밀번호 확인</h1>
                    <div id="under"></div>
                    <pre>본인확인을 위해 한번 더 비밀번호를 입력해 주세요.
비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</pre>
                </div>
            </div>
            <div id="content-center-empty-center-area"></div>
            <div class="contents_wrap">
                <div class="login_area">
                    <form id="loginForm" action="/member/myPageUpdate.do" method="post">
                        <input type="text" name="userId" value="${sessionScope.member.userId }">
                        <input type="password" name="userPwd" placeholder="비밀번호">
                        <input class="btn_login" type="submit" value="확인">
                    </form>
                </div>
            </div>
            <div id="content-center-empty-bottom-area"></div>
        </div>
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
        $('#notice-button').hover(function() {
            $('#hover-menu1').css("display", "block");
        }, function() {
            $('#hover-menu1').css("display", "none");
        });


        $('#header-myPage-hover-text').hover(function() {
            $('#hover-menu2').css("display", "block");
        }, function() {
            $('#hover-menu2').css("display", "none");
        });
    </script>
</body>
</html>