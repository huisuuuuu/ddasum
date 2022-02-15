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
			width: 100%;
			height: 1080px;
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
			width: 150px;
			height: 70px;
			background-color: #F7E3D4;
			right: auto;
			border-radius: 30px;
			font-size: 18pt;
			float: right;
			border: none;
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
		}
		.Title{
			width: 300px;
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
				<img class="Title" src="/resources/images/ddasum_header_logo.png" alt="로고">
			</div>
		</div>
		<div id="menuListArea">
			<div id="menuList">
				<div class="menu">
					<a href="/bizMember/bizManage.do">	
						<div class="menuIcon">
							<img class="Icons" src="/resources/images/bizMemberEnter_bizManage
							.png" alt="로고">
						</div>
						<div class="menuName">
						업체 관리
						</div>
					</a>
				</div>
				<div class="menu">
					<a href="/BizMember/goodsManage.do">	
						<div class="menuIcon">
							<img class="Icons" src="/resources/images/bizMemberEnter_goodsManage.png" alt="로고">
						</div>
						<div class="menuName">
						상품 관리
						</div>
					</a>
				</div>
				<div class="menu">
					<a href="/BizMember/bizReserv.do">				
						<div class="menuIcon">
							<img class="Icons" src="/resources/images/bizMemberEnter_reservManage
							.png" alt="로고">
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
			<a href="/BizMember/logout.do"><button id="logOutBTN">로그아웃</button></a>
		</div>
	</div>
</div>
</body>
</html>