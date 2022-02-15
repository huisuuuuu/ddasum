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
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" class="dataInput check" id="userId" name="userId" dataType="아이디">
								<button type="button" id="idCheckBtn">중복 확인</button>
								<span class="hide"><i class='bi bi-exclamation-circle'></i>5~20자의 영문 소문자, 숫자만 사용 가능합니다.</span>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" class="dataInput check" id="userPwd" name="userPwd" dataType="비밀번호">
								<span class="hide">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" class="dataInput check" id="userPwd_re" name="userPwd_re" dataType="비밀번호 확인">
								<span class="hide"></span>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" class="dataInput check" id="userName" name="userName" dataType="이름">
								<span class="hide">2~10자 한글, 영문 대 소문자만 입력 가능합니다.</span>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" class="dataInput check" id="nick" name="nick" dataType="닉네임">
								<button type="button" id="nickCheckBtn">중복 확인</button>
								<span class="hide">3~15자 영문 대 소문자, 숫자, 한글을 사용하세요.(특수문자 제외)</span>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" class="dataInput check" id="email" name="email" dataType="이메일">
								<button type="button" id="emailCheckBtn">이메일 인증</button>
								<span class="hide">이메일 주소를 다시 확인해주세요.</span>
								<div id="emailAuthKeyCheck" class="code_num" style="display: none;">
									<input type="text" class="dataInput" id="emailAuthKey">
									<button id="authKeyCheckBtn" class="btn default" type="button">인증번호 확인</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>
								<input type="text" class="dataInput check" id="phone" name="phone" maxlength="11" placeholder="-없이 입력하세요">
								<span class="hide">10~11자의 숫자만 입력하세요.</span>
							</td>
						</tr>
						<tr>
							<th>거주 지역</th>
							<td>
								<select name="address">
									<option value="서울">서울</option>
									<option value="인천">인천</option>
									<option value="경기도">경기도</option>
								</select>
							</td>
						</tr>
						<tr>
						<th>이용약관 동의</th>
						<td>
						<div class="agree_box">
							<ul>
								<li class="join_agree">
									<input type="checkbox" class="userAgreements" name="chk_personal" value="N">
									<label for="chk_personal">개인정보 취급방침</label>
									<span><a href="/member/personal.do" target="_blank">전문보기</a></span>
								</li>
								<li class="join_agree">
									<input type="checkbox" class="userAgreements" name="chk_join userAgreements" value="N">
									<label for="chk_join">이용약관 동의</label>
									<span><a href="/member/contract.do" target="_blank">전문보기</a></span>
								</li>
								<li class="join_agree">
									<input type="checkbox" name="chk_sms" value="Y">
									<label for="chk_join">SMS 및 이메일 수신동의(선택)</label>
									<span><a href="/member/smsYN.do" target="_blank">전문보기</a></span>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
			<div>
				<input type="button" id="memberJoinBtn" class="btn_join" value="가입하기">
			</div>
		</form>
	</div>
</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
	
	<script>
	
		var authKey = "";
		
		$(".check").on('change',function() {
			var exp = "";
			//입력하고 있는 데이터에 맞는 정규식을 찾아 exp에 넣음
			if ($(this).attr("name") == "userId") {
				exp = "^[a-z0-9]{5,20}$";
			} else if ($(this).attr("name") == "userPwd") { // 비밀번호
				exp = "^(?=.+[a-z])(?=.+[0-9])(?=.+[~!@#$%^&*-+]).{8,16}";
			} else if ($(this).attr("name") == "userPwd_re") {//비밀번호 확인    
				var pw = $("input[name=userPwd]").val();
				if ($(this).val() == pw) {
					$(this).siblings('span').css("color", "green");
					$(this).siblings('span').html("비밀번호가 일치합니다.");
					$(this).attr("dataCheck", "true");
				} else {
					$(this).siblings('span').css("color", "red");
					$(this).siblings('span').html("비밀번호가 일치하지않습니다.");
					$(this).attr("dataCheck", "false");
				}
				$(this).siblings('span').css("display", "block");
				return;
			} else if ($(this).attr("name") == "userName") {
				exp = "^[a-zA-Z가-힣]{2,10}$";
			} else if ($(this).attr("name") == "nick") {
				exp = "^[a-zA-Z0-9가-힣]{3,15}$";
			} else if ($(this).attr("name") == "email") {
				exp = ".+@.+";
			} else if ($(this).attr("name") == "phone") {
				exp = "^[0-9]{10,11}$";
			}

			var result = dataValidation($(this).val(), exp);
			if (!result) {
				$(this).siblings("span").css("color", "red");
				$(this).siblings("span").css("display", "block");
				$(this).attr("dataCheck", "false");
			}else{
				$(this).siblings("span").css("display", "none");
				$(this).attr("dataCheck", "true");
			}
		});
		
		function dataValidation(value, exp) {
			var exp = new RegExp(exp);
			return exp.test(value);
		}
		
		$('#idCheckBtn').click(function(){
			var userId = $('input[name=userId]').val();
			var exp = "^[a-z0-9]{5,20}$";
			
			if(dataValidation(userId, exp)){
				
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
								
							$("#userId").attr("idCheck","true"); 	
						}
					},
					error: function(){
						console.log('ajax 통신 실패');
					}
				});
			}else{
				Swal.fire({
					  icon: 'error',
					  title: '5~20자의 영문 소문자, 숫자만 사용 가능합니다.',
					  showConfirmButton: false,
					  timer: 1500
					})
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
							
						$("#nick").attr("nickCheck","true")
					}
				},
				error: function(){
					console.log('ajax 통신 실패');
				}
			});
		};	
		});
		
		$('#emailCheckBtn').click(function(){//인증 번호 발송
			
			var email = $('input[name=email]').val();
			
			if($('input[name=email]').val() == ''){
				
				Swal.fire({
					  icon: 'error',
					  title: '이메일을 입력해주세요.',
					  showConfirmButton: false,
					  timer: 1500
					})
				
			}else{
			
			$.ajax({
				url: "/member/memberEmailCheck.do",
				data: {"email":email},
				type: "post",
				success: function(result){
					
					if(result != "false"){
						
						authKey = result;
						
						Swal.fire({
							  icon: 'success',
							  title: '인증 번호 발송 완료',
							  text: '메일 확인 후 인증 번호를 입력해주세요.'
							})
							
						$('.swal2-styled.swal2-confirm').css('background-color','#F8976A');
						$('.swal2-styled.swal2-confirm').html('확인');
						
						$('#emailAuthKeyCheck').css("display","block");
						
					}else{
						
						$('input[name=email]').val("");
						$('input[name=email]').focus();
						
						Swal.fire({
							  icon: 'error',
							  title: '이미 사용중인 이메일입니다.',
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
		
		$('#authKeyCheckBtn').click(function(){
		
			var emailAuthKey = $('#emailAuthKey').val();
			
			if(authKey == emailAuthKey){
				Swal.fire({
					  icon: 'success',
					  title: '인증 성공',
					  showConfirmButton: false,
					  timer: 1500
					})
					
				$("#email").attr("emailCheck","true");
					
			}else{
				$('#emailAuthKey').val("");
				$('#emailAuthKey').focus();
				
				Swal.fire({
					  icon: 'error',
					  title: '인증 번호가 일치하지 않습니다.',
					  showConfirmButton: false,
					  timer: 1500
					})
			}
			
		});
		
		// 회원가입 버튼을 클릭하여 폼태그 사항을 submit 하기 전 입력 사항 검사
		$("#memberJoinBtn").click(function() {
			
					var $form = $("#joinForm");

					$.each($(".check"), function(index, item) {
						// 데이터를 입력하지 않았을 경우
						if ($(this).val() == "") {
							var dataType = $(this).attr("dataType");
							$(this).focus();
							
							Swal.fire({
								  icon: 'error',
								  title: dataType + '을(를) 입력해주세요.',
								  showConfirmButton: false,
								  timer: 1500
							})
								
							$form = "";
							return false;
						}
						
						
						//필수 동의 사항을 체크 하지 않은 경우
						if (!$(".userAgreements").prop("checked")) {
							
							Swal.fire({
								  icon: 'error',
								  title: '필수 이용 약관에 동의해주세요.',
								  showConfirmButton: false,
								  timer: 1500
							})
							
							$form = "";
							return false;
						}
						

						// 이메일 인증을 하지 않은 경우
						if ($("input[name=email]").attr("emailCheck") != "true") {
							
							Swal.fire({
								  icon: 'error',
								  title: '이메일 인증을 진행하지 않았습니다.',
								  showConfirmButton: false,
								  timer: 1500
								})
							
							$form = "";
							return false;
						}
						// 아이디 중복확인을 하지 않았을 경우 
						if ($("#userId").attr("idCheck") != "true") {
							
							Swal.fire({
								  icon: 'error',
								  title: '아이디 중복 확인을 해주세요.',
								  showConfirmButton: false,
								  timer: 1500
								})
							
							$form = "";
							return false;
						}
						
						// 닉네임 중복 확인을 하지 않았을 경우 
						if ($("#nick").attr("nickCheck") != "true") {
							
							Swal.fire({
								  icon: 'error',
								  title: '닉네임 중복 확인을 해주세요.',
								  showConfirmButton: false,
								  timer: 1500
								})
							
							$form = "";
							return false;
						}
				
					// 유효성 검사 규칙에 맞지 않을 경우
						if ($(this).attr("dataCheck") != "true") {
							
							Swal.fire({
								  icon: 'error',
								  title: '입력 정보를 확인해주세요.',
								  showConfirmButton: false,
								  timer: 1500
								})
							
							$form = "";
							$(this).focus();
							return false;
						}
					
					if ($form != "") {
						$form.submit();
					}
				})
			})
		
		
	</script>
</body>
</html>