<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 사업자 내역 상세보기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/commons/adminCommon.css">
<link rel="stylesheet" href="/resources/commons/adminNoticeBoard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/ui.js"></script>
<style>
* > div {
	box-sizing : border-box;
	margin : 0px;
}

.wrap {
	width : 100%;
}

.info-wrap {
	border : 1px solid #c8c8c8;
	width : 800px;
	height : 600px;
	border-radius : 20px;
	margin : 0px auto;
	
}

.info-header {
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
	width : 100%;
	height : 15%;
	background-color : #FFA77E;
	text-align : center;
}

.info-content {
	width : 100%;
	height : 85%;
}

.info-footer {
	width : 100%;
	height : 15%;
}

.info-content table {
    width: 100%;
    border-top: 0.5px solid #D8D8D8;
}

.info-content table tr {
	height: 40px;
    border-bottom: 0.5px solid #D8D8D8;
    text-align : center;
}

.info-content table th {
    border-bottom: 0.5px solid #D8D8D8;
}

.data-area
{
	width:50%;
	border : 1px solid blue;

}

.info-area
{
	width : 50%;
	border : 1px solid red;
}

.del-btn {
	width : 80px;
	height : 100%;
	float : right;
}

.info-check {
	border : 1px solid red;
	width : 100%;
	height : 100%;
}
</style>
</head>
<body>

	<div class="wrap">
		<div class="info-wrap">
			<div class="info-header">
				${info.BIZNAME}님 회원정보
			</div>
			
			<div class="info-content">
				<table>
					<tbody>
					<tr>
						<th class="data-area">정보</th>
						<th class="info-area">확인</th>
					</tr>
					
					<tr>
						<td class="data-area">아이디</td>
						<td class="info-area">${info.BIZID }</td>
					</tr>
					<tr>
						<td class="data-area">대표명</td>
						<td class="info-area">${info.CEONAME }</td>
					</tr>
					<tr>
						<td class="data-area">업체명</td>
						<td class="info-area">${info.BIZNAME }</td>
					</tr>
					<tr>
						<td class="data-area">이메일</td>
						<td class="info-area">${info.BIZEMAIL }</td>
					</tr>
					<tr>
						<td class="data-area">전화번호</td>
						<td class="info-area">${info.BIZPHONE }</td>
					</tr>
					<tr>
						<td class="data-area">업종</td>
						<td class="info-area">${info.RESTYPE }</td>
					</tr>
					<tr>
						<td class="data-area">주소</td>
						<td class="info-area">${info.ADDRESS }</td>
					</tr>
					<tr>
						<td class="data-area">운영시간</td>
						<td class="info-area">${info.BIZTIME }</td>
					</tr>
					<tr>
						<td class="data-area">후원횟수</td>
						<td class="info-area">${info.BIZCOUNT }</td>
					</tr>
					<tr>
						<td class="data-area">사업자유형</td>
						<td class="info-area">${info.AUTHORITYINFO }</td>
					</tr>
					<tr>
						<td class="data-area">탈퇴여부</td>
						<td class="info-area">${info.BIZDELYN.equals("Y") ? "탈퇴" : "사용중" }
							<div class="del-btn">
							
								<button type="button">탈퇴</button>
							</div>						
						</td>
					</tr>
					</tbody>					
				</table>
				<div class="info-footer">
					<div class="info-check"><button type="button">
						<a href="/admin/adminBizManageList">확인</button></a></div>
				</div>
				
			</div>
		</div>
	</div>
	

</body>
</html>