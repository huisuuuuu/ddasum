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
<link rel="stylesheet" href="/resources/css/memberPasswordCheckPage.css">
</head>

<body>
	<div id=header>
         <%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
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
                <div class="passoword_area">
                    <form id="loginForm" action="/member/myPageUpdate.do" method="post">
                        <input type="text" name="userId" value="${sessionScope.member.userId }" readonly>
                        <input type="password" name="userPwd" placeholder="비밀번호">
                        <input class="btn_password" type="submit" value="확인">
                    </form>
                </div>
            </div>
            <div id="content-center-empty-bottom-area"></div>
        </div>
    </div>



    <div id=footer>
        <%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
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