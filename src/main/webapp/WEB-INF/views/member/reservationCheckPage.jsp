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
</head>
<style>
    * div {
        box-sizing: border-box;
    }

    * a {
        color: white;
        text-decoration: none;
    }

    * hr {
        margin-top: 0px;
        width: 85%;
        background-color: #707070;
        border: 0px;
        height: 1px;
        margin-left: 50px;
    }

    /*헤더*/
    #header {
        min-width: 1500px;
        width: 100%;
        height: 105px;
        background-color: rgba(255, 167, 126, 0.5);
    }

    #header-logo-area {
        /*로고*/
        width: 20%;
        height: 105px;
        float: left;
    }

    #header-logo-img {
        width: 79px;
        height: 66px;
        margin: 18px 0px 0px 80px;
    }

    #header-meun-area {
        /*센터메뉴*/
        width: 60%;
        height: 100%;
        float: left;
        margin: 0 auto;
        text-align: center;
    }

    #header-menu-ul {
        margin: auto;
        padding: 0px;
        width: 100%;
        height: 65%;
        line-height: 105px;
    }

    #header-menu-ul>li {
        height: 100%;
        width: 10%;
        line-height: 35px;
        display: inline-block;
        text-align: center;

    }

    #header-menu-ul>li>a {
        width: 100%;
        height: 100%;
        color: white;
        font-family: 'Noto Sans KR';
        text-decoration: none;
        font-size: 16px;
        display: block;
    }

    #header-login-area {
        /*로그인쪽*/
        width: 20%;
        height: 80%;
        float: left;
        text-align: center;
        font-family: 'Noto Sans KR';
        font-size: 16px;
        line-height: 105px;

    }

    #header-login-text {
        width: 100%;
        height: 100%;
        color: white;
        text-decoration: none;

    }


    #hover-menu1 {
        /*고객센터 호버시 나오는 서브메뉴*/
        width: 170px;
        height: 40px;
        background-color: black;
        border-radius: 20px;
        margin-left: -15px;
        position: absolute;
    }

    .hover-text1 {
        color: white;
        font-family: 'Noto Sans KR';
        font-size: 11px;
    }

    /*새로운 호버*/
    #header-myPage-hover-text {
        width: 50%;
        color: white;
        text-decoration: none;
        float: left;

    }

    #header-logout-text {
        width: 20%;
        height: 10%;
        text-decoration: none;
        float: left;
    }

    #hover-menu2 {
        /*아이디 호버시 나오는 서브메뉴*/
        width: 140px;
        line-height: 40px;
        background-color: white;
        border-radius: 15px;
        text-align: left;
        margin-left: 45px;
        padding-left: 10px;
        position: absolute;
    }

    .hover-text2 {
        color: black;
        font-family: 'Noto Sans KR';
        font-size: 14px;
    }
     
      /*컨텐츠*/
    #content{
        min-width: 1500px;
        width: 100%;
    }
    .content-side-back{/*사이드 빈공간*/
        border: 1px solid white;
        width: 15%;
        float: left;
    }
    #content-center{/*중앙 컨텐츠 공간*/
        width: 70%;
        float: left;
    }
    #content-center-empty-top-area1{
        width: 100%;
        height: 100px;
    }
    #resolvation-title-area {
        /*예약내역확인 타이틀*/
        padding-top: 10px;
        width: 100%;
        height: 156px;
        text-align: center;
        font-family: 'Noto Sans KR';
        font-size: 22px;
        font-weight: bolder;
    }
    #under {
        width: 80px;
        height: 5px;
        margin-bottom: 30px;
        background: #FFA77E;
        position: relative;
        display: inline-block;
    }
    #content-center-empty-top-area2{
        width: 100%;
        height: 95px;
    }
     #resolvation-list-area{/*내역리스트 시작*/
         width: 100%;
         height: 550px;
     }
     #list-table{
         width: 100%;
         text-align: center;
         font-family: 'Noto Sans KR';
     }
     table td{
         border-bottom: 1px solid black;
         height: 100px;
     }
     table th{
         background-color: rgba(255,167,126,0.3);
     }
     #shop-img{
         border: 1px solid black;
         width: 90px;
         height: 90px;
         border-radius: 45px;
         float: left;
     }
     #shop-name-menu-area{
         float: left;
         width: 60%;
         height: 90px;
         padding-left: 10px;
         padding-top: 20px;
     }
     #content-center-empty-center-area{
         width: 100%;
         height: 50px;
     }
     #shop-list-page-navi{
         width: 100%;
         height: 50px;
         text-align: center;
     }
     #content-center-empty-bottom-area{
         width: 100%;
         height: 50px;
     }
     
     
     
     /*푸터*/
    #footer {
        min-width: 1500px;
        width: 100%;
        height: 150px;
        background-color: #5D5D5D;
        opacity: 0.8;
        float: left;
    }

    #footer-img-area {
        width: 15%;
        height: 100%;
        float: left;
    }

    #footer-img {
        width: 79px;
        height: 66px;
        margin: 50px 0px 0px 80px;
    }

    #footer-text-area {
        width: 85%;
        height: 100%;
        float: left;
    }

    #footer-text {
        width: 50%;
        height: 50%;
        margin-top: 60px;
        color: white;
        font-weight: 400;
        font-size: 14px;
    }

    
    
    
    
    
    
    
    
    
    #page_wrap {
    width: 100%;
}
#page_wrap .page_ul {
    display: table;
    margin : 0 auto;
}
#page_wrap .page_ul li {
    display: block;
    width: 35px;
    height: 35px;
    float: left;
    text-align: center;
    margin: 0 5px;
    line-height: 15.5px;
    font-size: 16px;
    color: #2A2A2A;
}
#page_wrap .page_ul li a {
    display: block;
    font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
	color: #2A2A2A;
    padding: 10px;
    border-radius: 50%;
/*     transition: ease 0.3s; */
}
#page_wrap .page_ul li a.page_active {
    background-color: #FFA77E;
    border-radius: 50%;
    color: #fff;
}
    </style>
<body>
<div id=header>
        <div id="header-logo-area">
            <a href=""><img id="header-logo-img" src="/resources/images/ddasum_header_logo.png"></a>
        </div>
        <div id="header-meun-area">
            <ul id="header-menu-ul">
                <li><a href="">스토리</a></li>
                <li><a href="">후원식당</a></li>
                <li><a href="">할인식당</a></li>
                <li><a href="">커뮤니티</a></li>
                <li id="notice-button">
                    <a href="">고객센터</a>
                    <div id="hover-menu1" style="display: none">
                        <a class="hover-text1" href="">공지사항</a> &nbsp;&nbsp; <a class="hover-text1" href="">자주 묻는 질문</a>
                    </div>
                </li>
            </ul>
        </div>
        <div id="header-login-area">
            <div id="header-myPage-hover-text"><a href="">${sessionScope.member.userId } 님</a>
                <div id="hover-menu2" style="display: none">
                    <div id="myPage-img-area">
				               <img src="/resources/images/user.png" style="width: 18px; padding-right: 5px">
				               <a class="hover-text2" href="/member/myPage.do">마이페이지</a>
			               </div>
			               <div id="resolvation-check-img-area">
				               <img src="/resources/images/reception-bell.png" style="width: 18px; padding-right: 5px">
				               <a class="hover-text2" href="/member/reservationPage.do">예약 내역 확인</a>
			               </div>
                </div>
            </div>
            <div id="header-logout-text"><a href="">로그아웃</a></div>
        </div>
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
	                        <th >예약 상태</th>
	                        <th style="width: 100px;">예약 취소</th>
	                    </tr>
	                    <c:forEach items="${requestScope.map.list }" var="d">
	                    <tr>
	                        <td style="padding-left: 10px;"><div id="shop-img"><img src="${d.bizImage }" style="width:100px; height: 100px; border-radius: 50px;" ></div><div id="shop-name-menu-area"><b><span>${d.bizName }</span></b><br><span>${d.menuName }</span></div></td>
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
	                        
	                        <td>예약완료</td>
	                        	
                     		
	                        <td>	         
		                        <button class="cancelBtn" data1="${d.reCancle }" data2="${d.reNo }">예약취소</button>	
	                        </td>
		                  
	                    </tr>
	                    </c:forEach>
					<tr align="center">
					<td colspan="6">
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
       <div id="footer-img-area">
           <img id="footer-img" src="/resources/images/ddasum_footer_logo.png">
       </div>
       <div id="footer-text-area">
          <div id="footer-text">
            <p>07212 서울특별시 영등포구 선유동2로 57 이레빌딩 TEL : 02-1544-9970</p>
            <p>COPYRIGHT ⓒ 나눠조. ALL RIGHTS RESERVED.</p>
          </div>
       </div>
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
        	var reCancle = $(this).attr('data1');
        	var reNo = $(this).attr('data2');
			var text = $(this).closest('tr');
			
			var $text2 = text.find('td:eq(4)');
			
        	var $this = $(this);
			$.ajax({
				url : "/member/reservationCancle.do",
				data : {"reCancle":reCancle,"reNo":reNo},
				type : "post",
				success : function(result){
					if(result == "true"){
						alert('취소성공');
						$this.css("display", "none");
						$text2.html('예약취소');
						$text2.css("color","red");
					}else{
						alert('변경실패');
					}
				},
				error : function(){
					console.log('ajax 통신 에러');
				}
				
			});
			
		});
        
    </script>
 
</body>
</html>