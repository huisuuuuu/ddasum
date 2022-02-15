<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
      crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/memberMyPageUpdate.css">
</head>

<body>
<div id=header>
         <%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
    </div>

    <div id=content>
        <div class="content-side-back"></div>
        <div id="content-center">
            <div id="content-center-empty-top-area1"></div>
            <div id="myPage-title_area">
                <div class="main_tit">
                    <h1>마이페이지</h1>
                    <div id="under"></div>
               
                </div>
            </div>
            <div id="content-center-empty-top-area2"></div>
            <div id="content-center-info-area">
                <div id="info-top-left"><span>꿈나무 정보</span></div>
                <div id="info-top-rigth"><button id="info-update-button">변경완료</button></div>
                <br><br><br>
                <hr style="width: 100%; margin: 0px;">

                <div id="info-img-area">
                    <span>프로필 사진</span><br><br>
                    <div id="img-area">
                    
                    <img id="profileImg" src="${sessionScope.member.pImage }">
                   
                    </div><br><br>
                    <form method="POST" id="uploadForm">
                    <input type="file" class="profile-img" name="uploadFile" id="img" accept=".jpg" style="display:none;"/>
                    </form>
                    <button id="info-img-update-button"><label for="img">사진선택</label></button><br><br><br>
                    <button id="profileImgUpdateBtn">프로필 변경</button>
                    
                </div>
                <div id="info-info-area">
                    <div class="data-title">아이디</div>
                    <div class="info-data"><span>${sessionScope.member.userId }</span></div>
                    <br><br>
                    <hr>
                    <div class="data-title">비밀번호</div>
                    <div class="info-data"><input type="password" name="userPwd" value="${sessionScope.member.userPwd }"/></div>
                    <br><br>
                    <hr>
                    <div class="data-title">이름</div>
                    <div class="info-data"><input type="text" name="userName" value="${sessionScope.member.userName }"/></div>
                    <br><br>
                    <hr>
                    <div class="data-title">닉네임</div>
                    <div class="info-data"><input type="text" name="nick" value="${sessionScope.member.nick }"/></div>
                    <br><br>
                    <hr>
                    <div class="data-title">이메일</div>
                    <div class="info-data"><input type="text" name="email" value="${sessionScope.member.email }"/></div>
                    <br><br>
                    <hr>
                    <div class="data-title">주소</div>
                    <div class="info-data"><input type="text" name="address" id="address_area" value="${sessionScope.member.address }" readonly/> <button onclick="address()" id="info-addr-update-button">주소검색</button></div>
                    <br><br>
                    <hr>
                    <div class="data-title">휴대전화</div>
                    <div class="info-data"><input type="text" name="phone" value="${sessionScope.member.phone }"/></div>
                    <br><br>
                    <hr>

                </div>

            </div>
            <br>
            <hr style="width: 100%; margin: 0px;">
            <div id="content-center-empty-center-area"></div>
            <div id="content-confirm-area">
                <div id="confirm-top-rigth">
                    <span>꿈나무 카드 인증</span>
                </div>
                <div id="confirm-top-left">
                    <button id="img-enrollMent-button">등록하기</button>
                </div>
                <br><br><br>
                <hr style="width: 100%; margin: 0px;">
                <div id="card-img-area">
                    <div id="card-img">
                    <img id="e-img" src="${sessionScope.member.cdImage }" style="width:340px; height: 212px;">
                    </div><br><br><br>
                     <form method="POST" id="enrollMentImgForm">
                    <input type="file" class="enrollMent-img" name="enrollMentImgFIle" id="enrollMentImg" accept=".jpg" style="display:none;"/>
                    </form>
                    <button id="info-enrollMent-update-button"><label for="enrollMentImg">사진선택</label></button><br><br><br>
                </div>
                <div id="success-fail-text-area">
                    <br>
                    <div><span><b>&lt;인증 현황&gt;</b></span></div><br>
	                    <c:choose>
		                    <c:when test="${sessionScope.member.mJoinStatus eq 'NONE' }">
		                    <div id="step1"><span style="color:blue;">1. 인증 사진 전송 바람</span></div><br>
		                    <div id="step2"><span>2. 확인 중 입니다. 잠시만 기다려 주세요.</span></div><br>
		                    <div id="step3-1"><span>&#8226;인증 완료</span></div>
		                    <div id="step3-2"><span>&#8226;인증 실패(사진을 다시 보내주세요)</span></div><br>
		                    </c:when>
		                    <c:when test="${sessionScope.member.mJoinStatus eq 'WAIT' }">
		                    <div id="step1"><span>1. 인증 사진 전송</span></div><br>
		                    <div id="step2"><span style="color:blue;">2. 확인 중 입니다. 잠시만 기다려 주세요.</span></div><br>
		                    <div id="step3-1"><span>&#8226;인증 완료</span></div>
		                    <div id="step3-2"><span>&#8226;인증 실패(사진을 다시 보내주세요)</span></div><br>
		                    </c:when>
		                    <c:when test="${sessionScope.member.mJoinStatus eq 'SUCCESS' }">
		                    <div id="step1"><span>1. 인증 사진 전송</span></div><br>
		                    <div id="step2"><span>2. 확인 중 입니다. 잠시만 기다려 주세요.</span></div><br>
		                    <div id="step3-1"><span style="color:blue;">&#8226;인증 완료</span></div>
		                    <div id="step3-2"><span>&#8226;인증 실패(사진을 다시 보내주세요)</span></div><br>
		                    </c:when>
                    </c:choose>
                </div>
                <hr style="width: 100%; margin: 0px;">
            </div>
            <div id="content-center-empty-bottom-area"></div>
            <div id="delete-user-button-area">
                <button id="delete-user-button">회원 탈퇴</button>
            </div>
        </div>

        <div class="content-side-back"></div>

    </div>



    <div id=footer>
        <%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
    </div>

    <script>
        $('#notice-button').hover(function() {
            $('#hover-menu1').css("display", "block");
        }, function() {
            $('#hover-menu1').css("display", "none");
        });


        $('#header-myPage-hover-text').hover(function() {
            $('#hover-menu2').css("display", "block");
        }, function() {
            $('#hover-menu2').css("display", "none");
        });
        
        function address() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.sido + " " + data.sigungu; 
                    
                    document.getElementById("address_area").value = addr;
                    
                }
            }).open();
        }
       
        
        $("#img").on('change', function(){
            readInputFile1(this);
        });
        
        function readInputFile1(input) {
            if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#profileImg').attr('src', e.target.result);
            
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
       
	       
        
        $('#profileImgUpdateBtn').click(function(){
        	var formData = new FormData();
        	formData.append("uploadFile", $("input[name=uploadFile]")[0].files[0]);
        	
        	$.ajax({
        		url : "/file/fileUpload.do",
        		data : formData,
        		type : "POST",
        		processData: false,
        		contentType: false,
        		success : function(result){
        			if(result == "true"){
        				
        			}else{
        				alert(' 회원 정보 변경 실패 - 지속적인 문제 발생시 관리자에게 문의바랍니다. - ');
        			}
        		},
        		error : function(){
        			console.log('ajax 통신 에러');
        		}
        	});
        
        });
        $('#info-update-button').click(function(){
        	
        	var userPwd = $('input[name=userPwd]').val();
        	var userName = $('input[name=userName]').val();
        	var nick = $('input[name=nick]').val();
        	var email = $('input[name=email]').val();
        	var address = $('input[name=address]').val();
        	var phone = $('input[name=phone]').val();
        	
        	$.ajax({
        		url : "/member/memberInfoUpdate.do",
        		data : {"userPwd":userPwd, 
        				"userName":userName, 
        				"nick":nick, 
        				"email":email, 
        				"address":address, 
        				"phone":phone},
        		type : "POST",
        		success : function(result){
        			if(result == "true"){
        				alert('회원 정보 변경 성공');
        				location.replace("/member/myPage.do");
        			}else{
        				alert(' 회원 정보 변경 실패 - 지속적인 문제 발생시 관리자에게 문의바랍니다. - ');
        				location.replace("/member/myPage.do");
        			}
        		},
        		error : function(){
        			console.log('ajax 통신 에러');
        		}
        	});
        });
        
        $('#delete-user-button').click(function(){
    		
        	if(window.confirm('탈퇴하시겠습니까? \n -탈퇴시 데이터 복구 불가능입니다.-') == true){
        	$.ajax({
        		
        		url : "/member/withdraw.do",
        		type : "get",
        		success : function(result){
        			if(result == "true"){
        				alert('회원 탈퇴 성공 \n -감사합니다 -');
        				location.replace('/');
        			}else{
        				alert('회원 탈퇴 실패 \n - 지속적인 문제발생시 관리자에게 문의바랍니다.');
        				location.replace('/member/myPage.do');
        			}
        		},
        		error : function(){
        			console.log('ajax 통신 에러');
        		}
        	});
        	}
        	
    	});
        
        $("#enrollMentImg").on('change', function(){
           	readInputFile2(this);
       	});
        function readInputFile2(input) {
            if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#e-img').attr('src', e.target.result);
                    
                    
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        $('#img-enrollMent-button').click(function(){
        	var formData = new FormData();
        	formData.append("enrollMentImgFIle", $("input[name=enrollMentImgFIle]")[0].files[0]);
        	
        	$.ajax({
        		url : "/file/enrollMentImgUpload.do",
        		data : formData,
        		type : "POST",
        		processData: false,
        		contentType: false,
        		success : function(result){
        			if(result == "true"){
        				alert('인증사진 등록완료 \n - (조금만 기다려 주새요) -');
        			}else{
        				alert('카드 인증 실패 - 지속적인 문제 발생시 관리자에게 문의바랍니다. - ');
        			}
        		},
        		error : function(){
        			console.log('ajax 통신 에러');
        		}
        	});
        
        });
	       
    </script>

</body>
</html>