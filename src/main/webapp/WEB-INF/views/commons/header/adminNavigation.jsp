
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <div id="sidenav">
    <div class="nav_logo">
    	<a href="/">
      <img src="/resources/images/ddasum_header_logo.png" alt="따숨로고">
      </a>
    </div>

    <nav class="nav_list">

      <ul class="nav_list_item">
        <li>
          <a href="/admin/adminMemberManageList.do">
            <img class="nav-i" src="/resources/images/member.png" alt="회원관리">회원관리
            <i class="bi bi-down f-r"></i></a>
        </li>
        <ul class="sub_nav">
          <li><a href="/admin/adminMemberManageList.do">회원 정보관리</a></li>
          <li><a href="/admin/adminCardManageList.do">꿈나무 카드 인증 관리</a></li>
        </ul>
      </ul>

      <ul class="nav_list_item">
        <li>
          <a href="/admin/adminBizManageList.do">
            <img class="nav-i" src="/resources/images/biz.png" alt="사업자 관리">사업자 관리</a>
        </li>
      </ul>

      <ul class="nav_list_item">
        <li>
          <a href="/admin/adminNoticeManageList.do">
            <img class="nav-i" src="/resources/images/help.png" alt="고객센터 관리">고객센터 관리
            <i class="bi bi-down f-r"></i></a>
          </a>
        </li>
        <ul class="sub_nav">
          <li><a href="/admin/adminNoticeManageList.do">공지사항 관리</a></li>
          <li><a href="/admin/adminFAQManageList.do">자주 묻는 질문 관리</a></li>
        </ul>
      </ul>

      <ul class="nav_list_item">
        <li>
          <a href="/admin/adminSupport.do">
            <img class="nav-i" src="/resources/images/sales.png" alt="후원 정산관리">후원 정산관리</a>
        </li>
      </ul>

    </nav>
  </div>
