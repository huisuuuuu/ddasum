<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 고객센터 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/commons/adminCommon.css">
<link rel="stylesheet" href="/resources/commons/adminNoticeBoard.css">
<link rel="stylesheet" href="/resources/commons/adminWrite.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/styles.css">
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
                <p>고객센터 관리</p>
                <p>공지사항 관리</p>
            </div>
           
            <div class="box-user">
                <a href="/">관리자</a>
                <a href="/">로그아웃</a>
            </div>
            </div>
        </div>
        
        <div id="content">
        	<div class="container">
        		<form action="/admin/adminNoticeWrite.do" method="post">
        		<div class="select-search">
        		<select id="infoId" name="infoId">
                  <option>유형선택</option>
                  <option value="holdnoti">고정글</option>
                  <option value="notice">공지사항</option>
                  <option value="faq">자주 묻는 질문</option>
                </select>
                <i class="fas fa-chevron-down icon-arrow"></i>
              </div>
					<div class="box-write">
						<div class="box-subject">
							<input type="text" name="title" placeholder="제목을 입력하세요">
						</div>
						<div class="box-content">
							<textarea name="content" placeholder="내용을 입력하세요"></textarea>
						</div>
					<div class="box-button">
						<input type="submit" value="완료" class="btn-ok" id="wirte-send">
						<button class="btn-ok"><a href="/admin/adminNoticeManageList.do">목록</a></button>
					</div>
				</form>
        	</div>
        </div>          
    </div>

<script>
${"#infoId option:selected"}.val();
</script>

</body>
</html>