<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		* div{
			box-sizing: border-box;
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
		#logoArea{
			width: 100px;
			height: 80px;
			margin: 0 auto;
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
			border-bottom: 1px solid #A5A5A5;
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
		.Title{
			width: 120px;
			text-align: center;	
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
		</div>
	</div>
	<div id="rightArea">
		<div id="R-upArea">
			<div id="reservManage">
				<h1>후원 상품 관리</h1>
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-content">
				<div id="content">
					<div id="content-title">
						<span style="text-align:left; float:left;">전체 1000건</span>
						<div class="search" style="text-align:right;">
							<select>
								<option>회원명</option>
								<option>예약번호</option>
							</select>
							<input type="text" placeholder="검색어를 입력해주세요">
							<input type="submit" value="아이콘">
						</div>
					</div>
					<div id="content">
						<table class="reservTable">
							<tr>
			 					<th>번호</th>
			 					<th>회원면</th>
			 					<th>예약상품</th>
			 					<th>예약일</th>
			 					<th>예약번호</th>
			 					<th>예약상태</th>
			 				</tr>
							<tr>
								<td>1</td>
								<td>홍길동</td>
								<td>김치찌개</td>
								<td>2022.01.31</td>
								<td>20220131001</td>
								<td>예약완료</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>