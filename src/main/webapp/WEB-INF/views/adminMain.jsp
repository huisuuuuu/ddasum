<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨 관리자 메인</title>
<style>

/*페이지세로 가변적인 길이 유지*/
html {
   height: 100%;
}
body {
   height: 100%;
}

* {
	margin : 0px;
	padding : 0px;
}

* > div {
	box-sizing: border-box;
}

/* 전체영역 */

#wrap {
   min-height: 100%;
   background-color : #FFA77E;
   
}

/* 헤더영역 */
#header {
	width : 100%;
	height : 350px;
	margin : auto;
}

#logo {
	width : 100%;
	height : 300px;
	padding : 30px;
	margin : 0px auto;
	text-align: center;
}

/* 메뉴영역 */
#contents {
	width : 100%;
	height : 450px;
}

#menu-area {
	
	width : 1200px;
	height : 100%;
	margin : 0px auto;

	
}

#menu_area_wrap {
	    width: 100%;

    display: flex;
}

.menu {
	width: 24%;
    height: 100%;
    padding: 115px 50px;
    background-color: white;
	box-shadow: 2px 3px 8px rgb(0 0 0 / 10%);
    border-radius: 20px;
    margin-right: 20px;
    box-sizing: border-box;

}

.menu:last-child {
	margin-right: 0;

}

#menubox1 {
	background-color : white;
	text-align: center;
	
	
	margin-right : 20px; 
	
}

#menubox2 {
	background-color : white;
	text-align: center;

}

#menubox3 {
	background-color : white;
	text-align: center;

	
}

#menubox4 {
	background-color : white;
	text-align: center;
	 
	
}

/* 푸터 영역 */
#footer {
	width : 100%;
	height : 200px;
	padding : 100px 100px;
}

#logbtn {
	background-color : #F7E3D4;
	border-radius : 15px;
	width : 195px;
	height : 50px;
	float : right;
}


</style>
</head>
<body>

<div id="wrap">

	<div id="header">
		<div id="logo">
		<img src="/resources/images/ddasum_header_logo.png" alt="로고" width="300px" height="300px">
		</div>
	</div>
	
	<div id="contents">
		<div id="menu-area">
			<div id="menu_area_wrap">
				<div class="menu" id="menubox1">
				<img src="/resources/images/admin_main_manage.png" alt="꿈나무관리" width="150px" height="150px">
				<br><br><br>
					<p>꿈나무관리</p>
				</div>
				
				<div class="menu" id="menubox2">
				<img src="/resources/images/admin_main_biz.png" alt="사업자관리" width="150px" height="150px">
				<br><br><br>
					<p>사업자관리</p>
				</div>
				
				<div class="menu" id="menubox3">
				<img src="/resources/images/admin_main_notice.png" alt="공지사항관리" width="150px" height="150px">
				<br><br><br>
					<p>공지사항관리</p>
				</div>
	
				<div class="menu" id="menubox4">
				<img src="/resources/images/admin_main_chart.png" alt="후원정산" width="150px" height="150px">
				<br><br><br>
					<p>후원정산</p>
				</div>
			</div>
									
		</div>
	</div>
	
	<div id="footer">
		<div id="logbtn">
			
		</div>
	</div>
</div>

</body>
</html>