<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<script src="https://code.jquery.com/jquery-3.6.0.js"
integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/css/noticeBoard.css">
<title>공지 사항</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<jsp:include page="../commons/header/site-header.jsp"/>
		</div>
		<div id="body">
			<div class="titleArea">
				<span class="title">공지사항</span>
			</div>
			<div class="tableArea">
				<div class="searchArea">
					<input type="button" name="pre" value="이전글"/>
					<input type="button" name="next" value="다음글"/>
				</div>
				<div class="resultArea">
					<div class="detailTable">
						<p>
							<span class="subject">꿈나무 카드 인증 안내</span>
							<span class="subject">2022.01.27</span>
						</p>
						
							<span class="noticeContent">
								안녕하세요. 따숨입니다.
								<br/>꿈나무 카드 인증 관련 안내드립니다.
								<br/>
								<br/>마이페이지 > 꿈나무 카드 인증 메뉴에 아래와 같이 카드 사진을 업로드 한 후 등록 버튼을 클릭하면
								<br/>관리자가 3일 내에 확인 후 승인 작업을 진행합니다.
								<br/>
								<br/>카드 번호 식별 불가 시 반려되므로, 카드 번호를 정확하게 식별할 수 있는 사진을 업로드 해주시길 바랍니다.
							</span>  
						
					</div>
				</div>
				<div class="listBtn">
					<input type="button" name="list" value="목록"/>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../commons/footer/site-footer.jsp"/>			
		</div>
	</div>
</body>
</html>