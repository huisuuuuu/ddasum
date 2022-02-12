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
  <link rel="stylesheet" type="text/css" href="/resources/commons/adminNoticeBoard.css">
  <link rel="stylesheet" type="text/css" href="/resources/commons/styles.css">
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>
  <script src="/resources/js/ui.js"></script>
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
            <p>전체 <span>10</span> 건</p>
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
                  <a href="/admin/adminNoticeWrite.do">글쓰기</a>
                </button>
        
            </form>        
          </div>
        </div>

        <div class="table_wrap">
          <table>
            <thead>
              <tr>
                <th width="100"><input type="checkbox" value='selecctall' name='selectall' onclick='selectAll(this)'></th>
                <th width="100">글번호</th>
                <th width="200">글제목</th>
                <th width="300">글내용</th>
                <th width="150">상단 고정</th>
                <th width="200">수정</th>
              </tr>
            </thead>

            <tbody>
            <c:choose>
            <c:when test="${!requestScope.list.isEmpty()} }">
            <c:forEach items="${requestScope.list }" var="notice">

              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>${notice.iNo}</td>
                <td>${notice.iTitle }</td>
                <td>${notice.iContent }</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>

            
            </c:forEach>
            </c:when>
            </c:choose>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
              <tr>
                <td><input type="checkbox" onclick='checkSelectAll(this)' name='notice'></td>
                <td>10</td>
                <td>꿈나무 카드 인증 안내</td>
                <td>글내용입니다길어져라얍얍얍</td>
                <td><button type="button" class="ok_btn">고정</button></td>
                <td><button type="button" class="ok_btn">수정</button></td>
              </tr>
            </tbody>

          </table>

          <div id="page_wrap">
            <ul class="page_ul">

            </ul>
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
</script>

</html>