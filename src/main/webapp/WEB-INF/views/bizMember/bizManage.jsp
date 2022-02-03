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
		}
		#logoArea{
			width: 100px;
			height: 80px;
			margin: 0 auto;
			text-align: center;	
			
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
			height: 40px;
			font-size: 18pt;
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
		}
		#typeOption{
			width: 120px;
			height: 30px;	
			font-size: 16pt;
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
		.imgsize{
			width:100px;
			padding-top: 70px;
		}
	</style>

</head>
<body>

<div id="wrapper">
	<div id="leftArea">
		<div id="L-upArea">
			<div id="logoArea">
				<a href="/">
					<img class="Title" src="/resources/images/ddasum_header_logo.png" alt="로고" width="400px;">
				</a>
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
			<div id="bizManage">
				<h1>업체 관리</h1>
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-content">
				<div id="content-title">
					업체 정보 관리
					<button class="modifyBTN">변경하기</button>
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
						<li>USER11 </li>
						<li>1234 </li>
						<li>홍길동 </li>
						<li>가가식당 </li>
						<li>abc@gmail.com </li>
						<li>01012341234 </li>
						<li>
							<select id="typeOption">
								<option value="KOR">한식</option>
								<option value="SCH">분식</option>
								<option value="WES">양식</option>
								<option value="JPN">일식</option>
								<option value="CHI">중식</option>
							</select></li>
						<li>서울시 양천구 </li>
						<li>09:00~22:00 </li>
						<li>20 </li>
						<li>후원 <button class="modifyBTN2">유형전환</button></li>
						<li>N <button class="modifyBTN2">탈퇴</button></li>
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