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
      <link rel="stylesheet" href="/resources/css/memberMyPage.css">
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
                <div id="info-top-left"><span>꿈나무 정보</span></div><div id="info-top-rigth"><a href="/member/passwordCheckPage.do"><button id="info-update-button">변경하기</button></a></div>
                <br><br><br><hr style="width: 100%; margin: 0px;">
                
                <div id="info-img-area">
                    <span>프로필 사진</span><br><br>
                    <div id="img-area"> <img id="profileImg" src="${sessionScope.member.pImage }"></div><br><br>
                    
                </div>
                <div id="info-info-area">
                        <div class="data-title">아이디</div><div class="info-data"><span>${sessionScope.member.userId }</span></div>
                        <br><br><hr>    
                        <div class="data-title">비밀번호</div><div class="info-data"><span>●●●●●●●●●●</span></div>
                        <br><br><hr>
                        <div class="data-title">이름</div><div class="info-data"><span>${sessionScope.member.userName }</span></div>
                        <br><br><hr>
                        <div class="data-title">닉네임</div><div class="info-data"><span>${sessionScope.member.nick }</span></div>
                        <br><br><hr>
                        <div class="data-title">이메일</div><div class="info-data"><span>${sessionScope.member.email }</span></div>
                        <br><br><hr>
                        <div class="data-title">주소</div><div class="info-data"><span>${sessionScope.member.address }</span></div>
                        <br><br><hr>
                        <div class="data-title">휴대전화</div><div class="info-data"><span>${sessionScope.member.phone }</span></div>
                        <br><br><hr>
                        
                </div>
               
            </div>
            <br><hr style="width: 100%; margin: 0px;">
            <div id="content-center-empty-center-area"></div>
            <div id="content-confirm-area">
                <div id="confirm-top-rigth">
                    <span>꿈나무 카드 인증</span>
                </div>
                <div id="confirm-top-left">
                    <button id="img-enrollMent-button">등록하기</button>
                </div>
                <br><br><br><hr style="width: 100%; margin: 0px;">
                <div id="card-img-area">
                    <div id="card-img">
                    <img id="e-img" src="${sessionScope.member.cdImage }" style="width:340px; height: 212px;">
                    </div><br>
                   
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
           
           
            
        </div>
        </div>
        
        <div class="content-side-back"></div>
        
    </div>
   
   
   
    <div id=footer>
       <%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
   </div>
   
   <script>
     $('#notice-button').hover(function(){
            $('#hover-menu1').css("display","block");   
        }, function() {
            $('#hover-menu1').css("display","none");
        });
        
       
        $('#header-myPage-hover-text').hover(function(){
            $('#hover-menu2').css("display","block");    
        }, function() {
            $('#hover-menu2').css("display","none");
        });
  
    </script>
     
</body>
</html>