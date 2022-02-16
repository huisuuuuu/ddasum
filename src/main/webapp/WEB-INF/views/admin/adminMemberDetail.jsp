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
<link rel="stylesheet" href="/resources/commons/styles.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/ui.js"></script>
<style>

* {
	box-sizing : border-box;
	margin : 0px;
    font-family: 'Noto Sans KR', sans-serif;
}
	
.wrap {
    width: 100%;
}

.detail-wrap {
	border : 1px solid #c8c8c8;
	width : 800px;
	height : 750px;
	border-radius : 20px;
	position: absolute;
	top: 25%;
	left: 25%;
}

.detail-header {
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
	width : 100%;
	height : 10%;
	background-color : #FFA77E;
	text-align : center;
	font-size : 16px;
	padding-top : 20px;
}

.detail-content {
    width: 100%;
    text-align: center;
}

.detail-content table {
    width: 100%;
    border-top: 0.5px solid #D8D8D8;
}

.detail-content table tr {
	height: 80px;
	line-height: 80px;
    border-bottom: 0.5px solid #D8D8D8;
}

.detail-content table th {
    border-bottom: 0.5px solid #D8D8D8;
}

.reset_area {
	width : 30%;
	height : 40px;
	position: relative;
	text-align : center;
	padding-top : 20px;
	top: -8%;
	left: 70%;
}

.reset-text-area {
	width : 50%;
	height : 100%;
	padding-top : 5px;
	float : left;
	margin : 0px auto;
}


.reset-btn {
	width : 50%;
	height : 100%;
	float : right;
	margin : 0px auto;
}

.close-btn {
	padding-top : 20px;
	padding-left : 350px;
	padding-bottom : 200px;
	position: relative;
	top: -10%;
}

#cl-btn {
	margin : 0px auto;
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


/* Page */

#page_wrap {
  width: 100%;
  margin : 0px auto;
  padding-top : 30px;
}

#page_wrap>ul {
  display: table;
  margin: 0 auto;
}

#page_wrap>ul>li {
  display: block;
  width: 35px;
  height: 35px;
  float: left;
  text-align: center;
  margin: 0 5px;
  line-height: 15.5px;
  font-size: 16px;
  color: #2a2a2a;
}

#page_inactive {
  display: block;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 16px;
  color: #2a2a2a;
  padding: 10px;
  border-radius: 50%;
  transition: ease 0.3s;
}

#page_active {
  display: block;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 16px;
  padding: 10px;
  transition: ease 0.3s;   
  background-color: #ffa77e;
  border-radius: 50%;
  color: white;
}

</style>
</head>
<body>
	<div class="detail-wrap">
		<div class="detail-header">
			${ user.NICK }님 이용내역 
		</div>
		
		<div class="detail-content">
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
				<c:forEach items="${requestScope.list }" var="d">

					<tr>
						<td>${d.mReNo }</td>
						<td>${d.reservationDate }</td>
						<td>${d.bizName }</td>
						<td>${d.menuName }</td>
						<td>${d.authorityInfo }</td>
					</tr>				
				</c:forEach>
				</tbody>
			</table>
				<hr>
		</div>

                    <div id="page_wrap">
                        <ul id="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/admin/adminMemberDetail.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a id="page_active" href='/admin/adminMemberDetail.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a id="page_inactive" href='/admin/adminMemberDetail.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/admin/adminMemberDetail.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>

				<div class="reset_area">
					<div class="reset-text-area">
						<p>이용횟수 <span>${detailTotalCount }/30건</span></p>
					</div>
					<div class="reset-btn">
						<a href=""><button type="button" class="btn-ok">초기화</button></a>
					</div>
				</div>
				<br><br><br>
				<div class="close-btn">
					<button type="button" class="btn-ok" id="cl-btn"><a href="/admin/adminMemberManageList.do">닫기</a></button>
				</div>
                    
                </div>

		
                    		
				

</body>
</html>