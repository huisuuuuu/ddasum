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
	href="/resources/css/joinPage.css">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
	.contents_wrap{
	
	width: 100%;
	height: auto;
	margin-top: 100px;
	margin-bottom: 150px;
	position: relative;
	display: inline-block;
	
}
</style>	
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
				<div id="choiceJoin">
					<div id="memberJoin">
						<a href="/member/findMemberIdPage.do"> <img id="memberJoinImg"
							src="/resources/images/memberJoin.png"> <span
							id="memberJoinWord">일반 회원</span>
						</a>
					</div>
					<div id="bizMemberJoin">
						<a href="/member/findBizMemberIdPage.do"> <img id="bizMemberJoinImg"
							src="/resources/images/bizMemberJoin.png"> <span
							id="bizMemberJoinWord">사업자 회원</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>

	<script>
		$('#memberJoin').hover(
				function() {
					$(this).css('background-color', '#FFA77E');
					$('#memberJoinImg').attr('src',
							'/resources/images/memberJoin_hover.png')
					$('#memberJoinWord').css('color', 'white');

				},
				function() {
					$(this).css('background-color', 'white');
					$('#memberJoinImg').attr('src',
							'/resources/images/memberJoin.png')
					$('#memberJoinWord').css('color', '#FFA77E');
				});

		$('#bizMemberJoin').hover(
				function() {
					$(this).css('background-color', '#FFA77E');
					$('#bizMemberJoinImg').attr('src',
							'/resources/images/bizMemberJoin_hover.png')
					$('#bizMemberJoinWord').css('color', 'white');

				},
				function() {
					$(this).css('background-color', 'white');
					$('#bizMemberJoinImg').attr('src',
							'/resources/images/bizMemberJoin.png')
					$('#bizMemberJoinWord').css('color', '#FFA77E');
				});
	</script>
</body>
</html>