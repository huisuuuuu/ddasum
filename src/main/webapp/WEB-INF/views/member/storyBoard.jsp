<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨 - 마음을 나누다</title>
<style>

#wrap {
	width : 100%;
}

.box-story {
	width : 1000px;
	height : 800px;
	margin : 0px auto;
	padding-top : 60px;
}

.swiper {
  width: 100%;
  height: 800px;
}

.text-story-area {
	border : 1px solid black;
	width : 1000px;
	height : 800px;
	margin : 0px auto;
	padding-bottom : 60px;
}


</style>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<script src="/resources/js/swiper.js"></script>
</head>
<body>
<!-- header -->
			<%@ include file="/WEB-INF/views/commons/header/site-header.jsp" %>

	<div id="wrap">
	
		<div class="box-story">
			
			<!-- Slider main container -->
				<div class="swiper">
					<!-- Additional required wrapper -->
  					<div class="swiper-wrapper">
    					<!-- Slides -->
    						<div class="swiper-slide">
    							<img src="/resources/images/story1.jpg" alt="스토리사진">
    						</div>
  							<div class="swiper-slide">
    							<img src="/resources/images/story2.jpg" alt="스토리사진">  							
							<div class="swiper-slide">
    							<img src="/resources/images/story3.jpg" alt="스토리사진">  														
							</div>
  					</div>

				  <div class="swiper-button-prev"></div>
				  <div class="swiper-button-next"></div>

				</div>
				</div>
		</div>
		
		<div class="text-story-area">
		
		</div>
	</div>
	
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- footer -->
	<%@ include file="/WEB-INF/views/commons/footer/site-footer.jsp" %>
</body>
</html>