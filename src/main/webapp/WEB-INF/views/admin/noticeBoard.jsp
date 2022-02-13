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
					<form id="searchForm">
					<select class="optionBTN">
						<option>제목</option>
						<option>작성일</option>
					</select>
					
					<input class="inputdata" type="text"><button class="submitBTN"><img class="searchImg" src="/resources/images/search.png"></button>
					</form>
				</div>
				<div class="resultArea">
				
				<c:choose>
					<c:when test="${!requestScop.list.isEmpty() }">
						<table class="resultTable">
							<tr class="Row">
			                    <th class="rt-th-1">번호</th>
			                    <th class="rt-th-2">제목</th>
			                    <th class="rt-th-3">작성일</th>
			                </tr>
			                
			                <c:forEach items="${requestScope.list }" var="m" varStatus="i">
							<tr>
			                    <td>${i.count }</td>
			                	<td><a href="/board/noticeDetail.do?iNo=${m.iNo }">${m.iTitle }</a></td>
			                    <td>${m.iRegdate }</td>
			                </tr>
							</c:forEach>
						</table>
					</c:when>
					
					<c:otherwise>
						<H1>현재 저장된 공지사항이 없습니다.</H1>
					</c:otherwise>
				
				</c:choose>					
				</div>
				<div class="pagingArea">
					<!-- paging -->
					<div style="display: block; text-align: center;">		
						<c:if test="${paging.startPage != 1 }">
							<a href="/board/noticeBoard.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="/board/noticeBoard.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="/board/noticeBoard.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../commons/footer/site-footer.jsp"/>			
		</div>
	</div>

</body>
</html>