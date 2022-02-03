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
	href="/resources/css/successJoinPage.css">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>따숨, 마음을 나누다</title>
</head>
<body>
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
		</header>
		<div id="content">
			<div class="main_tit">
				<h1>회원가입</h1>
				<div class="under"></div>
			</div>
			<div id="joinSituation">
				<ol>
					<li id="choiceMember">가입&nbsp;유형&nbsp;선택&nbsp;&nbsp;>&nbsp;&nbsp;</li>
					<li id="accountCreation">계정 생성&nbsp;&nbsp;>&nbsp;&nbsp;</li>
					<li id="successJoin">가입 완료</li>
				</ol>
			</div>
			<div class="contents_wrap">
				<img src="/resources/images/fireworks.png">
				<h1>회원 가입이 완료되었습니다.</h1>
				<h2>따숨의 일원이 되신 걸 진심으로 환영합니다.</h2>
				<button id="mainBtn">메인으로 이동</button>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
	
	<script>
	$('#mainBtn').click(function(){
		location.replace("/");
	})
	</script>
</body>
</html>