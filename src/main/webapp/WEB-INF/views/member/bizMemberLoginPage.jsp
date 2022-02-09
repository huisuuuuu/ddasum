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
	href="/resources/css/bizMemberLoginPage.css">
<!-- SweetAlert2 CDN -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>	
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
					<div id="loginTypeChoice">
						<div id="choiceMemberLogin">
							<a href="/member/loginPage.do">회원</a>
						</div>
						<div id="choiceBizMemberLogin">
							<a href="/member/bizMemberLoginPage.do">사업자</a>
						</div>
					</div>
					<form id="loginForm" action="/member/bizMemberLogin.do" method="post" onsubmit="return check();">
						<input type="text" id="bizId" name="bizId" placeholder="아이디"> <input
							type="password" id="bizPwd" name="bizPwd" placeholder="비밀번호"> <input
							class="btn_login" type="submit" value="로그인">
					</form>
				</div>
			</div>
			<div class="joinOrFindInfo">
				<a href="/member/joinPage.do">회원가입</a>&nbsp;&nbsp; <span class="bar">|</span>&nbsp;&nbsp;
				<a href="/member/findIdPwdPage.do">ID/PW 찾기</a>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
	
	<script>
		
	 function check(){
	        var bizId = document.getElementById("bizId");
	        var bizPwd = document.getElementById("bizPwd");
	        if(bizId.value == ""){
	        	Swal.fire('아이디를 입력해주세요.');
	        	$('.swal2-styled.swal2-confirm').html('확인');
	        	$('.swal2-styled.swal2-confirm').css('background-color','#F8976A');
	            return false;
	        }else if(bizPwd.value ==""){
	        	Swal.fire('비밀번호를 입력해주세요.');
	        	$('.swal2-styled.swal2-confirm').html('확인');
	        	$('.swal2-styled.swal2-confirm').css('background-color','#F8976A');
	            return false;
	        }else{
	            return true;
	        }
	    }
	
	</script>
</body>
</html>