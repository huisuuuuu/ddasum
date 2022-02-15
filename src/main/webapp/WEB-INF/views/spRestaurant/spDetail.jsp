<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     
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
	
		<!-- 카카오 init -->
	    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('783ccfa0bb53c6324959cef647098759');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>   
    
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
	              	<c:if test="${sessionScope.member != null }">
 		              	<c:choose>
			              	<c:when test="${requestScope.map['sr'].bizCount != 0 && sessionScope.member.authorityId.equals('DREAM') }">
			              		<h3 style="color:red;">※ 당일 예약만 가능한 점 유의하시기 바랍니다.</h3>
			              	</c:when>
			              	
			              	<c:when test="${requestScope.map['sr'].bizCount == 0 }">
			              		<h3 style="color:red;">※ 금일 물량이 모두 소진되었습니다.</h3>
			              	</c:when>
			              	
			              	<c:otherwise>
			              		<h3 style="color:red;">※ 꿈나무 회원만 예약 가능합니다.</h3>
			              	</c:otherwise>
		              	</c:choose> 
	              	</c:if>
	              	<c:if test="${sessionScope.member == null }">
	              		<h3 style="color:red;">※ 꿈나무 회원만 예약 가능합니다.</h3>
	              	</c:if>
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
		                
		                    <div class="reservation">
		                    <c:choose>
		                    	<c:when test="${requestScope.map['sr'].bizCount != 0 && sessionScope.member.authorityId.equals('DREAM') }">
				              		<button type="button" class="reservation_btn" data-menuNo="${menu.menuNo }" data-menuNane="${menu.menuName }">예약하기</button>
				              	</c:when>
				              	<c:otherwise>
			                        <button class="reservationBtn" style="background-color:#FFEAE0" disabled="true">예약하기</button>
			                    </c:otherwise>
		                    </c:choose>    
		                    </div>
		                    
		                </div>
	                </c:forEach>
	                <br>
                </c:when>
                <c:otherwise>
                	<h3 style="color:red;">※ 등록된 메뉴가 없습니다.</h3>
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
        
<!--         <input id = "file" type="file" value="resources/images/logo.png" onChange=upload(); />
        <input id= "uploadUrl" type="text" hidden />
        <input id = "url" type="text" value="resources/images/logo.png" />
        <input id="scrapUrl" type="text" /> -->
		<script> //선택매뉴 예약
			$(".reservation_btn").click(function(){
				const menuNo = $(this).attr("data-menuNo");
				const menuNane = $(this).attr("data-menuName");
 				// 로그인 확인
				if(${sessionScope.member==null}){
					location = "#";
					alertWaring();
					return;
				}
 				if(${!sessionScope.member.authorityId.equals("DREAM")} ){
 					location = "#";
					alertWaring();
					return;
 				}
				alertReservation(menuNo, menuNane);
			});
		function alertWaring(title, content, icon, location){
			Swal.fire({
				  icon: "warning",
				  title: "예약실패",
				  text:  "예약은 드림회원만 가능합니다.",
				  confirmButtonText: "확인",
				  confirmButtonColor: "#FFA77E"
				}).then(function(){
				});
		};
		function alertReservation(menuNo, menuNane){
			Swal.fire({
				  icon: "info",
				  title: "당일에만 이용 가능합니다. <br> 예약 진행하시겠습니까?",
				  confirmButtonText: "예",
				  confirmButtonColor: "#FFA77E",
				  showCancelButton: true,
				  cancelButtonText: "아니오"				  
				}).then((result) => {
					if(result.isConfirmed){
						$.ajax({
            				url:"/spRestaurant/spRestaurantReservation.do",
            				type:"post",
            				data:{"bizNo":${requestScope.map['sr'].bizNo}, "menuNo":menuNo},
            				success:function(result){
    							console.log(result);
    							console.log(typeof(result));
    							
            					if(result=="true"){ // 예약 성공
	            					Swal.fire({
	            						  icon: "success",
	            						  title: "예약이 완료되었습니다.",
	            						  text: "예약 페이지로 이동하시겠습니까?",
	            						  confirmButtonText: "예",
	            						  confirmButtonColor: "#FFA77E",
	            						  showCancelButton: true,
	            						  cancelButtonText: "아니오"			  
	            						}).then((result) => {
	            							if(result.isConfirmed){
	            								location.replace("/member/reservationPage.do");
	            							}else{
	            								kakaoLinkAPI(menuNane);
	            							}
	            						})
            					}else{ // 예약 실패
	            					Swal.fire({
	            						  icon: "error",
	            						  title: "예약 실패!",
	            						  text: "사용한도가 초과되었습니다.",
	            						  confirmButtonText: "예",
	            						  confirmButtonColor: "#FFA77E",
	            						});
            					}		
            				},
            				error:function(){
            					console.log("서버 호출 실패");
            				}
						})
					}else{
						swal.fire({
							icon: "info",
							title: "예약을 취소하였습니다.",
							confirmButtonText: "확인"
						});
					};
				});
		};
		
/* 				//이미지 업로드
				function upload(){
					var files = document.getElementById('file').files;
					
					Kakao.Link.uploadImage({
					  file: files
					}).then(function(res){
					  document.getElementById('uploadUrl').value = res.infos.original.url;
					  console.log("dd");
					  console.log($("#uploadUrl").val());
					});	
					
				}; */

/* 				$("#url").click(function(){
	 				//이미지 스크랩
					var url = document.getElementById('url').value;
					console.log("url : " + url);
					Kakao.Link.scrapImage({
					  imageUrl: url
					}).then(function(res){
					  document.getElementById('scrapUrl').value = res.infos.original.url;
					  console.log("ee");
					  console.log($("#scrapUrl").val());
					}); 
				}) */

/* 				//이미지 삭제
				var url = document.getElementById('url').value;

				Kakao.Link.deleteImage({
				  imageUrl: url
				}); */

			  //kakao 링크 api
			  function kakaoLinkAPI(menuNane){
				  Kakao.Link.sendDefault({
					  objectType: 'location', //공유타입 -  지도공유 (option - feed, list, commerce, text)
					  address: "${requestScope.map['sr'].address }", //지도 주소
					  addressTitle: "${requestScope.map['sr'].bizName }", //주소 이름
					  content: {
					    title: '${requestScope.map['sr'].bizName }', // 콘텐츠 제목
					    description: menuNane, // 콘텐츠 설명
					    imageUrl: "http://k.kakaocdn.net/dn/b2WEO5/bl3tfdHehKl/TUlIyIrfsTRsBGzOK4wCZk/kakaolink40_original.png", // 링크공유 이미지
					    link: {
					      webUrl: '127.0.0.1/member/reservationPage.do',
					    },
					  },
				  });
        		}
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
		
        
        var coords;
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch("${requestScope.map['sr'].address }", function(result, status) {

            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {

                coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                	content: '<div style="width:150px;text-align:center;padding:0 0;">${requestScope.map['sr'].bizName }</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
               
            } 
        });
        //맵 재요청
        $("#mapLoad").click(function(){   
        	if($(this).hasClass("current")){
        		//지도 크기 변경시 레이아웃 다시 불러오기
        		map.relayout();	
        		//지도 중심좌표 다시 불러오기
        		map.setCenter(coords);
        	}
        	

        })
        </script>      
          
    </div>
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>      
</body>
</html>