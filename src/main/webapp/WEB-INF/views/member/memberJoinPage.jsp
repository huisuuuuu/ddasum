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
	href="/resources/css/memberJoinPage.css">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
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
			<div class="contents_wrap">
				<div id="joinSituation">
					<ol>
						<li id="choiceMember">가입&nbsp;유형&nbsp;선택&nbsp;&nbsp;>&nbsp;&nbsp;</li>
						<li id="accountCreation">계정 생성&nbsp;&nbsp;>&nbsp;&nbsp;</li>
						<li id="successJoin">가입 완료</li>
					</ol>
				</div>
				<form id="joinForm" action="/member/successJoinPage.do" method="post">
					<label for="userId">아이디</label><br /> <input type="text"
						id="userId" name="userId">
					<button type="button">중복 확인</button>
					<br /> <label for="userPwd">비밀번호</label><br /> <input
						type="password" id="userPwd" name="userPwd"><br /> <label
						for="userPwd_re">비밀번호 확인</label><br /> <input type="password"
						id="userPwd_re" name="userPwd_re"><br /> <label
						for="userName">이름</label><br /> <input type="text" id="userName"
						name="userName"><br /> <label for="nickName">닉네임</label><br />
					<input type="text" id="nickName" name="nickName">
					<button type="button">중복 확인</button>
					<br /> <label for="email">이메일</label><br /> <input type="text"
						id="email" name="email">
					<button type="button">이메일 인증</button>
					<br /> <label for="phone">휴대폰번호</label><br /> <input type="text"
						id="phone" name="phone" placeholder="-없이 입력하세요"><br /> <label
						for="address">주소</label><br /> <input type="text" id="address"
						name="address">
					<button type="button">주소 검색</button>
					<br /> <input type="text" name="address2">
					<div class="agree_box">
						<ul>
							<li class="join_agree"><input type="checkbox"
								name="chk_personal" value="N"> <label for="chk_personal">개인정보
									취급방침</label> <span><a href=""
									target="_blank">전문보기</a></span></li>
							<li class="join_agree"><input type="checkbox"
								name="chk_join" value="N"> <label for="chk_join">이용약관
									동의</label> <span><a href=""
									target="_blank">전문보기</a></span></li>
							<li class="join_agree"><input type="checkbox" name="chk_sms"
								value="Y"> <label for="chk_join">SMS 및 이메일
									수신동의(선택)</label> <span><a href=""
									target="_blank">전문보기</a></span></li>
						</ul>
					</div>
					<input type="submit" class="btn_join" value="가입하기"></div>
				</form>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>

</body>
</html>