<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<script src="https://code.jquery.com/jquery-3.6.0.js"
integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/css/noticeBoard.css">

<title>공지 사항</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<jsp:include page="../commons/header/site-header.jsp"/>
		</div>
		<div id="body">
			<div class="titleArea">
				<span class="title">공지사항</span>
			</div>
			<div class="tableArea">
				<div class="searchArea">
					<select class="optionBTN">
						<option>제목</option>
						<option>작성일</option>
					</select>
					<input class="inputdata" type="text"><input class="submitBTN" type="submit">
				</div>
				<div class="resultArea">
					<table class="resultTable">
						<tr class="Row">
		                    <th class="rt-th-1">번호</th>
		                    <th class="rt-th-2">제목</th>
		                    <th class="rt-th-3">작성일</th>
		                </tr>
						<tr>
		                    <td>1</td>
		                    <td class="td_left"><a href="/BizMember/noticeDetail.do">꿈나무카드 인증안내</a></td>
		                    <td>2022-01-27</td>
		                </tr>
						<tr>
		                    <td>2</td>
		                    <td class="td_left">2021년 베스트 후원 업체 선정</td>
		                    <td>2022-01-26</td>
		                </tr>
						<tr>
		                    <td>3</td>
		                    <td class="td_left">2020년 베스트 후원 업체 선정</td>
		                    <td>2022-01-24</td>
		                </tr>
						<tr>
		                    <td>4</td>
		                    <td class="td_left">2019년 베스트 후원 업체 선정</td>
		                    <td>2021-01-24</td>
		                </tr>
						<tr>
		                    <td>5</td>
		                    <td class="td_left">2018년 베스트 후원 업체 선정</td>
		                    <td>2021-01-24</td>
		                </tr>
						<tr>
		                    <td>6</td>
		                    <td class="td_left">2017년 베스트 후원 업체 선정</td>
		                    <td>2021-01-24</td>
		                </tr>
					</table>
				</div>
				<div class="pagingArea">
					페이징처리
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../commons/footer/site-footer.jsp"/>			
		</div>
	</div>


</body>
</html>