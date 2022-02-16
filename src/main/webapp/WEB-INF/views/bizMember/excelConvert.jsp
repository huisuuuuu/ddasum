<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>	<%--엑셀 파일 선언 --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	//파일명에 다운로드 날짜 붙여주기 위해 작성
	Date date=new Date();
	SimpleDateFormat dayformat=new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	SimpleDateFormat hourformat=new SimpleDateFormat("hhmmss", Locale.KOREA);
	String day=dayformat.format(date);
	String hour=hourformat.format(date);
	String fileName="정산데이터"+day+"_"+hour;
	
	//필수 선언 부분
	//.getBytes("KSC5601"),"8859_1") 을 통한 한글파일명 깨짐 방지
	response.setHeader("Content-Disposition", "attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
	response.setHeader("Content-Description", "JSP Generated Date");
	
%>

<!doctype html>
<html lang="ko" style="overflow:hidden">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title></title>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="784" border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bordercolordark="#FFA77E" cellspacing="0" cellpadding="0">
	<thead>
	   <tr align="center">
		<th scope="col" bgcolor="CDCDCD">번호</th>
		<th scope="col" bgcolor="CDCDCD">후원일자</th>
		<th scope="col" bgcolor="CDCDCD">후원유형</th>
		<th scope="col" bgcolor="CDCDCD">예약번호</th>
		<th scope="col" bgcolor="CDCDCD">업체명</th>
		<th scope="col" bgcolor="CDCDCD">상품명</th>
		<th scope="col" bgcolor="CDCDCD">후원금액</th>
	   </tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.list }" var="m" varStatus="i">
			<tr>
				<td style="text-align:left;">${i.count }</td>
				<td style="text-align:left;">${m.reservationDate }</td>
				<td style="text-align:left;">${m.authorityId }</td>
				<td style="text-align:left;">${m.reNo }</td>
				<td style="text-align:left;">${m.bizName }</td>
				<td style="text-align:left;">${m.menuName }</td>
				<td style="text-align:left; mso-number-format:\#\,\#\#0\;">${m.originalPrice -m.dcPrice }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</body>

</html>