<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용내역</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/commons/adminCommon.css">
<link rel="stylesheet" href="/resources/commons/adminNoticeBoard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/ui.js"></script>
<style>

* {
	box-sizing : border-box;
	margin : 0px;
}
	
.pop-wrap {
    width: 100%;
    border-radius: 20px;
}

.pop-header {
	width : 100%;
	height : 70px;
	background-color : #FFA77E;
	text-align : center;
	line-height : 60px;
	margin : 0px auto;
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
}

.pop-content {
    width: 100%;
    text-align: center;
}

.pop-content table {
    width: 100%;
    border-top: 0.5px solid #D8D8D8;
}

.pop-content table tr {
	height: 80px;
	line-height: 80px;
    border-bottom: 0.5px solid #D8D8D8;
}

.pop-content table th {
    border-bottom: 0.5px solid #D8D8D8;
}

.reset_area {
	border : 1px solid black;
	float : right;
}

span {
	display : inline;
}

th:nth-of-type(1) {
	display : none;
}

td:nth-of-type(1) {
	display : none;
}

</style>
</head>
<body>
	<div class="pop-wrap">
		<div class="pop-header">
			ㅇㅇㅇ님 이용내역
		</div>
		
		<div class="pop-content">
			<table>
				<thead>
					<tr>
						<th>예약번호</th>
						<th>예약일</th>
						<th>이용식당</th>
						<th>이용품목</th>
						<th>이용금액</th>
					</tr>
				</thead>
				
				<tbody>
				<c:choose>
				<c:when test="${!requestScope.list.isEmpty() }">
				<c:forEach items="${requestScope.list }" var="d">
					<tr>
						<td>${d.mReNo }</td>
						<td>${d.reservationDate }</td>
						<td>${d.bizName }</td>
						<td>${d.menuName }</td>
						<td>${d.authorityInfo }</td>
					</tr>				
				</c:forEach>
				</c:when>
				</c:choose>
				</tbody>
			</table>
				<hr>
		</div>
				<div id="page_wrap">
					<ul class="page_ul">
						<div class="reset_area">
							<p>이용횟수 <span>18/30건</span></p>
							<a href=""><button type="button" class="ok_btn">초기화</button></a>
						</div>         
					</ul>
				</div>
				

	</div>
</body>
</html>