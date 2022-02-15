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
<style>

.contents_wrap{
	width: 100%;
	height: auto;
	margin-top: 30px;
	margin-bottom: 150px;
	position: relative;
	display: inline-block;
}

.txt_area {
    width: 100%;
    font-size: 16px;
    line-height: 26px;
    margin-top: 50px;
    color: #555;
    padding: 30px 150px;
    text-align: justify;
    clear: both;
}

.txt_area h1 {
    width: 100%;
    font-size: 18px;
    font-weight: 500;
    color: #FFA77E;
    margin-top: 30px;
    margin-bottom: 10px;
}

.txt_area h3 {
    font-size: 15px;
    font-weight: 400;
    line-height: 28px;
    margin-top: 10px;
    margin-left: 0px;
    color: #333;
    position: relative;
    display: inline-block;
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
            <h1>SMS 및 이메일 수신동의</h1>
            <div class="under"></div>
         </div>
         <div class="contents_wrap">
         	<div class="txt_area">
				<p class="privacy_txt"></p>
				<h1>SMS 및 이메일 수신동의 안내</h1>
				<h3>
					따숨은 후원 관련 안내를 위하여 입력해 주신 개인정보를 이용합니다.<br>
					회원님께서는 후원 관련 안내를 위한 정보 수집 및 이용에 관한 동의를 거부할 수 있으나,
					동의를 거부하실 경우 후원 관련 안내 등의 서비스가 제한됩니다.<br>
					단, 공지사항, 후원 내역, 예약 관련 소식은 동의에 상관 없이 발송될 수 있습니다.
				</h3>
				<p></p>

			</div>
         </div>
      </div>
      <footer>
         <%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
      </footer>
   </div>
</body>
</html>