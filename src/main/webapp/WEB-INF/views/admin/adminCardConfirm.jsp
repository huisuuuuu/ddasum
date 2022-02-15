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
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>
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
        <div class="cont-head">
          <h3 class="cont-title">
            <span>${info.NICK }</span>님의 인증내역 확인
          </h3>
        </div>
        <div class="cont-body px-0 py-8">
          <div class="d-flex">
            <div class="w-50">
              <img class="card-img" src="../img/card.png" alt="">
            </div>
            <div class="w-50">
              <div class="input-group-2 d-flex mb-4">
                <input type="text" placeholder="카드번호 입력: 1234-1234-1234-1234" />
                <button class="btn-md fs-16 fc-w bg-1">등록</button>
              </div>
              <div class="input-group-2">
                <textarea name="content" placeholder="코멘트를 입력하세요"></textarea>
              </div>
              <div class="btn-group">
                <button class="btn-sm-2 bg-2">승인</button>
                <button class="btn-sm-2 bg-3">반려</button>
                <button class="btn-sm-2 bg-4">취소</button>
              </div>
            </div>
          </div>
        </div>

        <div class="cont-foot"></div>

      </div>
    </div>
  </div>

</body>

</html>