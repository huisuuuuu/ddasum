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
						<li id="SEOUL"><a class="area" href="/dcRestaurant/dcRestaurantList.do?area=SEOUL">서울<a/></li>
						<li id="INCHEON"><a class="area" href="/dcRestaurant/dcRestaurantList.do?area=INCHEON">인천</a></li>
						<li id="GYEONGGI"><a class="area" href="/dcRestaurant/dcRestaurantList.do?area=GYEONGGI">경기도</a></li>
						<input type="hidden" id="choiceArea" value="${requestScope.area }">
					</ol>
				</div>
			</div>
			<div id="restaurantList">
				<div id="foodNavigation">
					<ul>
						<li class="bar" id="ALL"><a class="foodGroup" href="/dcRestaurant/dcRestaurantList.do?area=${requestScope.area }">전체</a></li>
						<li class="bar" id="KOR"><a class="foodGroup" href="/dcRestaurant/dcRestaurantList.do?area=${requestScope.area }&restaurant=KOR">한식</a></li>
						<li class="bar" id="SCH"><a class="foodGroup" href="/dcRestaurant/dcRestaurantList.do?area=${requestScope.area }&restaurant=SCH">분식</a></li>
						<li class="bar" id="WES"><a class="foodGroup" href="/dcRestaurant/dcRestaurantList.do?area=${requestScope.area }&restaurant=WES">양식</a></li>
						<li class="bar" id="CHI"><a class="foodGroup" href="/dcRestaurant/dcRestaurantList.do?area=${requestScope.area }&restaurant=CHI">중식</a></li>
						<li id="JAP"><a class="foodGroup" href="/dcRestaurant/dcRestaurantList.do?area=${requestScope.area }&restaurant=JAP">일식</a></li>
						<input type="hidden" id="choiceFood" value="${requestScope.restaurant }">
					</ul>
					<form id="filterForm" action="" method="get"></form>
					<select name="filter" onchange="location.href='/dcRestaurant/dcRestaurantList.do?area=${requestScope.area }&restaurant=${requestScope.restaurant }&filter='+this.value">
						<option value="newest" <c:if test="${requestScope.filter eq 'newest'}">selected</c:if>>최신순</option>
						<option value="best" <c:if test="${requestScope.filter eq 'best'}">selected</c:if>>예약 많은순</option>
						<option value="available" <c:if test="${requestScope.filter eq 'available'}">selected</c:if>>예약 가능순</option>
					</select>
					</form>
				</div>
				<div id="saleRestaurant">
				<c:choose>
				 <c:when test="${!requestScope.list.isEmpty()}">
                  	<c:forEach items="${requestScope.list}" var="dc">    
                  	<c:choose>
                  		<c:when test="${dc.bizImage eq '/resources/images/bizProfile.png'}">
						<div id="existRestaurant">
							<a href="/dcRestaurant/dcRestaurantDetail.do?bizNo=${dc.bizNo }"><img id="defaultImg" src="${dc.bizImage}"></a> <span>${dc.bizName}</span>
						</div>
						</c:when>
						<c:otherwise>
						<div id="existRestaurant">
							<a href="/dcRestaurant/dcRestaurantDetail.do?bizNo=${dc.bizNo }"><img id="restaurantImg" src="${dc.bizImage}"></a> <span>${dc.bizName}</span>
						</div>
						</c:otherwise>
					</c:choose>	
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h3 id="nonexistRestaurant">등록된 식당이 없습니다.</h3>
				</c:otherwise>
				</c:choose>	
				</div>
						<div id="page_wrap">
                        <ul id="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/dcRestaurant/dcRestaurantList.do?currentPage=${ preNavi }&area=${requestScope.area }&restaurant=${requestScope.restaurant }&filter=${requestScope.filter }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a id="page_active" href='/dcRestaurant/dcRestaurantList.do?currentPage=${i}&area=${requestScope.area }&restaurant=${requestScope.restaurant }&filter=${requestScope.filter }'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a id="page_inactive" href='/dcRestaurant/dcRestaurantList.do?currentPage=${i}&area=${requestScope.area }&restaurant=${requestScope.restaurant }&filter=${requestScope.filter }'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/dcRestaurant/dcRestaurantList.do?currentPage=${ nextNavi }&area=${requestScope.area }&restaurant=${requestScope.restaurant }&filter=${requestScope.filter }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>

	<script>
		
	 	$(document).ready(function(){
         var area = $("#choiceArea").val();
         var food = $("#choiceFood").val();
         var restaurant = $('#saleRestaurant').children().attr("id");
         
         if(area == "SEOUL"){
        	 $('#SEOUL').css('font-weight','bolder');
         }else if(area == "INCHEON"){
        	 $('#INCHEON').css('font-weight','bolder');
         }else if(area == "GYEONGGI"){
        	 $('#GYEONGGI').css('font-weight','bolder');
         };
         
         if(food == "ALL"){
        	 $('#ALL').css('font-weight','bolder');
         }else if(food == "KOR"){
        	 $('#KOR').css('font-weight','bolder');
        	 $('#ALL').css('font-weight','normal');
         }else if(food == "SCH"){
        	 $('#SCH').css('font-weight','bolder');
        	 $('#ALL').css('font-weight','normal');
         }else if(food == "WES"){
        	 $('#WES').css('font-weight','bolder');
        	 $('#ALL').css('font-weight','normal');
         }else if(food == "CHI"){
        	 $('#CHI').css('font-weight','bolder');
        	 $('#ALL').css('font-weight','normal');
         }else if(food == "JAP"){
        	 $('#JAP').css('font-weight','bolder');
        	 $('#ALL').css('font-weight','normal');
         };
         
         
         if(restaurant == 'existRestaurant'){
        	 $('#saleRestaurant').css("justify-content","space-between");
         }else{
        	 $('#saleRestaurant').css("justify-content","start");
         };
         
         
         
     	});

	
		$('.foodGroup').click(function() {
			$(this).css('font-weight', 'bold');
			$(this).siblings().css('font-weight', 'normal');
		});

	</script>
</body>
</html>