<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<div id="navigation">
            <div id="logo">
                <img src="/resources/images/ddasum_header_logo.png" alt="따숨로고">
            </div>
            
            <nav class="menu_list">
            
                        <ul class="mdl_nav">
                            <li>
                            <img class="icons" src="/resources/images/member.png" alt="회원관리">
								회원 관리 <i class="fas fa-chevron-down"></i>
                            </li>
                            <ul class="sub_nav">
                                <li>
                                	<a href="/admin/adminMemberManageList.do">회원 정보 관리</a>
                                </li>
                                <li>
                                	<a href="/admin/adminCardManageList.do">꿈나무 카드 인증 관리</a>                                	
                               	</li>
                            </ul>
                        </ul>

                        <ul class="mdl_nav">
                            <li>
                            <img class="icons" src="/resources/images/biz.png" alt="사업자관리">
								<a href="/admin/adminBizManageList.do">사업자 관리</a>
                            </li>
                        </ul>
                    
                         <ul class="mdl_nav">
                            <li>
                            <img class="icons" src="/resources/images/help.png" alt="고객센터">
								고객센터 관리 <i class="fas fa-chevron-down"></i>
                            </li>
                            <ul class="sub_nav">
                                <li>
                                	<a href="/admin/adminNoticeManageList.do">공지사항 관리</a>
                                </li>
                                <li>
                                	<a href="/admin/adminFAQManageList.do">자주 묻는 질문 관리</a>                                	
                                </li>
                            </ul>
                         </ul>
                                        
                        <ul class="mdl_nav">
                            <li>
                            <img class="icons" src="/resources/images/sales.png" alt="후원정산">
								<a href="/admin/adminSupport.do">후원 정산 관리</a>
                            </li>
                        </ul>
            </nav>
        </div>