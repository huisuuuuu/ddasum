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
		#bizManage{
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
			text-align: center;
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
			color: #FFA77E;
			border: 1px solid #FFA77E;
			background-color: white;
			border-radius: 5px;
		}
		.modifyBTN2{
			float: right;
			width: 120px;
			height: 32px;
			font-size: 14pt;
			color: white;
			border: none;
			background-color: #FFA77E;
			border-radius: 5px;
		}
		.modifyBTN3{
			float: right;
			width: 120px;
			height: 32px;
			font-size: 14pt;
			color: white;
			border: none;
			background-color: #FFA77E;
			border-radius: 5px;
		}		
		#bizImg{
			width: 220px;
			height: 220px;
			border-radius: 220px;
			border: 1px solid gray;
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
			height: 40px;
		}
		#typeOption{
			width: 120px;
			height: 30px;	
			font-size: 16pt;
		}
		.imgsize{
			width:100px;
			padding-top: 70px;
		}
		h1{
		float: left;
		}
		.bizSmallImage{
				float: right;
		}
		.bizId{
			float: right;
			font-size: 18pt;
			text-align: center;		
			padding-right: 20px;
			padding-top: 20px;
		}
		.logout{
			float: right;
			font-size: 18pt;
			padding-top: 20px;
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
					<span class="menulist">후원 정산 관리</span><br><br>
				</a>
			</div>
		</div>
	</div>
	<div id="rightArea">
		<div id="R-upArea">
			<div id="bizManage">
				<h1>업체 관리</h1>
					<span class="logout">
						<a href="/BizMember/logout.do">로그아웃</a>
					</span>
					<span class="bizId"> ${sessionScope.bizMember.bizName } </span>
					<span class="bizSmallImage">
					</span>
					

			</div>
		</div>
		<div id="R-downArea">
			<div id="R-content">
				<div id="content-title">
					업체 정보 관리
					<a href="updateBizManage.do"><button class="modifyBTN">변경하기</button></a>
				</div>
				<div id="content">
					<div id="content-L">
						<br><br>
						<div id="bizImg">
							<img class="imgsize" src="/resources/images/bizImgAdd.png">
						</div>
						<br>
						<span>업체 사진을 등록해 주세요</span>
					</div>
					<div id="content-R">
					<ul>
						<li>아이디 </li>
						<li>비밀번호 </li>
						<li>대표명 </li>
						<li>업체명 </li>
						<li>이메일 </li>
						<li>휴대전화 </li>
						<li>업종</li>
						<li>주소 </li>
						<li>운영시간 </li>
						<li>후원횟수 </li>
						<li>사업자유형 </li>
						<li>탈퇴여부 </li>
					</ul>
					</div>
					<div id="content-result">
					<ul>
						<li>${requestScope.bizMember.bizId }</li>
						<li>${requestScope.bizMember.bizPwd }</li>
						<li>${requestScope.bizMember.ceoName }</li>
						<li>${requestScope.bizMember.bizName }</li>
						<li>${requestScope.bizMember.bizEmail }</li>
						<li>${requestScope.bizMember.bizPhone }</li>
						<li>${requestScope.bizMember.restaurant }</li>
						<li>${requestScope.bizMember.address }</li>
						<li>${requestScope.bizMember.bizTime }</li>
						<li>${requestScope.bizMember.bizCount }</li>
						<li>${requestScope.bizMember.authorityId }</li>
						<li>${requestScope.bizMember.bizDelYN }</li>
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