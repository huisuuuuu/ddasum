<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 사업자 관리 페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/commons/adminCommon.css">
<link rel="stylesheet" href="/resources/commons/adminBoard.css">
<link rel="stylesheet" type="text/css" href="/resources/commons/styles.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/ui.js"></script>
<style>
th:nth-of-type(1) {
	display : none;
}

td:nth-of-type(1) {
	display : none;
}
</style>
</head>
<body>

    <div id="wrap">
        
        <!-- navigation -->
        <%@ include file="/WEB-INF/views/commons/header/adminNavigation.jsp"%>
        
        <div id="header">
           <div id="header-box">
            <div class="admin-path">
                <p>사업자 관리</p>
                <p>사업자 정보 관리</p>
            </div>
           
            <div class="box-user">
                <span>${sessionScope.member.nick }님</span>
                <a href="/">로그아웃</a>
            </div>
            </div>
        </div>
        
        <div id="content">
            <div class="container">
                <div class="container_top">
                    <div class="count-all">
                        <p>전체 <span>${recordBizTotalCount }</span> 건</p>
                    </div>
                    
                    <div class="box-search">
                  <form action="/admin/adminMemberSearch.do" method="get">
                     <div class="select-search">
                        <select name="type" id="search-type">
                           <option>검색필터</option>
                           <option value="userId">아이디</option>
                                   <option value="nick">닉네임</option>
                                   <option value="userName">이름</option>
                        </select>
                        <i class="fas fa-chevron-down icon-arrow"></i>
                     </div>
                     
                     <div class="input-search">
                        <input type="search-keyword" name="keyword" placeholder="검색어를 입력해주세요" />
                           <div class="search-btn"><button type="button" class="search">
                              <i class="fas fa-search icon-search"></i></button>                     
                           </div>                        
                     </div>
                  </form>
               </div>
                </div>

                <div class="table_wrap">
                    <table>
                        <thead>
                            <tr>
                               <th width="100">사업자번호</th>
                                <th width="200">사업자유형</th>
                                <th width="200">아이디</th>
                                <th width="200">업체명</th>
                                <th width="300">업종</th>
                                <th width="200">주소</th>
                                <th width="200">후원횟수</th>
                                <th width="150">상세정보</th>
                            </tr>
                        </thead>
                  
                        <tbody>
                        <c:choose>
            		      <c:when test="${!requestScope.list.isEmpty()}">
           			      <c:forEach items="${requestScope.list}" var="bm">                                                
                            <tr>
                               <td>${bm.BIZNO }</td>
                               <td>${bm.AUTHORITYINFO }</td>
                               <td>${bm.BIZID }</td>
                               <td>${bm.BIZNAME }</td>
                               <td>${bm.RESTTYPE }</td>
                               <td>${bm.ADDRESS }</td>
                               <td>${bm.BIZCOUNT }</td>
                               <td><button type="button" class="ok_btn"><a href="/admin/adminBizMemberInfo.do?bizNo=${bm.BIZNO }">상세보기</a></button></td>
           	                 </tr>
                		   </c:forEach>
     		               </c:when>
                        </c:choose>
                            
                        </tbody> 
                        
                    </table>
                    
                    <div id="page_wrap">
                        <ul id="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/admin/adminBizManageList.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a id="page_active" href='/admin/adminBizManageList.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a id="page_inactive" href='/admin/adminBizManageList.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/admin/adminBizManageList.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>

                </div>
            </div>
          </div>
         </div>
   

</body>
</html>