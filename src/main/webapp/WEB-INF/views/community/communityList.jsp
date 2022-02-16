<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/communityList.css">
	<link rel="stylesheet" type="text/css" href="/resources/commons/layout.css">
	<link rel="stylesheet" type="text/css" href="/resources/commons/mainTitle.css">
	
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>	
      <div id="content" style="margin-bottom:200px;">
         <div class="main_tit">
            <a href="/community/communityList.do" style="all:unset;"><h1>혼밥시러</h1></a>
            <div class="under"></div>
         </div>
         <div class="contents_wrap" style="min-height:635px;">
         	        <div id="board_wrapper">
            <div class="table_tr">
            	<c:if test="${sessionScope.member !=null }">
                	<button type="button" class="color_button" id="board_write">글쓰기</button>
                </c:if>
				<script>
					$("#board_write").click(function(){
						location.replace("/community/communityWrite.do");
					})
				</script>
                <div id="search_wrapper">
                    <form action="/community/communitySearch.do" method="get">
                        <select name="type" id="search_type">
                            <option value="title">제목</option>
                            <option value="writer">작성자</option>
                            <option value="all">제목+작성자</option>
                        </select>
                        <div id="search_bar">
                            <input id="search_keyword" type="text" name="keyword" placeholder="검색어를 입력해주세요">
                            <button class="color_button"><img src="/resources/images/searchImage.png" alt=""></button>
                        </div>
                    </form>
                </div>
            </div>

            <table id="board_table">
                <tr class="table_tr_header">
                    <th class="td_no">번호</th>
                    <th class="td_area">지역</th>
                    <th class="td_title">제목</th>
                    <th class="td_writer">작성자</th>
                    <th class="td_date">작성일</th>
                    <th class="td_count">조회수</th>
                </tr>
                <c:choose>
				<c:when test="${!requestScope.map['list'].isEmpty() }">
					<c:forEach items="${requestScope.map['list'] }" var="c">
						<tr class="table_tr_body">
		                    <td class="td_no">${c.cNo}</td>
		                    <td class="td_area">${c.area } > ${c.sigu } </td>
		                    <td class="td_title"><a href="/community/communityDetail.do?cNo=${c.cNo }&currentPage=${requestScope.map['currentPage']}">${c.cTitle } </a>
		                    	<c:if test="${c.comCount !=0 }"><sup>[${c.comCount }]</sup></c:if>
		                    	<c:if test="${c.cRegDate == requestScope.map['nowDate']}"><img src="/resources/images/newIcon.png" alt="" /></c:if>
		                    </td>
		                    <td class="td_writer">${c.nick }</td>
		                    <td class="td_date">${c.cRegDate }</td>
		                    <td class="td_count">${c.cCount }</td>
	                	</tr>
	                	
					</c:forEach>

				</c:when>
				<c:otherwise>
						<tr class="table_tr_body">
		                    <td class="td_no"></td>
		                    <td class="td_area"></td>
		                    <td class="td_title" style="text-align:center;">게시물이 없습니다.</td>
		                    <td class="td_writer"></td>
		                    <td class="td_date"></td>
		                    <td class="td_count"></td>
	                	</tr>				
				</c:otherwise>
			</c:choose>				
            </table>
			<div id="page_wrap">
			    <ul class="page_ul">
			       ${requestScope.map['navi'] }
			    </ul>
			</div>
        </div>
         
         </div>
      </div>

 	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>     
</body>
</html>