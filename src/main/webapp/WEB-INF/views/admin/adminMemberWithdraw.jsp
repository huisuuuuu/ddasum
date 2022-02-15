<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨 관리자 페이지 - 회원 탈퇴</title>
</head>
<body>
	<%
		boolean result = (boolean)request.getAttribute("result");
	%>
	

	<script>
	<%if(result) {%>
		alert('정상적으로 처리가 완료되었습니다. :)');
	<%}else {%>
		alert('정상적으로 처리되지않았습니다.');
	<%} %>
	location.replace("/admin/adminMemberManageList.do");
	</script>

</body>
</html>