<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/commons/layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/saleRestaurantDetail.css">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>따숨, 마음을 나누다.</title>
</head>
<body>
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
		</header>
		<div id="content">
			<div id="pageSituation">
				<ul>
					<li>할인&nbsp;식당</li>
					<li>&nbsp;>&nbsp;&nbsp;상세 페이지</li>
				</ul>
			</div>
			<div id="imgAndTitle">
				<img src="${dcInfo.bizImage }">
				<div id="mainInfo">
					<div id="restaurantName">
					<c:choose>
					<c:when test="${dcInfo.restaurant eq 'KOR'}">
						<div>한식</div>
					</c:when>
					<c:when test="${dcInfo.restaurant eq 'SCH'}">
						<div>분식</div>
					</c:when>
					<c:when test="${dcInfo.restaurant eq 'WES'}">
						<div>양식</div>
					</c:when>
					<c:when test="${dcInfo.restaurant eq 'CHI'}">
						<div>중식</div>
					</c:when>
					<c:when test="${dcInfo.restaurant eq 'JAP'}">
						<div>일식</div>
					</c:when>	
					</c:choose>
						<span>${dcInfo.bizName }</span>
					</div>
					<div id="call">
						<img src="/resources/images/callIcon.png">
						<p>${dcInfo.bizPhone }</p>
					</div>
					<div id="location">
						<img src="/resources/images/locationIcon.png">
						<span>${dcInfo.address }</span>
					</div>
					<div id="operatingHours">
						<img src="/resources/images/clock.png">
						<span>${dcInfo.bizTime }</span>
					</div>
				</div>
			</div>
			<div id="reservationAndLocation">
				<span id="reservation">메뉴 예약</span> <span id="restaurantLocation">업체
					정보</span>
			</div>
			<div id="menu">
			<c:choose>
				<c:when test="${!dcMenu.isEmpty()}">
					<h3>※ 당일 예약만 가능한 점 유의하시기 바랍니다.</h3>
                <c:forEach items="${dcMenu}" var="m">
				<div class="food">
					<img src="${m.menuImage }">
					<div>
						<p>${m.menuName }</p>
						<p class="explain">${m.menuInfo }</p>
						<span class="price">${m.originalPrice }원</span><span class="salePrice">${m.dcPrice }원</span>
					</div>
					<button>예약하기</button>
				</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<h3>※ 등록된 메뉴가 없습니다.</h3>
				</c:otherwise>
			</c:choose>	
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
</body>
</html>
