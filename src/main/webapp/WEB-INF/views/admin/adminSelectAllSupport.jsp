<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>관리자 - 후원 정산 관리</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminCommon.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminNoticeBoard.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/styles.css">
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>
  <script src="/resources/js/ui.js"></script>
 <style>
 .bold {
 	color : #ffa77e;
 	font-size : 1.5em;
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
          <p>후원 정산 관리</p>
        </div>

        <div class="box-user">
          <a href="#">${sessionScope.member.nick }님</a>
          <a href="/">로그아웃</a>
        </div>
      </div>
    </div>



    <div id="content">
      <div class="container">
        <section>
          <div class="cont-head">
            <h3 class="cont-title">후원 정산 현황</h3>
          </div>
          <div class="cont-body">
            <table class="search-t">
              <tbody>
                <tr>
                  <td>검색기간</td>
                  <td>

                    <div class="input-group">
                      <input type="checkbox" name="daily">
                      <span>일별</span>
                      <input type="date"><span class="next">~</span><input type="date">
                      <button class="btn btn-l">어제</button>
                      <button class="btn btn-c">1주일</button>
                      <button class="btn btn-r">1개월</button>
                    </div>

                    <div class="input-group">
                      <input type="checkbox" name="daily">
                      <span>월별</span>
                      <select class="year">
                        <option value="">2022년</option>
                        <option value="">2021년</option>
                        <option value="">2020년</option>
                        <option value="">2019년</option>
                      </select>
                      <select class="month">
                        <option value="">1월</option>
                        <option value="">2월</option>
                        <option value="">3월</option>
                        <option value="">4월</option>
                        <option value="">5월</option>
                        <option value="">6월</option>
                        <option value="">7월</option>
                        <option value="">8월</option>
                        <option value="">9월</option>
                        <option value="">10월</option>
                        <option value="">11월</option>
                        <option value="">12월</option>
                      </select>
                    </div>

                  </td>
                </tr>
                <tr>
                  <td>검색어</td>
                  <td>
                    <div class="input-group mb-0">
                      <select class="b-type">
                        <option value="">사업자유형</option>
                      </select>
                      <input type="text" placeholder="검색어를 입력하세요">
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="cont-foot">
            <button class="btn-sm fs-16 fc-w bg-1" type="submit">검색</button>
            <button class="btn-sm fs-16 fc-w bg-1" type="button">초기화</button>
          </div>
        </section>
      </div>

	
      <div class="container">
        <h3 class="cont-title">기간별 후원 정산 내역 검색 결과</h3>
        	총 <span class="bold">${recordSupportTotalCount }</span>건
        <div class="table_wrap">
          <table class="pay-t">
            <thead class="bg-1">
              <tr class="fc-w fs-16">
                <th width="200">순번</th>
                <th width="200">예약일</th>
                <th width="200">사업자유형</th>
                <th width="300">예약번호</th>
                <th width="200">업체명</th>
                <th width="200">상품명</th>
              </tr>
            </thead>
			
            <tbody>
            <c:choose>
            <c:when test="${!requestScope.list.isEmpty() }">
            <c:forEach items="${requestScope.list }" var="sp" varStatus="i">
            	<tr>
            		<td>${ i.count + (currentPage - 1) * 10 }</td>
            		<td>${sp.reservationDate }</td>
            		<td>${sp.authorityInfo }</td>
            		<td>${sp.reNo }</td>
            		<td>${sp.bizName }</td>
            		<td>${sp.menuName }</td>
            	</tr>
            </c:forEach>
            </c:when>
            </c:choose>
            </tbody>

          </table>

          <div id="page_wrap">
            <ul class="page_ul">
              <c:if test="${ preNavi > 0}">
                <li><a href='/admin/adminSelectAllSupport.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
              </c:if>
              <c:forEach items="${ navi }" var="i">
                <c:choose>
                  <c:when test="${i==currentPage}">
                  <li><a id="page_active" href='/admin/adminSelectAllSupport.do?currentPage=${i}'>${i}</a></li>
                  </c:when>
                <c:otherwise>
                  <li><a id="page_inactive" href='/admin/adminSelectAllSupport.do?currentPage=${i}'>${i}</a></li>
                </c:otherwise>
                 </c:choose>
               </c:forEach>
               <c:if test="${ nextNavi } != 0">
               <li><a href='/admin/adminSelectAllSupport?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
               </c:if>
            </ul>
          </div>

        </div>
      </div>
    </div>
    </div>

    <script>
      $(".mdl_nav>li").click(function () {
        $(this).find(".sub_nav").slideToggle();
      });
    </script>

</body>

</html>