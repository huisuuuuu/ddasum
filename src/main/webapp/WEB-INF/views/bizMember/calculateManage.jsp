<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			height:952px;
			background-color: rgba(255, 211, 190, 0.2);
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
		#R-content{
			width: 95%;
			height: 65%;
			background-color: white;
			margin: 0 auto;
			border-radius: 20px;
		}
		#content-title{
			width: 100%;
			height: 10%;
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
		#R-searchArea{
			width: 95%;
			height: 25%;
			background-color: white;
			margin: 0 auto;
			border-top-left-radius: 20px;
			border-top-right-radius: 20px;
		}
		#confirmArea{
			text-align: center;
			width: 95%;
			height: 5%;
			background-color: white;
				
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
			<div id="calculateManage">
				<h1>후원 정산 관리</h1>
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-searchArea">
				<h2>후원 정산 현황</h2>
				<hr>
				<br>
				검색기간  <input type="checkbox" name="daily" >일별
						<input type="date"> ~ 
						<input type="date">
						<button>어제</button>
						<button>1주일</button>
						<button>1개월</button>
						<br>
						<input type="checkbox" name="daily" >월별
						
						<br>
						

				검색어 <select>
					<option value="">상품명</option>
					<option value="">예약번호</option>
					</select>
					<input type="text"/>
					<br>
					<hr>
					<br>
			</div>
				<div id="confirmArea">
					<input type="submit" value="검색">
					<input type="button" value="초기화">
				</div>
			<div id="R-content">
				<div id="content">
					<div id="content-title">
						<span style="text-align:left; float:left;">기간별 후원 정산 내역 검색 결과 10건</span>
						<div class="search" style="text-align:right;">
							<input type="submit" value="엑셀">
						</div>
					</div>
					<div id="content">
						<table class="calculateTable">
							<tr>
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

</body>
</html>