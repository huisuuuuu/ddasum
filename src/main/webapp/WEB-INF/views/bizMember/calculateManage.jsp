<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		* div{
			box-sizing: border-box;
		}
		* {
			font-family: 'Noto Sans KR', sans-serif;
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
		#L-upArea{
			width: 100%;
			height:108px;
			background-color: rgba(255, 167, 126, 0.5);
		}
		#L-downArea{
			width: 100%;
			height:972px;
			background-color: rgba(255, 167, 126, 0.5);
			padding-left: 70px;
			padding-top: 100px;
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
			float: left;
		}
		#logoArea{
			width: 100px;
			height: 80px;
			margin: 0 auto;
		}
		#calculateManage{
			width: 95%;
			height: 85%;
			background-color: white;
			padding: 5px;
			border-radius: 20px;
			margin: 0 auto;
		}
		#R-searchArea{
			width: 95%;
			height: 25%;
			background-color: white;
			margin: 0 auto;
		}
		#R-content{
			width: 95%;
			height: 70%;
			background-color: white;
			margin: 0 auto;
			border-radius: 20px;
		}
		#content-title{
			width: 100%;
			height: 5%;
			font-size: 20pt;			
		}
		#content{
			width: 100%;
			height: 95%;
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
			border-bottom: 1px solid #A5A5A5;
		}
		.calculateTable{
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
		.Title{
			width: 120px;
			text-align: center;	
		}
		.menulist{
			font-size: 19pt;
		}
		.Icons{
			width: 30px;
		}
		.submenu{
			padding-left: 35px;
		}
		.submenu_hover{
			background-color:#FFF6F2;
			transition: 1s;
			margin-left: -10px;
			border-top-left-radius: 50px;
			border-bottom-left-radius: 50px;
		}
		#tableContetns{
			background-color: #FFA77E;
			color: white;
			font-size: 16pt;
		}
		#searchSection{
			width: 100%;
			height: 100%;
		}
		p { 
			display: block; 
			padding: 0 69px;
		}
		.confirmBTN{
			width: 100px;
			height: 35px;
			font-size: 14pt;
			color: white;
			border: none;
			background-color: #FFA77E;
			border-radius: 5px;
		}
	</style>
</head>
<body>
<div id="wrapper">
	<div id="leftArea">
		<div id="L-upArea">
			<div id="logoArea">
				<img class="Title" src="/resources/images/ddasum_header_logo.png" alt="로고" width="400px;">			
			</div>
		</div>
		<div id="L-downArea">
			<div class="submenu"> 
				<a href="/BizMember/bizManage.do"><br>	
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
					<span class="menulist">후원 정산 관리</span><br><br>
				</a>
			</div>
		</div>
	</div>
	<div id="rightArea">
		<div id="R-upArea">
			<div id="calculateManage">
				<h1>후원 정산 관리</h1>
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-searchArea">
				<h2>후원 정산 현황</h2>
				<br>
				<div id="searchSection">
					<span>검색기간</span>
					<input type="checkbox" name="daily">
					<span>일별</span>
					<input type="date"> ~ <input type="date">
					<button>어제</button>
					<button>1주일</button>
					<button>1개월</button>
					<p>
						<input type="checkbox" name="daily" >
						<span>월별</span>
						<input type="month">
						<select>
							<option value="">1월</option>
							<option value="">2월</option>
							<option value="">3월</option>
							<option value="">4월</option>
							<option value="">5월</option>
							<option value="">6월</option>
							<option value="">7월</option>
							<option value="">8월</option>
							<option value="">9월</option>
							<option value="">10월</option>
							<option value="">11월</option>
							<option value="">12월</option>
						</select>
					</p>
					 			
					<span>검색어</span>
					<select>
						<option value="">상품명</option>
						<option value="">예약번호</option>
					</select>
					<input type="text"/><br>
					<div style="text-align: center;">
						<input class="confirmBTN" type="submit" value="검색">
						<input class="confirmBTN" type="button" value="초기화">
					</div>
				</div>
					<hr>
			</div>

			<div id="R-content">
				<div id="content">
					<div id="content-title">
						<span style="text-align:left; float:left;">기간별 후원 정산 내역 검색 결과 10건</span>
						<div class="search" style="text-align:right;">
							 <img width=30px; src="/resources/images/bizExcel.png"/>
						</div>
					</div>
					<div id="content">
						<table class="calculateTable">
							<tr id="tableContetns">
			 					<th>번호</th>
			 					<th>후원일자</th>
			 					<th>후원유형</th>
			 					<th>예약번호</th>
			 					<th>업체명</th>
			 					<th>상품명</th>
			 					<th>후원금액</th>
			 				</tr>
							<tr>
								<td>1</td>
								<td>2021-01-31</td>
								<td>할인</td>
								<td>20220131001</td>
								<td>가나식당</td>
								<td>김치찌개</td>
								<td>6000</td>
							</tr>
						</table>
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