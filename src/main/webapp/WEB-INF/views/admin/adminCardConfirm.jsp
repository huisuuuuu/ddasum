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
  <link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminCommon.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminBoard.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/styles.css">
  
  <style>

  form {
  	width : 100%;
  	height : 100%x;
  	margin : 0px auto;
  	padding : 0 !important;
  	box-sizing : border-box;

  }
  
  form > div {
  	margin : 0px auto;
  }
  
  .input-group-2 d-flex mb-4 {
  	margin : 0px auto;
  }
  
  #cardImgBox {
  	padding-top : 50px;
  	padding-left : 50px;
  	margin : 0px auto;
  }
  </style>
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
        <div class="cont-head">
          <h3 class="cont-title">
            <span>${info.USERNAME }</span>님의 인증내역 확인
          </h3>
        </div>
        <div class="cont-body px-0 py-8">
          <div class="d-flex">
            <div class="w-50" id="cardImgBox">
              <img class="card-img" src="/resources/images/card.png" alt="카드">
            </div>

            <form action="/admin/adminCardCheck.do" method="get" class="cardNoinput" name="cardNoinput">            
            <div class="w-50">
              <div class="input-group-2 d-flex mb-4">
                <input type="text" placeholder="카드번호 입력: 1234567890" id="cardExist"/>
                <button type="button" class="btn-md fs-16 fc-w bg-1" onclick="checkCardExist();">등록</button>
              </div>
              
              <div class="input-group-2">
                <textarea name="content" placeholder="코멘트를 입력하세요"></textarea>
              </div>
              <div class="btn-group">
                <button class="btn-sm-2 bg-2"><a href="/admin/adminCardConfirmOk.do?cmNo=${info.CMNO }">승인</a></button>
                <button class="btn-sm-2 bg-3"><a href="/admin/adminCardConfirmNo.do?cmNo=${info.CMNO }">반려</a></button>
                <button class="btn-sm-2 bg-4"><a href="/admin/adminCardManageList.do">취소</a></button>
              </div>
              </form>
            </div>
          </div>
        </div>

        <div class="cont-foot"></div>

      </div>
    </div>
  </div>
  	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>
  	<script src="/resources/js/ui.js"></script>
	<script>
	function checkCardExist() {
		var cardExist = document.getElementById('cardExist');
		
		$.ajax({
			url: '/admin/adminCardNoCheck.do',
			type: 'get',
			data: {
				cardNo: cardExist.value
			},
			success: function(data) {
				if (data) {
					alert('중복된 카드입니다.');
				}else {
					alert('중복되지 않은 카드입니다.');
				}
			},
			error: function() {
				console.log('ajax 통신 실패');
			}
		});	
		
	}
	</script>
</body>

</html>