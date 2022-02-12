<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<img src="/resources/images/식당외관1.jpg">
				<div id="mainInfo">
					<div id="restaurantName">
						<div>한식</div>
						<span>할인 식당</span>
					</div>
					<div id="call">
						<img src="/resources/images/callIcon.png">
						<p>02)776-5348</p>
					</div>
					<div id="location">
						<img src="/resources/images/locationIcon.png"><span>서울
							중구 명동 10길 29</span>
					</div>
					<div id="operatingHours">
						<img src="/resources/images/clock.png"><span>10:30 ~
							21:30</span>
					</div>
				</div>
			</div>
			<div id="reservationAndLocation">
				<span id="reservation">메뉴 예약</span> <span id="restaurantLocation">업체
					정보</span>
			</div>
			<div id="menu">
				<h3>※ 당일 예약만 가능한 점 유의하시기 바랍니다.</h3>
				<div class="food">
					<img src="/resources/images/칼국수.PNG">
					<div>
						<p>칼국수</p>
						<p class="explain">구수하면서 진한 닭 육수, 부드러운 국수, 고명이 어우러진 칼국수</p>
						<span class="price">9,000원</span><span class="salePrice">7,000원</span>
					</div>
					<button>예약하기</button>
				</div>
				<div class="food">
					<img src="/resources/images/만두.PNG">
					<div>
						<p>만두</p>
						<p class="explain">최고급 암퇘지 고기, 채소, (호)부추, 갓 짠 참기름으로 만든 소를 채운 찜 만두</p>
						<span class="price">10,000원</span><span class="salePrice">7,000원</span>
					</div>
					<button>예약하기</button>
				</div>
				<div class="food">
					<img src="/resources/images/비빔국수.PNG">
					<div>
						<p>비빔국수</p>
						<p class="explain">매콤 새콤 비빔국수</p>
						<span class="price">9,000원</span><span class="salePrice">7,000원</span>
					</div>
					<button>예약하기</button>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
</body>
</html>
