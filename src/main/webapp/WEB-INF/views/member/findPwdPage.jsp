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
	href="/resources/css/findPwdPage.css">
<title>따숨, 마음을 나누다.</title>
</head>
<body>
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
		</header>
		<div id="content">
			<div class="main_tit">
				<h1>아이디&nbsp;/&nbsp;비밀번호 찾기</h1>
				<div class="under"></div>
			</div>
			<div class="contents_wrap">
				<div id="choiceFindInfo">
					<div id="choiceFindId">
						<a href="/member/findIdPage.do">아이디 찾기</a>
					</div>
					<div id="choiceFindPwd">
						<a href="/member/findPwdPage.do">비밀번호 찾기</a>
					</div>
				</div>
				<form id="findInfoForm" action="/member/findUserPwd.do" method="post">
					<label for="userId">아이디</label><br/>
					<input class="findInfoInput" type="text" id="userId" name="userId" placeholder="아이디를 입력해 주세요"><br/>
					<label for="email">이메일</label><br/>
					<input class="findInfoInput" type="email"id="email" name="userEmail" placeholder="이메일을 입력해 주세요"><br/>
					<input id="findInfoBtn" type="submit" value="확인"><br/>
				</form>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
</body>
</html>