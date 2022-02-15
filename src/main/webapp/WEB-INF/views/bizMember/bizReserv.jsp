<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/commons/bizNavigation.css">

<title>Insert title here</title>
	<style>
		* div{
			box-sizing: border-box;
		}
     * {
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
            margin : 0px;
			padding : 0px;
        }
		* a{
        text-decoration: none;
        color: inherit;
    	}
		#wrapper{
			width: 1920px;
			height: 1080px;
			margin: 0 auto;
		}
		#leftArea{
			width: 400px;
			height: 100%;
			float: left;
		}
		#rightArea{
			width: 1520px;
			height: 100%;		
			float: left;
		}
		#R-upArea{
			width: 100%;
			height:108px;
			background-color: rgba(255, 211, 190, 0.2);
		}
		#R-downArea{
			width: 100%;
			height:972px;
			background-color: rgba(255, 211, 190, 0.2);
		}
		#reservManage{
			width: 95%;
			height: 85%;
			background-color: white;
			padding: 5px;
			border-radius: 20px;
			margin: 0 auto;
		}
		#R-content{
			width: 95%;
			height: 95%;
			background-color: white;
			margin: 0 auto;
			border-radius: 20px;
		}
		#content-title{
			width: 100%;
			height: 10%;
			border-top-left-radius: 20px;
			border-top-right-radius: 20px;
			font-size: 20pt;			
		}
		#content{
			width: 100%;
			height: 90%;
		}
		#content-L{
			width: 30%;
			height: 100%;
			float: left;
			background-color: skyblue;
			border-bottom-left-radius: 20px;
		}
		#content-R{
			width: 15%;
			height: 100%;
			float: left;
		}
		#content-result{
			width: 55%;
			height: 100%;
			float: left;
			border-bottom-right-radius: 20px;
		}
		ul{
			list-style: none;
			font-size: 18pt;
			padding: 0;
		}
		li{
		list-style: none;
			font-size: 18pt;
			padding: 10px;
			text-align: center;
		}
		#typeOption{
			width: 120px;
			height: 30px;	
			font-size: 18pt;
		}
		.reservTable{
			width: 100%;
			text-align: center;
		    border-collapse: collapse;
		}
		th, td {
		  border: 1px solid #A5A5A5;
		}
		th{
			height: 30px;
		}
		td{
			height: 70px;
		}
		h1{
		float: left;
		font-size: 23pt;
		padding-top: 20px;
		}
		.bizSmallImage{
				float: right;
		}
		.smaillimg{
					padding-top: 25px;
					padding-right: 10px;
					width:40px;
		}
		.bizId{
			float: right;
			font-size: 16pt;
			text-align: center;		
			padding-right: 20px;
			padding-top: 25px;
		}
		.logout{
			float: right;
			font-size: 16pt;
			padding-top: 25px;
		}
		#searchBTN{
			width: 20px;
		}
/*page navi*/

	#page_wrap {
			margin-top: 10px;
			margin-bottom: 10px;
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
		    border-radius: 100%;
			width: 35px;
		}
		#page_wrap .page_ul li a.page_active {
		    background-color: #FFA77E;
		    border-radius: 50%;
		    color: #fff;
		} 
		
		
	</style>
</head>
<body>
<div id="wrapper">
	<div id="leftArea">
		<div id="L-upArea">
			<div id="logoArea">
				<a href="/">
					<img class="Title" src="/resources/images/ddasum_header_logo.png" alt="로고">
				</a>
			</div>
		</div>
		<div id="L-downArea">
			<div class="submenu"> 
				<a href="/bizMember/bizManage.do"><br>	
					<img class="Icons" src="/resources/images/bizSubMenu1.png" alt="로고">
					<span class="menulist">업체 관리</span><br><br>
				</a>
			</div>
			<div class="submenu"> 
				<a href="/BizMember/goodsManage.do"><br>
					<img class="Icons" src="/resources/images/bizSubMenu2.png" alt="로고">
					<span class="menulist">상품 관리</span><br><br>
				</a>
			</div>
			<div class="submenu"> 
				<a href="/BizMember/bizReserv.do"><br>
					<img class="Icons" src="/resources/images/bizSubMenu3.png" alt="로고">
					<span class="menulist">예약 관리</span><br><br>
				</a>
			</div>
			<div class="submenu"> 
				<a href="/BizMember/calculateManage.do"><br>
					<img class="Icons" src="/resources/images/bizSubMenu4.png" alt="로고">
					<span class="menulist">정산 관리</span><br><br>
				</a>
			</div>
		</div>
	</div>
	<div id="rightArea">
		<div id="R-upArea">
			<div id="reservManage">
				<h1>예약 관리</h1>
					<span class="logout">
						<a href="/BizMember/logout.do">로그아웃</a>
					</span>
					<span class="bizId"> ${sessionScope.bizMember.bizName } </span>
					<span class="bizSmallImage"> <img class="smaillimg" src="${sessionScope.bizMember.bizImage }">
					</span>				
				
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-content">
				<div id="content">
					<div id="content-title">
						<span style="text-align:left; float:left;">전체 ${requestScope.detailTotalCount }건</span>
						<div class="search" style="text-align:right;">
							<form action="/bizMember/searchReserv.do" method="get" id="addForm">
							<select name='type' id='searchType'>
								<option value='userName'>회원명</option>
								<option value='reNo'>예약번호</option>
							</select>
							<input type="text" id= searchKeyword name='keyword' placeholder="검색어를 입력해주세요">
   							<input type="image" id="searchBTN" src="/resources/images/search.png" alt="제출버튼">
							</form>

						</div>
					</div>
					<div id="content">
					
					<c:choose>
						<c:when test="${!requestScope.list.isEmpty() }">					
						<table class="reservTable">
							<tr>
			 					<th>번호</th>
			 					<th>회원명</th>
			 					<th>예약상품</th>
			 					<th>예약일</th>
			 					<th>예약번호</th>
			 					<th>예약취소</th>
			 				</tr>
						<c:forEach items="${requestScope.list }" var="m" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${m.userName } </td>
								<td>${m.menuName } </td>
								<td>${m.reservationDate } </td>
								<td>${m.reNo } </td>
								<td>${m.reCancle }</td>
							</tr>
						</c:forEach>
						</table>
						</c:when>
						<c:otherwise>
							<H1>현재 저장된 예약내역이 없습니다.</H1>
						</c:otherwise>
			
					</c:choose>
					</div>
					<!-- paging -->
                    <div id="page_wrap">
                        <ul class="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/BizMember/bizReserv.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a class="page_active" href='/BizMember/bizReserv.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a class="page_inactive" href='/BizMember/bizReserv.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/BizMember/bizReserv.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
        $('.submenu').hover(function() {
            $(this).addClass('submenu_hover');
        }, function() {
            $(this).removeClass('submenu_hover');
        });
    });
</script>
</body>
</html>