<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨 - 마음을 나누다</title>
<link rel="stylesheet" type="text/css"	href="/resources/commons/layout.css">
<link rel="stylesheet" type="text/css"	href="/resources/commons/mainTitle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="css/swiper.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">
<style>

#wrap {
	width : 100%;
}

#content {
	padding-bottom : 100px;
}

.contents_wrap {
	width : 1000px;
	height : 700px;
	margin : 0px auto;
	margin-top : 20px;
	padding-top : 60px;
}

.swiper {
  width: 100%;
  height: 800px;
}

.story-area {
	width : 1000px;
	height : 800px;
	margin : 0px auto;
	margin-top: 10px;
	margin-bottom: 150px;
}

.text-area {
	width : 60%;
	height : 80%;
	padding-top : 70px;
	float : left;
	font-size : 16px;
}

.img-area {
	width : 40%;
	height : 100%;
	float : right;
}

.btn-area {
	box-sizing : border-box;
	width : 60%;
	height : 20%;
	display : inline-block;
}

.swiperImg {
	max-width : 100%;
	height : 700px;
}

#stroryImg {
	max-width : 100%;
	height : 450px;
}

#img {
	width : 100%;
	margin-top : 280px;
}

.font-color {
	color : coral;
	font-size : 2em;
}

.text-up {
	font-size : 2em;
	font-weight : bold;
}

button {
	border-radius : 50px;
	width : 300px;
	height : 80px;
	background-color : rgb(255, 167, 126, 0.5);
	border : none;
	font-size : 1.5em;
	display : block;
	color : white;	
}

button > a:link {
	color : white;
}

button > a:visited {
	color : white;
}

</style>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/resources/js/swiper.js"></script>
</head>

<body>
   <div id="wrap">
      <header>
         <%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
      </header>
      <div id="content">
         <div class="main_tit">
            <h1>스토리보드</h1>
            <div class="under"></div>
         </div>
         <div class="contents_wrap">
         			<!-- Slider main container -->
				<div class="swiper mySwiper">
					<!-- Additional required wrapper -->
  					<div class="swiper-wrapper">
    					<!-- Slides -->
    						<div class="swiper-slide">
    							<img class="swiperImg" src="/resources/images/story1.jpg" alt="스토리사진">
    						</div>
  							<div class="swiper-slide">
    							<img class="swiperImg" src="/resources/images/story2.jpg" alt="스토리사진">
    						</div>	  							
							<div class="swiper-slide">
    							<img class="swiperImg" src="/resources/images/story3.jpg" alt="스토리사진">  														
							</div>
  					</div>

				  <div class="swiper-button-prev"></div>
				  <div class="swiper-button-next"></div>

				</div>
				</div>
		</div>
		
		<div class="story-area">
			<div class="text-area">
				<p class="text-up">눈치보지 말고, 당당하게!</p><br><br>
				
				<p>현재 대한민국 결식 아동의 수는 약 33만명으로,<br>
				아동 17명 중 1명이 매일 한 끼 이상 굶고 있다는 사실 알고 계셨나요?</p><br>
				
				<p>한창 자라나는 친구들이<br>
				한 끼라도 더 든든하고 맛있게<br>
				주눅들지 않고 먹을 수 있으면 어떨까?</p><br>
				
				<p>그렇게 탄생한 <b>따숨</b>은<br>
				지금까지 <span class="font-color">3,512</span>명의 아이들과<br>
				<span class="font-color">1,308,215</span>끼를 함께했습니다.</p><br>
				
				<p class="text-up">마음을 나누는 곳,<br>
				여기는 <span class="font-color">따숨</span>입니다.<p><br>			
			</div>
			<div class="img-area">
				<div id="img">
					<img id="stroryImg" src="/resources/images/storyboard.png">
				</div>
			</div>
			<div class="btn-area">
				<button type="button"><a href="/member/bizMemberChoicePage.do">마음 나누러 가기</a></button>
			</div>
		</div>
         </div>
         
      </div>
      <footer>
         <%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
      </footer>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			spaceBetween: 0,
			centeredSlides: true,
			loop: true,
			autoplay: {
				delay: 3000,
				disableOnInteraction: false,
			},
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
			},
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			},
		});
	</script>

</body>
</html>