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
			width: 220px;
			height: 220px;
			border-radius: 220px;
			background-color: gray;
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
			<div id="bizManage">
				<h1>업체관리</h1>
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
						<br>
						<div id="bizImg">
						</div>
						<br>
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
								<option>한식</option>
								<option>분식</option>
								<option>양식</option>
								<option>일식</option>
								<option>중식</option>
							</select></li>
						<li>서울시 양천구 </li>
						<li>09:00~22:00 </li>
						<li>20 </li>
						<li>후원 <button class="modifyBTN">유형전환</button></li>
						<li>N <button class="modifyBTN">탈퇴</button></li>
					</ul>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>