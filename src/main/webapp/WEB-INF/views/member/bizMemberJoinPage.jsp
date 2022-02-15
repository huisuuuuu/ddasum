<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
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
<!-- 카카오 지도 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.swal2-popup {
		width: 45em;
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
			<form id="joinForm" action="/member/bizMemberJoin.do" method="post">
					<table>
					
						<tr>
							<th id="authorityIdTh">사업자 유형</th>
							<td id="authorityIdTd">
								<p>${param.regWord }</p>
								<input type="hidden" name="authorityId" value="${param.regCode }">
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" class="dataInput check" id="bizId" name="bizId" dataType="아이디">
								<button type="button" id="idCheckBtn">중복 확인</button>
								<span class="hide"><i class='bi bi-exclamation-circle'></i>5~20자의 영문 소문자, 숫자만 사용 가능합니다.</span>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" class="dataInput check" id="bizPwd" name="bizPwd" dataType="비밀번호">
								<span class="hide">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" class="dataInput check" id="bizPwd_re" name="bizPwd_re" dataType="비밀번호 확인">
								<span class="hide"></span>
							</td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td>
								<input type="text" class="dataInput check" id="ceoName" name="ceoName" dataType="대표자명">
								<span class="hide">한글, 영문 대 소문자만 입력 가능합니다.</span>
							</td>
						</tr>
						<tr>
							<th>업체명</th>
							<td>
								<input type="text" class="dataInput check" id="bizName" name="bizName" dataType="업체명">
							</td>
						</tr>
						<tr>
							<th id="regNoTh">사업자 등록번호</th>
							<td id="regNoTd">
								<p>${param.regNo }</p>
								<input type="hidden" name="regNo" value="${param.regNum }">
							</td>
						</tr>
						<tr>
							<th>업종</th>
							<td>
								<select name="restaurant">
									<option value="KOR">한식</option>
									<option value="SCH">분식</option>
									<option value="WES">양식</option>
									<option value="JAP">일식</option>
									<option value="CHI">중식</option>
								</select>
							</td>						
						</tr>
						<tr>
							<th>업체 주소</th>
							<td>
								<input type="text" class="dataInput check" id="roadAddress" name="roadAddress" placeholder="도로명 주소" dataType="도로명 주소">
								<button type="button" id="nickCheckBtn" onclick="sample6_execDaumPostcode()">주소 검색</button>
								<input type="text" class="dataInput check" id="detailAddress" name="detailAddress" value="" placeholder="상세 주소" dataType="상세 주소">
								<input type="hidden"  id="sido" name="area" value="">
								<span class="hide"></span>
							</td>
						</tr>
						<tr>
							<th>운영 시간</th>
							<td>
								<input type="time" class="check bizTime" name="bizTimeStart" value="" dataType="운영 시간">
								<input type="time" class="check bizTime" name="bizTimeEnd" value="" dataType="운영 시간">
								<span class="hide"></span>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" class="dataInput check" id="bizEmail" name="bizEmail" dataType="이메일">
								<button type="button" id="emailCheckBtn">이메일 인증</button>
								<span class="hide">이메일 주소를 다시 확인해주세요.</span>
								<div id="emailAuthKeyCheck" class="code_num" style="display: none;">
									<input type="text" class="dataInput" id="emailAuthKey">
									<button id="authKeyCheckBtn" class="btn default" type="button">인증번호 확인</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>업체 전화번호</th>
							<td>
								<input type="text" class="dataInput check" id="bizPhone" name="bizPhone" maxlength="15" placeholder="-없이 입력하세요" dataType="업체 전화번호">
								<span class="hide">숫자만 입력 가능합니다.</span>
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
									<input type="checkbox" class="userAgreements" name="chk_join" value="N">
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
			if ($(this).attr("name") == "bizId") {
				exp = "^[a-z0-9]{5,20}$";
			} else if ($(this).attr("name") == "bizPwd") { // 비밀번호
				exp = "^(?=.+[a-z])(?=.+[0-9])(?=.+[~!@#$%^&*-+]).{8,16}";
			} else if ($(this).attr("name") == "bizPwd_re") {//비밀번호 확인    
				var pw = $("input[name=bizPwd]").val();
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
			} else if ($(this).attr("name") == "ceoName") {
				exp = "^[a-zA-Z가-힣]*$";
			} else if ($(this).attr("name") == "bizEmail") {
				exp = ".+@.+";
			} else if ($(this).attr("name") == "bizPhone") {
				exp = "^[0-9]*$";
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
			var bizId = $('input[name=bizId]').val();
			var exp = "^[a-z0-9]{5,20}$";
			
			if(dataValidation(bizId, exp)){
				$.ajax({
					url: "/member/bizMemberIdCheck.do",
					data: {"bizId":bizId},
					type: "get",
					success: function(result){
						if(result=="true")
						{
							$('input[name=bizId]').val("");
							$('input[name=bizId]').focus();
							
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
								
							$("#bizId").attr("idCheck","true"); 	
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
		
		$('#emailCheckBtn').click(function(){//인증 번호 발송
			
			var bizEmail = $('input[name=bizEmail]').val();
			var exp = ".+@.+";
			
			if(dataValidation(bizEmail, exp)){
				
				$.ajax({
					url: "/member/bizMemberEmailCheck.do",
					data: {"bizEmail":bizEmail},
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
							
							$('input[name=bizEmail]').val("");
							$('input[name=bizEmail]').focus();
							
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

			}else{
				
				Swal.fire({
					  icon: 'error',
					  title: '이메일 주소를 다시 확인해주세요.',
					  showConfirmButton: false,
					  timer: 1500
					})
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
					
				$("#bizEmail").attr("emailCheck","true");
					
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
		
		//카카오 지도 API
		 function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		                var area = ''; // 도로명 주소 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                    area = data.sido;
		                } else { // 사용자가 지번 주소를 선택했어도 도로명 주소를 가져온다.
		                    addr = data.roadAddress;
		                    area = data.sido;
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("roadAddress").value = addr;
		                document.getElementById("sido").value = area;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
		
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
						if ($("input[name=bizEmail]").attr("emailCheck") != "true") {
							
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
						if ($("#bizId").attr("idCheck") != "true") {
							
							Swal.fire({
								  icon: 'error',
								  title: '아이디 중복 확인을 해주세요.',
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