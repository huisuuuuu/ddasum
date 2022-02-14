<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 꿈나무 카드 인증 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminCommon.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminBoard.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/styles.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/ui.js"></script>
</head>
<body>
    <div id="wrap">
        
        <!-- navigation -->
        <%@ include file="/WEB-INF/views/commons/header/adminNavigation.jsp"%>
        
        <div id="header">
        	<div id="header-box">
            <div class="admin-path">
                <p>회원 관리</p>
                <p>꿈나무 카드 인증 관리</p>
            </div>
           
            <div class="box-user">
                <a href="/">${sessionScope.member.nick }님</a>
                <a href="/">로그아웃</a>
            </div>
            </div>
        </div>
        
        <div id="content">
            <div class="container">
                <div class="container_top">
                    <div class="count-all">
                        <p>전체 <span>${cardTotalCount }</span> 건</p>
                    </div>
                    
                    <div class="box-search">
						<form action="">
							<div class="select-search">
								<select>
									<option>검색필터</option>
									<option value="userId">아이디</option>
	                                <option value="nick">닉네임</option>
	                                <option value="userName">이름</option>
								</select>
								<i class="fas fa-chevron-down icon-arrow"></i>
							</div>
							
							<div class="input-search">
								<input type="text" name="search" placeholder="검색어를 입력해주세요" />
									<div class="search-btn"><button type="button" class="search">
										<i class="fas fa-search icon-search"></i></button>							
									</div>								
							</div>
							<!-- <input type="submit" class="btn-rec" value="검색"> -->
						</form>
					</div>
                </div>
      
                <div class="table_wrap">
                    <table>
                        <thead>
                            <tr>
                                <th width="200">관리번호</th>
                                <th width="200">아이디</th>
                                <th width="200">이름</th>
                                <th width="200">가입일</th>
                                <th width="200">이용내역</th>
                                <th width="200">인증확인</th>
                                <th width="200">승인/반려</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        <c:choose>
                        <c:when test="${!requestScope.list.isEmpty() }">
                        <c:forEach items="${requestScope.list }" var="cm">
                            <tr>
                                <td>${cm.CMNO }</td>
                                <td>${cm.USERID }</td>
                                <td>${cm.USERNAME }</td>
                                <td>${cm.ENROLLDATE }</td>
                                <td>
                                <c:if test='${ cm.DETAILYN.equals("Y") }'>
                                <button type="button" class="ok_btn">있음</button>
                                </c:if>
                                <c:if test='${ cm.DETAILYN.equals("N") }'>
                                <button type="button" class="none_btn">없음</button>
                                </c:if>
                                </td>
                                <td>
                                <c:if test='${cm.CHECKYN.equals("Y") }'>
                                <button type="button" class="pass_btn">
                                <a href="/admin/adminCardConfirm.do">확인</a></button>
                                </c:if>
                                <c:if test='${cm.CHECKYN.equals("N") }'>
                                <button type="button" class="wait_btn">
                                <a href="/admin/adminCardConfirm.do">확인</a></button>
                                </c:if>
                                </td>
                                <td>
                                <c:if test='${cm.JOINYN.equals("Y") }'>
                                <button type="button" class="success_btn">승인</button>
                                </c:if>
                                <c:if test='${cm.JOINYN.equals("N") }'>
                                <button type="button" class="reject_btn">반려</button>
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
                           <li><a href='/admin/adminCardManageList.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a id="page_active" href='/admin/adminCardManageList.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a id="page_inactive" href='/admin/adminCardManageList.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/admin/adminCardManageList.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>

                </div>
            </div>
          </div>
         </div>          

</body>
</html>