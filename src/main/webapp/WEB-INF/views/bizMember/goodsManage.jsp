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
		#goodsManage{
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
		.modifyBTN{
			float: right;
			width: 120px;
			height: 40px;
			font-size: 18pt;
		}
		#bizImg{
			width: 250px;
			height: 250px;
			border-radius: 250px;
			background-color: white;
			margin: 0 auto;
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
		
		.goodsTable{
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
		button{
			padding: 10px;
		    border: none;
    		border-radius: 8px;
			background-color: #E6510B;
    		color: white;
		}
		.prdtEdt{
			border: none;
			background-color: #FFA77E;
			border-radius: 23px;
			color: white;
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
			<div id="goodsManage">
				<h1>후원 상품 관리</h1>
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-content">
				<div id="content">
					<div id="content-title">
						<span style="text-align:left; float:left;">전체 10건</span>
						<div class="search" style="text-align:right;">
							<select>
								<option>상품명</option>
								<option>예약번호</option>
							</select>
							<input type="text" placeholder="검색어를 입력해주세요">
							<input type="submit">
							<button type="button" class="prdtReg" name="prdtReg">상품등록</button>
						</div>
					</div>
					<div id="content">
						<table class="goodsTable">
							<tr>
			 					<th><input type="checkbox" name="chk" value="all"></th>
			 					<th>상품번호</th>
			 					<th>상품 이미지</th>
			 					<th>상품명</th>
			 					<th>상품 설명</th>
			 					<th>상품가격</th>
			 					<th>관리</th>
			 				</tr>
							<tr>
								<td><input type="checkbox" name="chk" value="1"></td>
								<td>1</td>
								<td>IMG</td>
								<td>떡볶이</td>
								<td>둘이먹다가 하나 죽어도 모름</td>
								<td>7,000원</td>
								<td>
									<button type="button" class="prdtEdt" name="prdtEdt">수정</button>  
								</td>
							</tr>
						</table>
						<button type="button" class="prdtDel" name="prdtDel" style="margin: 20px 0;">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>