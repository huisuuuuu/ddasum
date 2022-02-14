<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 꿈나무관리</title>
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

* {
	box-sizing : border-box;
	margin : 0px;
}
	
.wrap {
    width: 100%;
}

.detail-wrap {
	border : 1px solid #c8c8c8;
	width : 800px;
	height : 600px;
	border-radius : 20px;
	margin : 0px auto;
	display : none;
}

.detail-header {
	border-top-left-radius : 20px;
	border-top-right-radius : 20px;
	width : 100%;
	height : 15%;
	background-color : #FFA77E;
	text-align : center;
}

.detail-content {
    width: 100%;
    text-align: center;
}

.detail-content table {
    width: 100%;
    border-top: 0.5px solid #D8D8D8;
}

.detail-content table tr {
	height: 80px;
	line-height: 80px;
    border-bottom: 0.5px solid #D8D8D8;
}

.detail-content table th {
    border-bottom: 0.5px solid #D8D8D8;
}

.reset_area {
	width : 30%;
	height : 40px;
	border : 1px solid black;
	margin : 0px auto;
	text-align : center;
}

.reset-text-area {
	width : 50%;
	height : 100%;
	border : 1px solid blue;
	float : left;
	margin : 0px auto;
}


.reset-btn {
	width : 50%;
	height : 100%;
	border : 1px solid red;
	float : right;
	margin : 0px auto;
}


span {
	display : inline;
}

/*
th:nth-of-type(1) {
	display : none;
}

td:nth-of-type(1) {
	display : none;
}
*/

/* Page */

#page_wrap {
  width: 100%;
  margin : 0px auto;
}

#page_wrap>ul {
  display: table;
  margin: 0 auto;
}

#page_wrap>ul>li {
  display: block;
  width: 35px;
  height: 35px;
  float: left;
  text-align: center;
  margin: 0 5px;
  line-height: 15.5px;
  font-size: 16px;
  color: #2a2a2a;
}

#page_inactive {
  display: block;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 16px;
  color: #2a2a2a;
  padding: 10px;
  border-radius: 50%;
  transition: ease 0.3s;
}

#page_active {
  display: block;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 16px;
  padding: 10px;
  transition: ease 0.3s;   
  background-color: #ffa77e;
  border-radius: 50%;
  color: white;
}

.detail-wrap .close-btn {
	position : absolute;
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
                <p>회원 관리</p>
                <p>회원 정보 관리</p>
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
                        <p>전체 <span>${recordTotalCount }</span> 건</p>
                    </div>
                    
                    <div class="box-search">
                  <form action="/admin/adminMemberSearch.do" method="get">
                     <div class="select-search">
                        <select name="type" id="searchtype">
                           <option>검색필터</option>
                           <option value="userId">
                           <c:if test="${map.searchtype == 'userId' }">selected</c:if>아이디</option>
                           <option value="nick">닉네임</option>
                           <option value="userName">이름</option>
                        </select>
                        <i class="fas fa-chevron-down icon-arrow"></i>
                     </div>
                     
                     <div class="input-search">
                        <input type="searchkeyword" name="keyword" placeholder="검색어를 입력해주세요" />
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
                               <th width="100">회원번호</th>
                                <th width="200">회원등급</th>
                                <th width="200">아이디</th>
                                <th width="200">닉네임</th>
                                <th width="300">이메일</th>
                                <th width="200">가입일</th>
                                <th width="200">이용내역</th>
                                <th width="150">상세정보</th>
                            </tr>
                        </thead>
                  
                        <tbody>
                        <c:choose>
            		      <c:when test="${!requestScope.list.isEmpty()}">
           			      <c:forEach items="${requestScope.list}" var="m">                                                
                        
                            <tr>
                               <td>${m.userNo }</td>
                                <td>${m.authorityId }</td>
                                <td>${m.userId }</td>
                                <td>${m.nick }</td>
                                <td>${m.email }</td>
                                <td>${m.enrollDate }</td>
                                <td>
                                    <c:if test="${m.userId ne 'ADMIN' }">
                                      <c:if test="${m.detailYN eq 'Y'.charAt(0)}">
                                         <button type="button" class="ok_btn" id="popup-detail"><a href="/admin/adminMemberDetail.do?userNo=${m.userNo }">확인</a></button>
                                      </c:if>
                                      <c:if test="${m.detailYN eq 'N'.charAt(0)}">                                   
                                         <button type="button" class="none_btn">확인</button>
                                        </c:if>
                                     </c:if>
                               </td> 
                                <td>
                                   <c:if test="${m.userId ne 'ADMIN' }">
                                     <button type="button" class="ok_btn"><a href="/admin/adminMemberInfo.do?userNo=${m.userNo }">상세보기</a></button>
                                   </c:if>
                                </td>
           	                 </tr>
                  		     </c:forEach>
       		                 </c:when>
                        </c:choose>
                            
                        </tbody> 
                        
                    </table>
                    
                    <div id="page_wrap">
                        <ul id="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/admin/adminMemberManageList.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a id="page_active" href='/admin/adminMemberManageList.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a id="page_inactive" href='/admin/adminMemberManageList.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/admin/adminMemberManageList.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>

                </div>
            </div>
          </div>
         </div>
   
</body>
</html>