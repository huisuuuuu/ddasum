<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
    
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
			background-color: #FFD3BE;
			margin: 0 auto;
		}
		#titleArea{
			width: 100%;
			height: 400px;
			background-color: #FFD3BE;
			
		}
		#menuListArea{
			width: 100%;
			height: 600px;
		}
		#title{
			width: 300px;
			height: 300px;
			margin: 0 auto;
			padding-bottom: 50px;
			background-color: #FFD3BE;
		}
		#menuList{
			width: 1300px;
			height: 550px;
			margin: 0 auto;
		}
		#footer{
			width: 100%;
			height: 80px;
			background-color: #FFD3BE;
		}
		#moveArea{
			width: 100px;
			height: 50px;
			float: right;
		}
		#logOutBTN{
			width: 100%;
			height: 100%;
			background-color: #F7E3D4;
			margin-right: 100px;
			right: auto;
			border-radius: 30px;
		}
		.menu{
			width: 25%;
			height: 100%;
			padding: 10px;
			float: left;
			}
		.menuIcon{
			width: 100%;
			height: 70%;
			background-color: white;
			border-top-left-radius: 20px;
			border-top-right-radius: 20px;
			
		}
		.menuName{
			width: 100%;
			height: 30%;
			background-color: white;
			border-bottom-left-radius: 20px;
			border-bottom-right-radius: 20px;
			font-size: 30pt;
			text-align: center;
		}
		.menuIcon{
			padding-top: 120px;
			text-align: center;	
		}
		.Icons{
			width: 180px;
			height: 180px;
		}
		.title{
			padding-top: 80px;
			text-align: center;	
		}
		.Title{
			width: 350px;
		}

	</style>

</head>
<body>
<div id="wrapper">
	<div id="header">
	</div>
	<div id="body">
		<div id="titleArea">
			<div id="title">
				<img class="Title" src="/resources/images/ddasum_header_logo.png" alt="로고" width="400px;">
			</div>
		</div>
		<div id="menuListArea">
			<div id="menuList">
				<div class="menu">
					<a href="/BizMember/bizManage.do">	
						<div class="menuIcon">
						</div>
						<div class="menuName">
						업체 관리
						</div>
					</a>
				</div>
				<div class="menu">
					<a href="/BizMember/goodsManage.do">	
						<div class="menuIcon">
						</div>
						<div class="menuName">
						상품 관리
						</div>
					</a>
				</div>
				<div class="menu">
					<a href="/BizMember/bizReserv.do">				
						<div class="menuIcon">
						</div>
						<div class="menuName">
						예약 관리
						</div>
					</a>
				</div>
				<div class="menu">
					<a href="/BizMember/calculateManage.do">				
						<div class="menuIcon">
							<img class="Icons" src="/resources/images/admin_main_chart.png" alt="로고">
						</div>
						<div class="menuName">
						정산 관리
						</div>
					</a>
				</div>
		
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="moveArea">
			<button id="logOutBTN">로그아웃</button>
		</div>
	</div>
</div>
</body>
</html>