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
				<form id="joinForm" action="/member/memberJoin.do" method="post">
					<div id="memberColumnList">
						<label for="userId">아이디</label><br/>
						<label for="userPwd">비밀번호</label><br/>
						<label for="userPwd_re">비밀번호 확인</label><br/>
						<label for="userName">이름</label><br/>
						<label for="nick">닉네임</label><br/>
						<label for="email">이메일</label><br/>
						<label for="phone">휴대폰번호</label><br/>
						<label for="address">거주 지역</label><br/>
					</div>
					<div id="memberData">
						<input type="text" class="dataInput" id="userId" name="userId">
						<button type="button" id="idCheckBtn">중복 확인</button> <br/>
						<input type="password" class="dataInput" id="userPwd" name="userPwd"><br/>
						<input type="password" class="dataInput" id="userPwd_re" name="userPwd_re"><br/>
						<input type="text" class="dataInput" id="userName" name="userName"><br/>
						<input type="text" class="dataInput" id="nick" name="nick">
						<button type="button" id="nickCheckBtn">중복 확인</button><br/>
						<input type="text" class="dataInput" id="email" name="email">
						<button type="button">이메일 인증</button><br/>
						<input type="text" class="dataInput" id="phone" name="phone" placeholder="-없이 입력하세요"><br/>
						<select name="address">
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<option value="경기도">경기도</option>
						</select>
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
	
	<script>
		$('#idCheckBtn').click(function(){
			var userId = $('input[name=userId]').val();
			
			if($('input[name=userId]').val() ==''){
				Swal.fire({
					  icon: 'error',
					  title: '아이디를 입력해주세요.',
					  showConfirmButton: false,
					  timer: 1500
					})
			}else{
			
			$.ajax({
				url: "/member/memberIdCheck.do",
				data: {"userId":userId},
				type: "get",
				success: function(result){
					if(result=="true")
					{
						$('input[name=userId]').val("");
						$('input[name=userId]').focus();
						
						Swal.fire({
							  icon: 'error',
							  title: '이미 사용중인 아이디입니다.',
							  showConfirmButton: false,
							  timer: 1500
							})
						
							
					}else
					{
						Swal.fire({
							  icon: 'success',
							  title: '사용 가능한 아이디입니다.',
							  showConfirmButton: false,
							  timer: 1500
							})
					}
				},
				error: function(){
					console.log('ajax 통신 실패');
				}
			});
		}
		});
		
		$('#nickCheckBtn').click(function(){
			var nick = $('input[name=nick]').val();
			
			if($('input[name=nick]').val() ==''){
				Swal.fire({
					  icon: 'error',
					  title: '닉네임을 입력해주세요.',
					  showConfirmButton: false,
					  timer: 1500
					})
			}else{
			
			$.ajax({
				url: "/member/memberNickCheck.do",
				data: {"nick":nick},
				type: "get",
				success: function(result){
					if(result=="true")
					{
						$('input[name=nick]').val("");
						$('input[name=nick]').focus();
						
						Swal.fire({
							  icon: 'error',
							  title: '이미 사용중인 닉네임입니다.',
							  showConfirmButton: false,
							  timer: 1500
							})
					}else
					{
						Swal.fire({
							  icon: 'success',
							  title: '사용 가능한 닉네임입니다.',
							  showConfirmButton: false,
							  timer: 1500
							})
					}
				},
				error: function(){
					console.log('ajax 통신 실패');
				}
			});
		};	
		});
	</script>
</body>
</html>