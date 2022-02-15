<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
      crossorigin="anonymous"></script>
	<!-- kakao cdn -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<link rel="stylesheet" href="/resources/css/reservationCheckPage.css">
</head>
		<!-- 카카오 init -->
	    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('783ccfa0bb53c6324959cef647098759');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>  
<body>
<div id=header>
         <%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
    </div>
   
    <div id=content>
        <div class="content-side-back"></div>
        <div id="content-center">
            <div id="content-center-empty-top-area1"></div>
            <div id="resolvation-title-area">
                
                    <h1>예약 내역 확인</h1>
                    <div id="under"></div>
            </div>
            <div id="content-center-empty-top-area2"></div>
            <div id="all-resolvation-count"><span>전체 100건</span></div><br>
            <div id="resolvation-list-area">
            <c:choose>
				<c:when test="${!requestScope.map.list.isEmpty() }">
	                <table id="list-table">
	                   <tr>
	                        <th style="width: 240px;">예약 상품</th>
	                        <th>예약 유형</th>
	                        <th>예약 일자</th>
	                        <th>예약 번호</th>
	                        <th>예약 정보 전송</th>
	                        <th>예약 상태</th>
	                        <th style="width: 100px;">예약 취소</th>
	                    </tr>
	                    <c:forEach items="${requestScope.map.list }" var="d">
	                    <tr>
	                        <td style="padding-left: 10px;"><div id="shop-img"><img src="${d.bizImage }" style="width:90px; height: 90px; border-radius: 45px;"></div><div id="shop-name-menu-area"><b><span>${d.bizName }</span></b><br><span>${d.menuName }</span></div></td>
	                        <c:choose>
		                        <c:when test="${d.authorityId eq 'SP'}">
		                        	<td>후원</td>
		                        </c:when>
		                        <c:when test="${d.authorityId eq 'DC'}">
		                        	<td>할인</td>
		                        </c:when>
	                        </c:choose>
	                        <td>${d.reservationDate }</td>
	                        <td>${d.reNo }</td>
	                        <td data-res="${d.authorityId}" data-reNo="${d.reNo }" data-bizName="${d.bizName }" data-menuName="${d.menuName }"  data-address="${d.address }" data-menuInfo="${d.menuInfo }" data-originalPrice="${d.originalPrice }" data-dcPrice="${d.dcPrice }"><button class="kakao"  id="number-Btn">카카오톡 전송</button></td>                
	                       	<c:choose>
								<c:when test="${d.reCancle eq 'N'.charAt(0)}">
			                        <td>예약완료</td>
			                        <td><a href="/member/reservationCancle.do?reNo=${d.reNo }"> <button id="cancel" class="cancelBtn" >예약취소</button></a></td>	 
		                        </c:when>
		                        <c:otherwise>
			                        <td style="color:red;">예약취소  </td>
			                        <td></td>
		                        </c:otherwise>
	                        </c:choose>
	                        
                        	                      
	                    </tr>
	                    </c:forEach>
					<tr align="center">
					<td colspan="7">
					<div id="page_wrap">
					    <ul class="page_ul">
					    	<li>
					        ${requestScope.map.pageNavi }
					        </li>
					    </ul>
					</div>
					</td>
					</tr>
				</table>
				</c:when>
				<c:otherwise>
				
					<h1 style="margin:0 auto;">현재 저장된 회원 목록이 없습니다.</h1>
				</c:otherwise>
		</c:choose>
			
            </div>
            <div id="content-center-empty-center-area"></div>
            	
            <div id="content-center-empty-bottom-area"></div>
        </div>
        <div class="content-side-back"></div>
    </div>
   
   
   
    <div id=footer>
       <%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
   </div>
   
   <script>
        $('#notice-button').hover(function() {
            $('#hover-menu1').css("display", "block");
        }, function() {
            $('#hover-menu1').css("display", "none");
        });


        $('#header-myPage-hover-text').hover(function() {
            $('#hover-menu2').css("display", "block");
        }, function() {
            $('#hover-menu2').css("display", "none");
        });
        
        
        $('.cancelBtn').click(function(){
			
        	var data = $(this).html();
			
			if(data =='예약취소'){
				return window.confirm("예약을 취소하시겠습니까?");
			}
		});
        
    </script>
 	<script>
 	  //kakao link api
	  //function kakaoLinkAPI(){
 		  /* $(document).on("click", ".more_option", function () { */
 		  $(".kakao").click(function(){
 			
 		  const res = $(this).parent().attr("data-res");
 		  const reNo = $(this).parent().attr("data-reNo");
 		  const bizName = $(this).parent().attr("data-bizName");
 		  const address = $(this).parent().attr("data-address");
 		  const menuName = $(this).parent().attr("data-menuName");
 		  const menuInfo = $(this).parent().attr("data-menuInfo");
 		  const oPrice = $(this).parent().attr("data-originalPrice");
	      const dPrice = $(this).parent().attr("data-dcPrice");
		  /* 	      
 		  console.log(res);
 		  console.log(reNo);
 		  console.log(bizName);
 		  console.log(address);
 		  console.log(menuName);
 		  console.log(menuInfo);
 		  console.log(oPrice);
 		  console.log(dPrice);
 		  */
 		  if(res=='SP'){
 			 sendSpLink();
 			 return;
 		  }else{ 
 		      sendDcLink();
 		      return;
 		  	}

 		 function sendDcLink() {
		    Kakao.Link.sendDefault({
				  objectType: 'location', //공유타입 -  지도공유 (option - feed, list, commerce, text)
				  address: address, //지도 주소
				  addressTitle: bizName, //주소 이름
				  content: {
				    title: bizName + "(예약번호 : " + reNo + ")", // 콘텐츠 제목
				    description: menuName, // 콘텐츠 설명
				    imageUrl: "http://k.kakaocdn.net/dn/b2WEO5/bl3tfdHehKl/TUlIyIrfsTRsBGzOK4wCZk/kakaolink40_original.png", // 링크공유 이미지
				    link: {
				      webUrl: '127.0.0.1/member/reservationPage.do',
				    },
				  },
				   buttons: [
				        {
				          title: '웹으로 보기',
				          link: {
				            mobileWebUrl: '127.0.0.1/member/reservationPage.do',
				            webUrl: '127.0.0.1/member/reservationPage.do',
				          },
				        },
				      ],
				  }
			  );
 		 }
 		 
 		 function sendSpLink() {
 		  Kakao.Link.sendDefault({
				  objectType: 'location', //공유타입 -  지도공유 (option - feed, list, commerce, text)
				  address: address, //지도 주소
				  addressTitle: bizName, //주소 이름
				  content: {
				    title: bizName + "(예약번호 : " + reNo + ")", // 콘텐츠 제목
				    description: menuName, // 콘텐츠 설명
				    imageUrl: "http://k.kakaocdn.net/dn/b2WEO5/bl3tfdHehKl/TUlIyIrfsTRsBGzOK4wCZk/kakaolink40_original.png", // 링크공유 이미지
				    link: {
				      webUrl: '127.0.0.1/member/reservationPage.do',
				    },
				  },
				   buttons: [
				        {
				          title: '웹으로 보기',
				          link: {
				            mobileWebUrl: '127.0.0.1/member/reservationPage.do',
				            webUrl: '127.0.0.1/member/reservationPage.do',
				          },
				        },
				      ],
				  }
			  );
 		 }
     });

 	</script>
</body>
</html>