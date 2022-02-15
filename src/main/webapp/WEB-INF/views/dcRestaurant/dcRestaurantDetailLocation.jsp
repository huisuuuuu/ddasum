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
	href="/resources/css/saleRestaurantDetailLocation.css">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- SweetAlert2 CDN -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
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
				<span id="reservation"><a href="/dcRestaurant/dcRestaurantDetail.do?bizNo=${dcInfo.bizNo }&todayRSVNCount=${todayRSVNCount}">메뉴 예약</a></span> <span id="restaurantLocation"><a href="/dcRestaurant/dcRestaurantDetailLocation.do?bizNo=${dcInfo.bizNo }&todayRSVNCount=${todayRSVNCount}">업체 정보</a></span>
			</div>
				<input type="hidden" id="bizNo" value="${dcInfo.bizNo }">
				<input type="hidden" id="userNo" value="${sessionScope.member.userNo }">
				<input type="hidden" id="authorityId" value="${sessionScope.member.authorityId }">
				<input type="hidden" id="address" value="${dcInfo.address }">
			<div id="menu">
				<div id="locationInfo">
						<img src="/resources/images/locationIcon.png">
						<span>${dcInfo.address }</span>
				</div>
				<div id="map" style="width:1135px;height:375px;"></div>
        		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf3c9c78c48ee30e5bde9a8f43fb0a98&libraries=services"></script>
        		<script>
            		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
            		var infowindow = new kakao.maps.InfoWindow({zIndex: 1});

            		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
            		var options = {
               		 //지도를 생성할 때 필요한 기본 옵션
                	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
               		level: 3 //지도의 레벨(확대, 축소 정도)
          	  		};

           		 	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

            		// 장소 검색 객체를 생성합니다
            		var ps = new kakao.maps.services.Places();

            		// 키워드로 장소를 검색합니다
            		ps.keywordSearch('${dcInfo.address }', placesSearchCB);

            		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
            		function placesSearchCB(data, status, pagination) {
                		if (status === kakao.maps.services.Status.OK) {

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 LatLngBounds 객체에 좌표를 추가합니다
                    var bounds = new kakao.maps.LatLngBounds();

                    for (var i = 0; i < data.length; i++) {
                        displayMarker(data[i]);
                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                    }

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    map.setBounds(bounds);
                }
           	 }

            		// 지도에 마커를 표시하는 함수입니다
            		function displayMarker(place) {
                		// 마커를 생성하고 지도에 표시합니다
                	var marker = new kakao.maps.Marker({
                   	 	map: map,
                    	position: new kakao.maps.LatLng(place.y, place.x)
                	});

                	// 마커에 클릭이벤트를 등록합니다
                	kakao.maps.event.addListener(marker, 'click', function () {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        infowindow.setContent(
                            '<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>'
                        );
                        infowindow.open(map, marker);
                    });
            	}
        	</script>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>
	
	<script>
	
	$(document).ready(function(){
        var address = $("#address").attr("value");
        
        console.log(address);
        
    	});
	
	</script>
</body>
</html>
