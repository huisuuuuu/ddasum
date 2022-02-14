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
</head>
<style>
    * div {
        box-sizing: border-box;
    }

    * a {
        color: white;
        text-decoration: none;
    }

    * hr {
        margin-top: 0px;
        width: 85%;
        background-color: #707070;
        border: 0px;
        height: 1px;
        margin-left: 50px;
    }

    /*헤더*/
    #header {
        min-width: 1500px;
        width: 100%;
        height: 105px;
        background-color: rgba(255, 167, 126, 0.5);
    }

    #header-logo-area {
        /*로고*/
        width: 20%;
        height: 105px;
        float: left;
    }

    #header-logo-img {
        width: 79px;
        height: 66px;
        margin: 18px 0px 0px 80px;
    }

    #header-meun-area {
        /*센터메뉴*/
        width: 60%;
        height: 100%;
        float: left;
        margin: 0 auto;
        text-align: center;
    }

    #header-menu-ul {
        margin: auto;
        padding: 0px;
        width: 100%;
        height: 65%;
        line-height: 105px;
    }

    #header-menu-ul>li {
        height: 100%;
        width: 10%;
        line-height: 35px;
        display: inline-block;
        text-align: center;

    }

    #header-menu-ul>li>a {
        width: 100%;
        height: 100%;
        color: white;
        font-family: 'Noto Sans KR';
        text-decoration: none;
        font-size: 16px;
        display: block;
    }

    #header-login-area {
        /*로그인쪽*/
        width: 20%;
        height: 80%;
        float: left;
        text-align: center;
        font-family: 'Noto Sans KR';
        font-size: 16px;
        line-height: 105px;

    }

    #header-login-text {
        width: 100%;
        height: 100%;
        color: white;
        text-decoration: none;

    }


    #hover-menu1 {
        /*고객센터 호버시 나오는 서브메뉴*/
        width: 170px;
        height: 40px;
        background-color: black;
        border-radius: 20px;
        margin-left: -15px;
        position: absolute;
    }

    .hover-text1 {
        color: white;
        font-family: 'Noto Sans KR';
        font-size: 11px;
    }

    /*새로운 호버*/
    #header-myPage-hover-text {
        width: 50%;
        color: white;
        text-decoration: none;
        float: left;

    }

    #header-logout-text {
        width: 20%;
        height: 10%;
        text-decoration: none;
        float: left;
    }

    #hover-menu2 {
        /*아이디 호버시 나오는 서브메뉴*/
        width: 140px;
        line-height: 40px;
        background-color: white;
        border-radius: 15px;
        text-align: left;
        margin-left: 45px;
        padding-left: 10px;
        position: absolute;
    }

    .hover-text2 {
        color: black;
        font-family: 'Noto Sans KR';
        font-size: 14px;
    }

    /*컨텐츠*/
    #content {
        min-width: 1500px;
        width: 100%;
    }

    .content-side-back {
        /*사이드 빈공간*/
        border: 1px solid white;
        width: 15%;
        float: left;
    }

    #content-center {
        /*중앙 컨텐츠 공간*/
        width: 70%;
        float: left;
    }

    #content-center-empty-top-area1 {
        width: 100%;
        height: 100px;
    }

    #myPage-title_area {
        /*마이페이지 타이틀*/
        padding-top: 10px;
        width: 100%;
        height: 60px;
        text-align: center;
        font-family: 'Noto Sans KR';
        font-size: 22px;
        font-weight: bolder;
    }
    #under {
        width: 80px;
        height: 5px;
        margin-bottom: 30px;
        background: #FFA77E;
        position: relative;
        display: inline-block;
    }

    #content-center-empty-top-area2 {
        width: 100%;
        height: 95px;
    }

    #content-center-info-area {
        width: 100%;
        height: 510px;

    }

    #info-top-left {
        width: 50%;
        height: 57px;
        padding-top: 20px;
        font-size: 20px;
        font-weight: bold;
        font-family: 'Noto Sans KR';
        float: left;
    }

    #info-top-rigth {
        width: 50%;
        height: 57px;
        float: left;
        padding-top: 20px;
    }

    #info-update-button {
        background-color: white;
        border-radius: 3px;
        border: 1px solid #707070;
        width: 80px;
        height: 30px;
        font-family: 'Noto Sans KR';
        float: right
    }

    #info-img-area {
        /*이미지 업로드공간*/
        width: 30%;
        height: 463px;
        float: left;
        text-align: center;
        padding-top: 30px;
        font-family: 'Noto Sans KR';
        font-weight: bolder;
        color: #707070;
    }

    #img-area {
        border: 1px solid black;
        width: 150px;
        height: 150px;
        border-radius: 75px;
        margin-left: 160px;

    }
    
    #info-img-update-button{
        background-color: white;
        border-radius: 3px;
        border: 1px solid #707070;
        width: 80px;
        height: 30px;
        font-family: 'Noto Sans KR';
        
    }

    #info-info-area {
        /*정보 수정 공간*/
        width: 70%;
        height: 463px;
        float: left;
        padding-top: 70px;
    }

    .data-title {
        width: 20%;
        height: 30px;
        padding-top: 5px;
        font-family: 'Noto Sans KR';
        font-weight: bolder;
        text-align: center;
        color: #707070;
        float: left;

    }

    .info-data {
        width: 70%;
        height: 30px;
        float: left;
        padding-top: 5px;
        font-family: 'Noto Sans KR';
    }

    #info-addr-update-button {
        background-color: white;
        border-radius: 3px;
        border: 1px solid #707070;
        width: 80px;
        height: 30px;
        font-family: 'Noto Sans KR';
        float: right
    }

    #content-center-empty-center-area {
        width: 100%;
        height: 41px;
        float: left;
    }

    #content-confirm-area {
        /*꿈나무 카드 등록공간*/
        width: 100%;
        height: 400PX;
        float: left;

    }

    #confirm-top-rigth {
        width: 50%;
        height: 57px;
        padding-top: 20px;
        font-size: 20px;
        font-family: 'Noto Sans KR';
        font-weight: bold;
        float: left;
    }

    #confirm-top-left {
        width: 50%;
        height: 57px;
        padding-top: 20px;
        font-size: 20px;
        font-family: 'Noto Sans KR';
        font-weight: bold;
        float: left;
    }

    #img-enrollMent-button {
        background-color: white;
        border-radius: 3px;
        border: 1px solid #707070;
        width: 80px;
        height: 30px;
        font-family: 'Noto Sans KR';
        float: right;
    }

    #cancle-button {
        background-color: white;
        border-radius: 3px;
        border: 1px solid #707070;
        width: 80px;
        height: 30px;
        margin-left: 10px;
        font-family: 'Noto Sans KR';
        float: right;
    }

    #card-img-area {
        /*이미지올라가는 곳*/
        width: 35%;
        height: 332px;
        float: left;
        padding-top: 40px;
        padding-left: 30px;
    }

    #card-img {
        border: 1px solid black;
        width: 90%;
        height: 60%;
    }

    #success-fail-text-area {
        width: 65%;
        height: 332px;
        float: left;
        padding-top: 10px;
        padding-left: 50px;
        font-family: 'Noto Sans KR';
        color: #707070;
    }

    #content-center-empty-bottom-area {
        width: 100%;
        height: 50px;
        float: left;
    }

    #delete-user-button-area {
        width: 100%;
        height: 75px;
        float: left;
        text-align: center;

    }

    #delete-user-button {
        background-color: #E6510B;
        color: white;
        border-radius: 3px;
        border: 1px solid #707070;
        width: 80px;
        height: 30px;
        margin-left: 10px;
        font-family: 'Noto Sans KR';
    }







    /*푸터*/
    #footer {
        min-width: 1500px;
        width: 100%;
        height: 150px;
        background-color: #5D5D5D;
        opacity: 0.8;
        float: left;
    }

    #footer-img-area {
        width: 15%;
        height: 100%;
        float: left;
    }

    #footer-img {
        width: 79px;
        height: 66px;
        margin: 50px 0px 0px 80px;
    }

    #footer-text-area {
        width: 85%;
        height: 100%;
        float: left;
    }

    #footer-text {
        width: 50%;
        height: 50%;
        margin-top: 60px;
        color: white;
        font-weight: 400;
        font-size: 14px;
    }
    
    
    
    
    #profileImg{
        width: 160px;
        height: 160px;
        border-radius: 100px;
        margin-left: -10px;
        margin-top: -10px;
       
    }
</style>
<body>
<div id=header>
        <div id="header-logo-area">
            <a href=""><img id="header-logo-img" src="/resources/images/ddasum_header_logo.png"></a>
        </div>
        <div id="header-meun-area">
            <ul id="header-menu-ul">
                <li><a href="">스토리</a></li>
                <li><a href="">후원식당</a></li>
                <li><a href="">할인식당</a></li>
                <li><a href="">커뮤니티</a></li>
                <li id="notice-button">
                    <a href="">고객센터</a>
                    <div id="hover-menu1" style="display: none">
                        <a class="hover-text1" href="">공지사항</a> &nbsp;&nbsp; <a class="hover-text1" href="">자주 묻는 질문</a>
                    </div>
                </li>
            </ul>
        </div>
        <div id="header-login-area">
            <div id="header-myPage-hover-text"><a href="">${sessionScope.member.userId }</a>
                <div id="hover-menu2" style="display: none">
                   <div id="myPage-img-area">
		               <img src="/resources/images/user.png" style="width: 18px; padding-right: 5px">
		               <a class="hover-text2" href="/member/myPage.do">마이페이지</a>
	               </div>
	               <div id="resolvation-check-img-area">
		               <img src="/resources/images/reception-bell.png" style="width: 18px; padding-right: 5px">
		               <a class="hover-text2" href="/member/reservationPage.do">예약 내역 확인</a>
	               </div>
                </div>
            </div>
            <div id="header-logout-text"><a href="">로그아웃</a></div>
        </div>
    </div>

    <div id=content>
        <div class="content-side-back"></div>
        <div id="content-center">
            <div id="content-center-empty-top-area1"></div>
            <div id="myPage-title_area">
                <h1>마이페이지</h1>
                <div id="under"></div>
            </div>
            <div id="content-center-empty-top-area2"></div>
            <div id="content-center-info-area">
                <div id="info-top-left"><span>꿈나무 정보</span></div>
                <div id="info-top-rigth"><button id="info-update-button">변경완료</button></div>
                <br><br><br>
                <hr style="width: 100%; margin: 0px;">

                <div id="info-img-area">
                    <span>프로필 사진</span><br><br>
                    <div id="img-area"><img id="profileImg" src="${sessionScope.member.pImage }"> </div><br><br>
                    <form method="POST" id="uploadForm">
                    <input type="file" class="inp-img" name="uploadFile" id="img" accept=".jpg" style="display:none;"/>
                    </form>
                    <button id="info-img-update-button"><label for="img">변경하기</label></button>
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
                    <button id="cancle-button">취소</button><button id="img-enrollMent-button">등록하기</button>
                </div>
                <br><br><br>
                <hr style="width: 100%; margin: 0px;">
                <div id="card-img-area">
                    <div id="card-img"></div><br>
                    <input type="file" />
                </div>
                <div id="success-fail-text-area">
                    <br>
                    <div><span><b>&lt;인증 현황&gt;</b></span></div><br>
                    <div id="step1"><span>1. 인증 사진 전송</span></div><br>
                    <div id="step2"><span>2. 확인 중 입니다. 잠시만 기다려 주세요.</span></div><br>
                    <div id="step3-1"><span>&#8226;인증 완료</span></div>
                    <div id="step3-2"><span>&#8226;인증 실패(사진을 다시 보내주세요)</span></div><br>
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
        <div id="footer-img-area">
            <img id="footer-img" src="/resources/images/ddasum_footer_logo.png">
        </div>
        <div id="footer-text-area">
            <div id="footer-text">
                <p>07212 서울특별시 영등포구 선유동2로 57 이레빌딩 TEL : 02-1544-9970</p>
                <p>COPYRIGHT ⓒ 나눠조. ALL RIGHTS RESERVED.</p>
            </div>
        </div>
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
        
        function readInputFile(input) {
            if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#profileImg').attr('src', e.target.result);  
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $(".inp-img").on('change', function(){
            readInputFile(this);
        });
        
        
        
        
        $('#info-update-button').click(function(){
        	
        	var userPwd = $('input[name=userPwd]').val();
        	var userName = $('input[name=userName]').val();
        	var nick = $('input[name=nick]').val();
        	var email = $('input[name=email]').val();
        	var address = $('input[name=address]').val();
        	var phone = $('input[name=phone]').val();
        	
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
        			}else{
        				alert('정보수정실패 - 지속적인 문제 발생시 관리자에게 문의 바랍니다 -');
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
        			
        		}
        	});
        	}
        	
    	});
    </script>

</body>
</html>