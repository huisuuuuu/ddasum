<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨 관리자 메인</title>
<link rel="stylesheet" type="text/css"	href="/resources/css/adminMain.css">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<body>

<div id="wrap">

	<div id="header">
		<div id="logo">
		<a href="/"><img src="/resources/images/ddasum_header_logo.png" alt="로고" width="300px" height="300px"></a>
		</div>
	</div>
	
	<div id="contents">
		<div id="menu-area">
			<div id="menu_area_wrap">
				<a href="/admin/adminMemberManageList.do">
					<div class="menu" id="menubox1">
						<img src="/resources/images/admin_main_manage.png" alt="꿈나무관리" width="150px" height="150px">
						<br><br><br>
							<p>꿈나무관리</p>
				</a>	
				</div>
				
				<div class="menu" id="menubox2">
					<a href="/admin/adminBizManageList.do">
						<img src="/resources/images/admin_main_biz.png" alt="사업자관리" width="150px" height="150px">
							<br><br><br>
							<p>사업자관리</p>
					</a>
				</div>
				
				<div class="menu" id="menubox3">
					<a href="/admin/adminNoticeManageList.do">
						<img src="/resources/images/admin_main_notice.png" alt="공지사항관리" width="150px" height="150px">
							<br><br><br>
							<p>공지사항관리</p>
					</a>
				</div>
	
				<div class="menu" id="menubox4">
					<a href="/admin/adminSelectAllSupport.do">
						<img src="/resources/images/admin_main_chart.png" alt="후원정산" width="150px" height="150px">
							<br><br><br>
							<p>후원정산</p>
					</a>
				</div>
				
			</div>
									
		</div>
	</div>
	
	<div id="footer">
		<div id="logbtn">
			<a href="/">	
				<button type="button" class="admin_main_btn"><a href="/">로그아웃</a></button>
			</a>
		</div>
	</div>
</div>

</body>
</html>