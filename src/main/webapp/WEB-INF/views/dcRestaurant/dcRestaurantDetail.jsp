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
				<span id="reservation">메뉴 예약</span> <span id="restaurantLocation">업체 정보</span>
			</div>
				<input type="hidden" id="bizNo" value="${dcInfo.bizNo }">
				<input type="hidden" id="userNo" value="${sessionScope.member.userNo }">
				<input type="hidden" id="authorityId" value="${sessionScope.member.authorityId }">
				<input type="hidden" id="address" value="${sessionScope.member.address }">
			<div id="menu">
			<c:choose>
				<c:when test="${!dcMenu.isEmpty()}">
				<c:choose>
					<c:when test="${sessionScope.member.authorityId ne 'DREAM'}">
						<h3>※ 꿈나무 회원만 예약 가능합니다.</h3>
					</c:when>
					<c:when test="${dcInfo.area ne '[sessionScope.member.address]'}">
						<c:choose>
							<c:when test="${dcInfo.area eq 'SEOUL' }">
								<h3>※ 서울 거주자만 예약 가능합니다.</h3>
							</c:when>
							<c:when test="${dcInfo.area eq 'INCHEON' }">
								<h3>※ 인천 거주자만 예약 가능합니다.</h3>
							</c:when>
							<c:when test="${dcInfo.area eq 'GYEONGGI' }">
								<h3>※ 경기도 거주자만 예약 가능합니다.</h3>
							</c:when>
						</c:choose>
					</c:when>
					<c:otherwise>
						<h3>※ 당일 예약만 가능한 점 유의하시기 바랍니다.</h3>
					</c:otherwise>
					</c:choose>	
               			<c:forEach items="${dcMenu}" var="m">
						<div class="food">
						<img src="${m.menuImage }">
						<div>
							<p>${m.menuName }</p>
							<p class="explain">${m.menuInfo }</p>
							<span class="price">${m.originalPrice }원</span><span class="salePrice">${m.dcPrice }원</span>
						</div>
						<c:choose>
							<c:when test="${sessionScope.member.authorityId ne 'DREAM'}">
								<button class="reservationBtn" style="background-color:#FFEAE0" disabled="true">예약하기</button>
							</c:when>
							<c:when test="${dcInfo.area ne '[sessionScope.member.address]' }">
								<button class="reservationBtn" style="background-color:#FFEAE0" disabled="true">예약하기</button>
							</c:when>
							<c:otherwise>
								<button class="reservationBtn" value="${m.menuNo }">예약하기</button>
							</c:otherwise>
						</c:choose>
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
	
	<script>
	
	$(document).ready(function(){
        var address = $("#address").attr("value");
        
        console.log(address);
        
    	});
	
	
		$('.reservationBtn').click(function(){
			
			var bizNo = $('#bizNo').val();
			var userNo = $('#userNo').val();
			var authorityId = $('#authorityId').val();
			var menuNo = $(this).attr("value");
			
			console.log(userNo,authorityId,menuNo);
			
			Swal.fire({
	            title: '당일에만 이용 가능합니다.',
	            text: "예약 진행하시겠습니까?",
	            icon: "info",
	            showCancelButton: true,
	            confirmButtonText: '예',
	            cancelButtonText: '아니오',
	            showLoaderOnConfirm: true,
	            preConfirm: () => {
	                
	            	$.ajax({
	            		
	              		 url: "/dcRestaurant/reservation.do",
	            		 data: {"bizNo":bizNo, "userNo":userNo, "menuNo":menuNo},
	            		 type: "get",
	            		 success: function(result){
	            			 
	            			 if(result=="true"){
	            				 
	            			 Swal.fire({
	            		            title: '예약이 완료되었습니다.',
	            		            text: "예약 페이지로 이동하시겠습니까?",
	            		            icon: "success",
	            		            showCancelButton: true,
	            		            confirmButtonText: '예',
	            		            cancelButtonText: '아니오',
	            		            showLoaderOnConfirm: true,
	            		            preConfirm: () => {
	            			 
	   									location.href='/member/reservationPage.do';
	   								}
	            			 })
	   							$('.swal2-styled.swal2-confirm').css('background-color','#F8976A');
	            			 
	            			 }else{
	            				 Swal.fire({
	       						  icon: 'success',
	       						  title: '예약 실패',
	       						  text: '잔여 이용 횟수를 확인해주세요.'
	       						})
	       						
	       						$('.swal2-styled.swal2-confirm').css('background-color','#F8976A');
	         					$('.swal2-styled.swal2-confirm').html('확인');
	            			 
	            			 };
	            		 },
	            		 error: function(){
	            			 console.log('ajax 통신 실패');
	            		 }
	            		
	            	})
	            }
	        });
		});
	
	</script>
</body>
</html>
