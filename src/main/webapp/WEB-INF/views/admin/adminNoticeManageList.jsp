<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>관리자 - 고객센터 관리</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap"rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminCommon.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/styles.css">
  <link rel="stylesheet" href="/resources/commons/adminNoticeBoard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/ui.js"></script>
<style>
button {
	color : white !important;
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
          <p>고객센터 관리</p>
          <p>공지사항 관리</p>
        </div>

        <div class="box-user">
          <a href="/">${sessionScope.member.nick }님</a>
          <a href="/">로그아웃</a>
        </div>
      </div>
    </div>

    <div id="content">
      <div class="container br-1">
        <div class="container_top">
          <div class="count-all">
            <p>전체 <span>${recordNoticeTotalCount }</span> 건</p>
          </div>

          <div class="box-search">
            <form>
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

                <button class="wri_btn">
                  <a href="/admin/adminNoticeWrite.do">글쓰기</a></button>

                <!--<c:if test='${noti.IDELYN.equals("N") }'>-->                
                <!--</c:if>-->
                
                <button class="wri_btn" value="선택삭제" id="delBtn">
                <a href="/admin/adminNoticeDel.do?iNo=${noti.INO }">삭제</a></button>
                
                <c:if test='${noti.IDELYN.equals("Y") }'>
                <button class="wri_btn" value="선택복원" id="reBtn">
                <a href="/admin/adminNoticeDel.do?iNo=${noti.INO }">복원</a></button>
                </c:if>                
        
            </form>        
          </div>
        </div>

        <div class="table_wrap">
          <table>
            <thead>
              <tr>
                <th width="100"><input type="checkbox" value='selecctall' name='selectall' onclick='selectAll(this)' id="selectall"></th>
                <th width="100">글번호</th>
                <th width="200">글제목</th>
                <th width="300">글내용</th>
                <th width="150">상단 고정</th>
                <th width="200">수정</th>
              </tr>
            </thead>

            <tbody>
            <c:choose>
            <c:when test="${!requestScope.list.isEmpty()}">
            <c:forEach items="${requestScope.list}" var="noti" varStatus="i">
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice' value="${noti.INO }"></td>
                <td>${ i.count + (currentPage - 1) * 10 }</td>
                <td><a href="/admin/adminNoticeDetail.do?iNo=${noti.INO}">${noti.ITITLE }</a></td>
                <td><a href="/admin/adminNoticeDetail.do?iNo=${noti.INO}">${noti.ICONTENT }</a></td>
                <td><button type="button" class="ok_btn"><a href="/admin/adminNoticeFix.do?iNo=${noti.INO }">고정</a></button></td>
                <td><button type="button" class="ok_btn"><a href="/admin/adminNoticeUpdatePage.do?iNo=${noti.INO}">수정</a></button></td>
              </tr>

            
            </c:forEach>
            </c:when>
            </c:choose>
            </tbody>

          </table>

          <div id="page_wrap">
            <ul class="page_ul">
              <c:if test="${ preNavi > 0}">
                <li><a href='/admin/adminNoticeManageList.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
              </c:if>
              <c:forEach items="${ navi }" var="i">
                <c:choose>
                  <c:when test="${i==currentPage}">
                  <li><a id="page_active" href='/admin/adminNoticeManageList.do?currentPage=${i}'>${i}</a></li>
                  </c:when>
                <c:otherwise>
                  <li><a id="page_inactive" href='/admin/adminNoticeManageList.do?currentPage=${i}'>${i}</a></li>
                </c:otherwise>
                 </c:choose>
               </c:forEach>
               <c:if test="${ nextNavi } != 0">
               <li><a href='/admin/adminNoticeManageList.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
               </c:if>
            </ul>
          </div>

        </div>
      </div>
    </div>
    </div>

</body>

<script>

function checkSelectAll(checkbox)  {
	  const selectall 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkbox.checked === false)  {
	    selectall.checked = false;
	  }
	}

	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('notice');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	
	function
		
/* 	$('#selectall').click(function(){
		if($("selectall".prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	});
		
	$('#delete').click(function(){
		if(confirm("삭제하시겠습니까?")){
			$("input[name=notice]:checked").each(function(){
				var tr_value = $(this).val();
				var tr=$("tr[data-tr_value'"+tr_value+"']");
				tr.remove();
			});
		}else{
			return false;
		}
	});	
	});
 */
	

	
</script>

</html>