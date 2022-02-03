<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/commons/layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/commons/mainTitle.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/loginPage.css">
<title>따숨, 마음을 나누다.</title>
</head>
<body>
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
		</header>
		<div id="content">
			<div class="main_tit">
				<h1>로그인</h1>
				<div class="under"></div>
			</div>
			<div class="contents_wrap">
				<div class="login_area">
					<form id="loginForm" action="/member/login.do" method="post">
						<input type="text" name="userId" placeholder="아이디">
						<input type="password" name="userPwd" placeholder="비밀번호">
						<input class="btn_login" type="submit" value="로그인">
					</form>
				</div>
			</div>
			<div class="joinOrFindInfo">
				<a href="/member/joinPage.do">회원가입</a>&nbsp;&nbsp; <span class="bar">|</span>&nbsp;&nbsp;
				<a href="/member/findIdPage.do">ID/PW 찾기</a>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
</body>
</html>