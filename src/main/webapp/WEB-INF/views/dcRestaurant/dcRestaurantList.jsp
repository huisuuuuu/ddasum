<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/commons/layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/saleRestaurantListPage.css">
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
			<div id="restaurantNav">
				<div class="main_tit">
					<span>할인 식당</span>
					<div class="under"></div>
				</div>
				<div id="locationList">
					<ol>
						<li class="location" id="seoul">서울</li>
						<li class="location" id="incheon">인천</li>
						<li class="location" id="gyeonggi-do">경기도</li>
					</ol>
				</div>
			</div>
			<div id="restaurantList">
				<div id="foodNavigation">
					<ul>
						<li class="bar" id="all"><a class="foodGroup" href="">전체</a></li>
						<li class="bar" id="kor"><a class="foodGroup" href="">한식</a></li>
						<li class="bar" id="sch"><a class="foodGroup" href="">분식</a></li>
						<li class="bar" id="wes"><a class="foodGroup" href="">양식</a></li>
						<li class="bar" id="chi"><a class="foodGroup" href="">중식</a></li>
						<li id="jap"><a class="foodGroup" href="">일식</a></li>
					</ul>
					<select name="filter">
						<option value="newest">최신순</option>
						<option value="best">예약 많은순</option>
						<option value="available">예약 가능순</option>
					</select>
				</div>
				<div id="saleRestaurant">
					<div>
						<a href="/dcRestaurant/dcRestaurantDetail.do"><img src="/resources/images/식당외관1.jpg"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관2.PNG"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관1.jpg"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관2.PNG"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관1.jpg"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관2.PNG"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관1.jpg"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관2.PNG"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관1.jpg"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관2.PNG"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관1.jpg"></a> <span>할인식당</span>
					</div>
					<div>
						<a href=""><img src="/resources/images/식당외관2.PNG"></a> <span>할인식당</span>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>

	<script>
		$('.location').click(function() {
			$(this).css('font-weight', 'bold');
			$(this).siblings().css('font-weight', 'normal');
		});

		$('.foodGroup').click(function() {
			$(this).css('font-weight', 'bold');
			$(this).siblings().css('font-weight', 'normal');
		});
	</script>
</body>
</html>