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
	<!-- SweetAlert2 CDN -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            <img src="${requestScope.map['sr'].bizImage }" alt="식당이미지">
        </div>
        <div id="item_info">
            <div id="name">
                <img src="/resources/images/${requestScope.map['sr'].restaurant }.png" alt="">
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
            <br /><br /><br /><br /><br /><br /><br />
         <c:if test="${requestScope.map['sr'].bizCount eq 0 }">   
            <div style="color:red;">※ 오늘의 후원이 종료되었습니다.</div>
         </c:if>    
        </div>
        <div id="menu">
            <ul>
                <li class="tab_link current" data-tab="tab1">매뉴 예약</li>
                <li id="mapLoad" class="tab_link" data-tab="tab2">업체 정보</li>
            </ul>
            <hr class="underbar">
            
            <div id="tab1" class="tab_content current">
            <br>
            <c:choose>
              <c:when test="${!requestScope.map['mList'].isEmpty() }">
                <div class="msg">※ 당일 예약만 가능한 점 유의하시기 바랍니다.</div>
                <c:forEach items="${requestScope.map['mList'] }" var="menu">
	                <div class="menu">
	                    <div>
	                    <img src="${menu.menuImage }" alt="매뉴이미지">
	                    </div>
	                    <div class="menu_info">
	                        <div class="menu_name">
	                            ${menu.menuName }
	                        </div>
	                        <div class="menu_detail">
	                            ${menu.menuInfo }
	                        </div>
	                    </div>
	                <c:if test="${requestScope.map['sr'].bizCount != 0 }">     
	                    <div class="reservation">
	                        <button type="button" class="reservation_btn" data-menuNo="${menu.menuNo }">예약하기</button>
	                    </div>
	                </c:if>    
	                </div>
                </c:forEach>
                <br>
                </c:when>
                <c:otherwise>
                	매뉴가 없습니다.
                </c:otherwise>
            </c:choose>    
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
		<script> //선택매뉴 예약
			$(".reservation_btn").click(function(){
				const bizNo = ${requestScope.map['sr'].bizNo};
				const manuNo = $(this).attr("data-menuNo");
				const userNo = '${sessionScope.member.userNo}';
				const userArea = '${sessionScope.member.area}.substr(0,1)';
				const bizArea = "${requestScope.map['sr'].address}.substr(0,1)";
				
				let alertTitle = "예약실패";
				let alertContent = "예약은 드림회원만 가능합니다.";
				let alertIcon = "warning";
				let location = "#";
/* 				// 로그인 확인
				if(userNo!=null){
					location = "/member/loginPage.do"
					alertWaring(alertTitle, alertContent, alertIcon, location);
					return;
				}
				// 지역확인
				if(userArea!=bizArea){
					alertContent = "타 지역 식당은 예약할 수 없습니다.";
					alertWaring(alertTitle, alertContent, alertIcon, location);
					return;					
				} */
				alertReservation();
			});
		function alertWaring(title, content, icon, location){
			
			Swal.fire({
				  icon: icon,
				  title: title,
				  text: content,
				  confirmButtonText: "확인",
				  confirmButtonColor: "#FFA77E"
				}).then(function(){
				});
		};
		function alertReservation(){
			
			Swal.fire({
				  icon: "info",
				  title: "당일에만 이용 가능합니다. <br> 예약 진행하시겠습니까?",
				  confirmButtonText: "예",
				  confirmButtonColor: "#FFA77E",
				  showCancelButton: true,
				  cancelButtonText: "아니오",				  
				  cancelButtonTextColor: "#FF0000"
				}).then((result) => {
					if(result){
						$.ajax({
            				url:"/spRestaurant/spRestaurantReservation.do",
            				type:"post",
            				data:{"userNo": userNo, "bizNo":bizNo, "menuNo":menuNo},
            				success:function(){
            					Swal.fire({
            						  icon: "success",
            						  title: "예약이 완료되었습니다.",
            						  text: "예약 페이지로 이동하시겠습니까?",
            						  confirmButtonText: "예",
            						  confirmButtonColor: "#FFA77E",
            						  showCancelButton: true,
            						  cancelButtonText: "아니오",				  
            						  cancelButtonTextColor: "#FF0000"
            						}).then((result) => {
            							if(result){
            								location.replce("/member/reservationPage.do");
            							}
            						})
            				},
            				error:function(){
            					consol.log("서버 호출 실패");
            				}
						})
					}else{
						swal("예약을 취소하였습니다.");
					};
				});
		};
		</script>

        <script> // map
         var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F', function(result, status) {

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
        });
        //맵 재요청
        $("#mapLoad").click(function(){        
        	map.relayout();
        })
        </script>      
          
    </div>
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>      
</body>
</html>