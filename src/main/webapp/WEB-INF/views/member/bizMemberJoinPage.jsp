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
	href="/resources/css/bizMemberJoinPage.css">
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
					<div id="memberColumnList">
						<span>사업자 유형</span><br/>
						<label for="userId">아이디</label><br/>
						<label for="userPwd">비밀번호</label><br/>
						<label for="userPwd_re">비밀번호 확인</label><br/>
						<label for="userName">대표자명</label><br/>
						<label for="nickName">업체명</label><br/>
						<span>사업자 등록번호</span><br/>
						<label for="email">업종</label><br/>
						<label for="address">업체 주소</label><br/>
						<label for="address">운영 시간</label><br/>
						<label for="email">이메일</label><br/>
						<label for="email">업체 전화번호</label><br/>
						<label for="phone">휴대폰번호</label><br/>
					</div>
					<div id="memberData">
						<span>후원</span><br/>
						<input type="text" id="bizId" name="bizId"><button type="button">중복 확인</button> <br/>
						<input type="password" id="bizPwd" name="bizPwd"><br/>
						<input type="password" id="bizPwd_re" name="bizPwd_re"><br/>
						<input type="text" id="ceoName" name="ceoName"><br/>
						<input type="text" id="bizName" name="bizName"><button type="button">중복 확인</button><br/>
						<span>221-81-62571</span><br/>
						<input type="text" id="restaurant" name="restaurant"><button type="button">이메일 인증</button><br/>
						<input type="text" id="address" name="address"><button type="button">주소 검색</button><br/>
						<input type="text" name="address2">
						<input type="time" id="time1" name="time1">~<input type="time" id="time2" name="time2"><br/>
						<input type="text" id="bizEmail" name="bizEmail"><br/>
						<input type="text" id="bizPhone" name="bizPhone" placeholder="-없이 입력하세요"><br/>
						<div class="agree_box">
							<ul>
								<li class="join_agree">
									<input type="checkbox" name="chk_personal" value="N">
									<label for="chk_personal">개인정보 취급방침</label>
									<span><a href="" target="_blank">전문보기</a></span>
								</li>
								<li class="join_agree">
									<input type="checkbox" name="chk_join" value="N">
									<label for="chk_join">이용약관 동의</label>
									<span><a href="" target="_blank">전문보기</a></span>
								</li>
								<li class="join_agree">
									<input type="checkbox" name="chk_sms" value="Y">
									<label for="chk_join">SMS 및 이메일 수신동의(선택)</label>
									<span><a href="" target="_blank">전문보기</a></span>
								</li>
							</ul>
						</div>
						<input type="submit" class="btn_join" value="가입하기">
					</div>
					</div>
				</form>
			</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
</body>
</html>