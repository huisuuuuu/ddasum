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
					<input type="button" class ="moveBTN" name="pre" value="이전글"/>
					<input type="button" class ="moveBTN" name="next" value="다음글"/>
				</div>
				<div class="resultArea">
					<div class="detailTable">
						<p>
							<span class="subject">${requestScope.Notice.iTitle } </span>
							<span class="regdate">${requestScope.Notice.iRegdate } </span>
						</p>
						<br>
						<hr>
						<br>
							<span class="noticeContent">
								${requestScope.Notice.iContent }
							</span>  
						
					</div>
				</div>
				<div class="listBtn">
					<a href="/board/noticeBoard.do"><input type="button" class ="contentBTN" name="list" value="목록"/></a>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../commons/footer/site-footer.jsp"/>			
		</div>
	</div>
</body>
</html>