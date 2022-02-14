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

<link rel="stylesheet" type="text/css" href="/resources/css/faqBoard.css">

<title>자주묻는질문</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<jsp:include page="../commons/header/site-header.jsp"/>
		</div>
		<div id="body">
			<div class="titleArea">
				<span class="title">자주 묻는 질문</span>
			</div>
			<div class="faqArea">
				<div class="listArea">
					<div class="icon"></div>
					
				<c:forEach items="${requestScope.list }" var="m" varStatus="i">
					<ul class="subject">
						<span>${m.iTitle }</span>
					</ul>
					<ul class="content">
						<div class="iconArea"><img class="img" src="/resources/images/answer.png"></div>
						<span class="comment">
							${m.iContent }
						</span>
					</ul>
				</c:forEach>

				</div>
									<!-- paging -->
                    <div id="page_wrap">
                        <ul id="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/admin/faqBoard.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a id="page_active" href='/admin/faqBoard.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a id="page_inactive" href='/admin/faqBoard.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/admin/faqBoard.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>
			</div>
		<div id="footer">
			<jsp:include page="../commons/footer/site-footer.jsp"/>			
		</div>
	</div>





    <script>
        $(document).ready(function(){
            $(".subject").click(function(){
                $(this).next().slideToggle(200);
                $(this).style
            });    
        });
        
    </script>

</body>
</html>