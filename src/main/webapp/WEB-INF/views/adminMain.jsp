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
	background-color : #FFA77E;
	margin : 0px;
	padding : 0px;
}

* > div {
	box-sizing: border-box;
}

/* 전체영역 */

#wrap {
   min-height: 100%;
   
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
#menu {
	border : 1px solid black;
	width : 100%;
	height : 450px;
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
	
	<div id="menu">
		
	</div>
</div>

</body>
</html>