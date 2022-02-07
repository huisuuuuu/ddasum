<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 꿈나무 카드 인증 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/commons/adminCommon.css">
<link rel="stylesheet" href="/resources/commons/adminNavigation.css">
<link rel="stylesheet" href="/resources/commons/adminCardConfirm.css">
<link rel="stylesheet" href="/resources/commons/adminBoard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/ui.js"></script>
</head>
<body>
    <div id="wrap">
        
        <!-- navigation -->
        <%@ include file="/WEB-INF/views/commons/header/adminNavigation.jsp"%>
        
        <div id="header">
        	<div id="header-box">
            <div class="admin-path">
                <p>회원 관리</p>
                <p>꿈나무 카드 인증 관리</p>
                <p>인증 요청 확인</p>
            </div>
           
            <div class="box-user">
                <a href="/">관리자</a>
                <a href="/">로그아웃</a>
            </div>
            </div>
        </div>
        
        <div id="content">
        	<div class="container">
        		<form action="" method="post">
					<div class="box-write">
						<div class="box-title">
							ㅇㅇㅇ님의 인증 내역 확인
						</div>
						<hr>
						<br>
						<div class="box-content">
							<div class="card-img">
							<img src="/resources/images/cardimg.jpg" alt="카드">
							</div>
							
							<div class="card-no-input">
							<input type="text" placeholder="카드번호를 입력하세요">
							<button class="btn-ok"><a href="">입력</a></button>							
							</div>
							
							<div class="card-com-input">
							<textarea name="content" placeholder="코멘트를 입력하세요"></textarea>							
							</div>
							
						</div>
					</div>
					<div class="box-button">
						<input type="submit" value="완료" class="success_btn">
						<button class="reject_btn"><a href="">반려</a></button>
						<button class="btn-ok"><a href="/admin/adminCardManageList.do">취소</a></button>
					</div>
				</form>
        	</div>
        </div>          
    </div>

</body>
</html>