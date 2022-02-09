<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- SweetAlert2 CDN -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/commons/swal.css">	
<title>Insert title here</title>
</head>
<body>
	
	<script>
		Swal.fire({
			  icon: 'error',
			  title: '${requestScope.msg1}',
			  text: '${requestScope.msg2}'
			}).then(function(){
				location.href='${requestScope.location}';
			});
		
		$('.swal2-styled.swal2-confirm').html('확인');
	</script>
</body>
</html>