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
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- SweetAlert2 CDN -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>		
<title>따숨, 마음을 나누다.</title>
</head>
<body>
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
		</header>
		<div id="content">
			<div class="main_tit">
				<h1>회원&nbsp;아이디&nbsp;/&nbsp;비밀번호 찾기</h1>
				<div class="under"></div>
			</div>
			<div class="contents_wrap">
				<div id="choiceFindInfo">
					<div id="choiceFindId">
						<a href="/member/findMemberIdPage.do">아이디 찾기</a>
					</div>
					<div id="choiceFindPwd">
						<a href="/member/findMemberPwdPage.do">비밀번호 찾기</a>
					</div>
				</div>
				<form id="findInfoForm" action="/member/findMemberPwd.do" method="post" onsubmit="return check();">
					<label for="userId">아이디</label><br/>
					<input class="findInfoInput" type="text" id="userId" name="userId" placeholder="아이디를 입력해 주세요"><br/>
					<label for="email">이메일</label><br/>
					<input class="findInfoInput" type="email" id="email" name="email" placeholder="이메일을 입력해 주세요"><br/>
					<input id="findMemberPwdBtn" type="button" value="확인"><br/>
				</form>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
	
	<script>
	function check(){
        var userId = document.getElementById("userId");
        var email = document.getElementById("email");
        if(userId.value == ""){
        	Swal.fire({
				  icon: 'error',
				  title: '아이디를 입력해주세요.',
				  showConfirmButton: false,
				  timer: 1500
				});
            return false;
        }else if(email.value ==""){
        	Swal.fire({
				  icon: 'error',
				  title: '이메일을 입력해주세요.',
				  showConfirmButton: false,
				  timer: 1500
				});
            return false;
        }else{
            return true;
        }
    }
	
	$('#findMemberPwdBtn').click(function(){
		
		var userId = $('input[name=userId]').val();
		var email = $('input[name=email]').val();
		
		$.ajax({
			url: "/member/findMemberPwd.do",
			data: {"userId":userId, "email":email},
			type: "post",
			success: function(result){
				
				if(result=="true")
				{
					Swal.fire({
						  icon: 'success',
						  title: '임시 비밀번호 발급 완료',
						  text: '이메일로 발급된 임시 비밀번호를 통해 로그인 해주세요.'
						}).then(function(){
							location.href='/member/loginPage.do';
						});
					
					$('.swal2-styled.swal2-confirm').css('background-color','#F8976A');
					$('.swal2-styled.swal2-confirm').html('로그인 하기');
				}else
				{
					Swal.fire({
						  icon: 'error',
						  title: '임시 비밀번호 발급 실패',
						  text: '아이디와 이메일 정보를 확인해주세요.'
						}).then(function(){
							location.href='/member/findMemberPwdPage.do';
						});
					
					$('.swal2-styled.swal2-confirm').css('background-color','#F8976A');
					$('.swal2-styled.swal2-confirm').html('확인');
				}
				
			},
			error: function(){
				console.log('ajax 통신 실패');
			}
		});
	})
	</script>
</body>
</html>