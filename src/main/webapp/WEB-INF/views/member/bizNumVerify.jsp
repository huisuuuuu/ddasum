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
	href="/resources/css/bizNumVerify.css">
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
				<div id="verifyBizNum">
					<p>사업자 등록번호를 입력하세요.</p>
					<form id="verifyBizNumForm" action="/member/bizMemberJoinPage.do"
						method="post" onsubmit="return false">
						<input id="verifyNum" type="text" maxlength="10" name="regNum"
							placeholder="- 제외한 숫자 10자리 입력"><br />
						<input id="verifyBtn" type="button" value="인증">
					</form>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>

	<script>
	$('#verifyBtn').click(function(){
	
		var regNum = $('input[name=regNum]').val();
		
		if($('input[name=regNum]').val() ==''){
			Swal.fire({
				  icon: 'error',
				  title: '사업자 등록번호를 입력해주세요.',
				  showConfirmButton: false,
				  timer: 1500
				});
		}else{
		
		$.ajax({
			url: "/member/bizMemberRegNumCheck.do",
			data: {"regNum":regNum},
			type: "post",
			success: function(result){
				
				console.log(result)
				
				if(result=="true")
				{
					$('input[name=regNum]').val('');
					$('input[name=regNum]').focus();
					
					Swal.fire({
						  icon: 'error',
						  title: '이미 가입된 사업자 등록 번호입니다.',
						  showConfirmButton: false,
						  timer: 1500
						});
				}else
				{
					var data = {
						    "b_no": [regNum] // 사업자번호 "xxxxxxx" 로 조회 시,
						   }; 
						   
						$.ajax({
						  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=ftyBGsuzlvbp7yY%2BWPHNshygdh8%2FQzpUiDpNKGoElpgwQJ%2F9rUJm0QMUM%2FwzXMYhQzJ4AfmwIQIwqdxCBu583g%3D%3D",  // serviceKey 값을 xxxxxx에 입력
						  type: "POST",
						  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
						  dataType: "JSON",
						  contentType: "application/json",
						  accept: "application/json",
						  success: function(result) {
						      
						      var searchData = result.data[0].b_stt_cd;
						      
						      if(searchData == ""){
						    	  
						    	  Swal.fire({
									  icon: 'error',
									  title: '국세청에 등록되지 않은 사업자등록번호입니다.',
									  showConfirmButton: false,
									  timer: 1500
									})
								
									$('.swal2-popup').css('width','45em');
						    	  
						      }else{
						    	  Swal.fire({
									  icon: 'success',
									  title: '인증되었습니다.',
									  showConfirmButton: false,
									  timer: 1500
									}).then(function(){
										$('#verifyBizNumForm').attr("onsubmit","return true");
								    	$('#verifyBizNumForm').submit();
									});
						      }
						  },
						  error: function(result) {
						      console.log(result.responseText); //responseText의 에러메세지 확인
						  }
						});
				};
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