<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원식당 상세보기</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	<!-- kakao cdn -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>   
    <!-- kakao map service lib-->
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=783ccfa0bb53c6324959cef647098759&libraries=services"></script>    

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/spDetail.css">
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>	
	
    <div id="content_wrapper">
        <div id="page_title">
            <a style="all:unset;" href="/spRestaurant/spRestaurantList.do">후원식당</a> > <strong>상세페이지</strong>
        </div>
        <div id="item_image">
            <img src="${requestScope.map['sr'].bizImage }" alt="">
        </div>
        <div id="item_info">
            <div id="name">
                <img src="/resources/images/unlock_Checked.png" alt="">
                <div>${requestScope.map['sr'].bizName }</div>
            </div>
            <div class="item_info">
                <img src="/resources/images/phone-call.png" alt="">
                <div>${requestScope.map['sr'].bizPhone }</div>
            </div>
            <div class="item_info">
                <img src="/resources/images/location.png" alt="">
                <div>${requestScope.map['sr'].address }</div>
            </div>
            <div class="item_info">
                <img src="/resources/images/operationHour.png" alt="">
                <div>${requestScope.map['sr'].bizTime }</div>
            </div>
        </div>
        <div id="menu">
            <ul>
                <li class="tab_link current" data-tab="tab1">매뉴 예약</li>
                <li class="tab_link" data-tab="tab2">업체 정보</li>
            </ul>
            <hr class="underbar">
            
            <div id="tab1" class="tab_content current">
            <br>
            <choose>
              <when test="${!requestScope.map['mList'].isEmpty() }">
                <div class="msg">※ 당일 예약만 가능한 점 유의하시기 바랍니다.</div>
                <div class="menu">
                    <div>
                    <img src="${requestScope.map['mList'].menuImage }" alt="">
                    </div>
                    <div class="menu_info">
                        <div class="menu_name">
                            ${requestScope.map['mList'].menuName }
                        </div>
                        <div class="menu_detail">
                            ${requestScope.map['mList'].menuInfo }
                        </div>
                    </div>
                    <div class="reservation">
                        <button type="button" class="reservation_btn">예약하기</button>
                    </div>
                </div>
                <br>
                </when>
                <otherwise>
                	매뉴가 없습니다.
                </otherwise>
            </choose>    
            </div>
            <div id="tab2" class="tab_content">
            <br>
                <img src="/resources/images/location.png" alt="">
                <div id="address">
                    ${requestScope.map['sr'].address }
                </div>
                <div id="map">
                    
                </div>
            </div>
        </div>

        <script> //menu tab
            $(".tab_link").click(function(){
                let tabId = $(this).attr("data-tab");
                $(".tab_link").removeClass("current");
                $(".tab_content").removeClass("current")
                
                $(this).addClass("current");
                $("#"+tabId).addClass("current");
                
            })
        </script>


        <script> // map
/*             Kakao.init('783ccfa0bb53c6324959cef647098759');
Kakao.isInitialized();
        var mapContainer = $("#map"), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });     */
        </script>        
    </div>
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>      
</body>
</html>