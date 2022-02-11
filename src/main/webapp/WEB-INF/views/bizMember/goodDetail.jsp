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
		#goodManage{
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
			border-bottom-left-radius: 20px;
			border-bottom-right-radius: 20px;
		}
		#itemImgArea{
			width: 100%;
			height: 30%;
		}
		#itemInfoImg{
			width: 25%;
			height: 100%;
			float: left;
			padding-left: 150px;
		}
		#itemImg{
			width: 75%;
			height: 100%;		
			float: left;
		}
		.itemInfo{
			width: 100%;
			height: 20%;
		}
		.iteminfodiv{
			width: 25%;
			height: 100%;
			float: left;
			padding-left: 150px;
		}
		.infoWriter{
			width: 75%;
			height: 100%;
			float: left;
		}
		.confirmArea{
			width: 100%;
			height: 10%;
			text-align: center;
		}
		span{
			font-size: 16pt;
		}
		.entertext{
			width: 300px;
			height: 35px;
			font-size: 16pt;
			border-color: gray;
		}
		.imgsize{
			width:100px;
			padding-top: 40px;
		}
		#itemImgInput{
			width: 300px;
			height: 220px;
			border: 1px solid gray;
			text-align: center;
		}
		.confirmstyle{
			width: 120px;
			height: 50px;
			background-color: #FFA77E;
			color: white;
			border-radius: 10px;
			font-size: 16pt;
			border: none;
		}
		#addGood{
			width: 120px;
			height: 50px;
			background-color: #FFA77E;
			color: white;
			border-radius: 10px;
			font-size: 16pt;
			border: none;
		}
		h1{
		float: left;
		}
		.bizSmallImage{
				float: right;
		}
		.smaillimg{
					padding-top: 20px;
					padding-right: 10px;
					width:30px;
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
			<div id="goodManage">
				<h1>후원 상품 관리>상품등록</h1>
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
				<div id="content-title">
					후원 상품 등록
				</div>
				<form action="/bizMember/addGood.do" method="post" id="addForm">
				<div id="content">
					<div id="itemImgArea">
						<div id="itemInfoImg">
							<span>상품 이미지</span>
						</div>
						<div id="itemImg">
							<div id="itemImgInput">
								<img class="imgsize" src="/resources/images/bizImgAdd.png">
							<div><br>
							상품 사진을 추가해 주세요
							</div>
							</div>
						</div>
					</div>
					<div class="iteminfo">
						<div class="iteminfodiv">
							<span>상품명</span>
						</div>
						<div class="infoWriter">
							<input class="entertext" name="menuName" type="text">
						</div>					
					</div>
					<div class="iteminfo">
						<div class="iteminfodiv">
							<span>상품 설명</span>
						</div>
						<div class="infoWriter">
							<input class="entertext" name="menuInfo" type="text">
						</div>					
					</div>
					<div class="iteminfo">
						<div class="iteminfodiv">
							<span>상품가격</span>
						</div>
						<div class="infoWriter">
							<input class="entertext" name="originalPrice" type="text">
						</div>					
					</div>
					<div class="confirmArea">
						<input type='button' id="addGood" value='상품 등록'/>
						<a href="/BizMember/goodsManage.do"><input class="confirmstyle" type="button" value="취소"></a>
					</div>
				</div>
				</form>
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
	
	
	//신규 상품 등록 ajax

    $('#addGood').click(function(){
    	var form = {
    			menuName : $('input[name=menuName]').val(),
    			menuInfo : $('input[name=menuInfo]').val(),
    			originalPrice : $('input[name=originalPrice]').val()
    	}
    	
	  	$.ajax({
    		url : "/bizMember/addGood.do",
			dataType : "json",
			data : form, 
    		type : "POST",
    		success : function(rst){
    			if(rst == true){
    				alert("상품 등록 완료");
    				location.replace("/BizMember/goodsManage.do");
    			}else{
    				alert("상품 등록 실패");
    				location.replace("/BizMember/goodsManage.do");
    			}
    		},
    		error : function(){
    			console.log('ajax 통신 에러');
    		}
    	});
    });
	
	
	
	
</script>
</body>
</html>