<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/resources/commons/adminCommon.css">
<link rel="stylesheet" href="/resources/commons/adminNavigation.css">
<link rel="stylesheet" href="/resources/commons/adminBoard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
                <a href="/">관리자</a>
                <a href="/">로그아웃</a>
            </div>
            </div>
        </div>
        
        <div id="content">
            <div class="container">
                <div class="container_top">
                    <div class="count-all">
                        <p>전체 <span>10</span> 건</p>
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
                                <th width="300">가입일</th>
                                <th width="200">이용내역</th>
                                <th width="200">인증확인</th>
                                <th width="150">승인/반려</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>user11</td>
                                <td>김가가</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">있음</button></td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">승인</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>user22</td>
                                <td>김나나</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="none_btn">없음</button></td>
                                <td><button type="button" class="ok_btn">대기</button></td>
                                <td><button type="button" class="ok_btn">반려</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>user11</td>
                                <td>김가가</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">있음</button></td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">승인</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>user22</td>
                                <td>김나나</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="none_btn">없음</button></td>
                                <td><button type="button" class="ok_btn">대기</button></td>
                                <td><button type="button" class="ok_btn">반려</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>user11</td>
                                <td>김가가</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">있음</button></td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">승인</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>user22</td>
                                <td>김나나</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="none_btn">없음</button></td>
                                <td><button type="button" class="ok_btn">대기</button></td>
                                <td><button type="button" class="ok_btn">반려</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>user11</td>
                                <td>김가가</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">있음</button></td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">승인</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>user22</td>
                                <td>김나나</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="none_btn">없음</button></td>
                                <td><button type="button" class="ok_btn">대기</button></td>
                                <td><button type="button" class="ok_btn">반려</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>user11</td>
                                <td>김가가</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">있음</button></td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">승인</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>user22</td>
                                <td>김나나</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="none_btn">없음</button></td>
                                <td><button type="button" class="ok_btn">대기</button></td>
                                <td><button type="button" class="ok_btn">반려</button></td>
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
          
          <script>
          $(".mdl_nav>li").click(function(){
        		$(this).find(".sub_nav").slideToggle();
        	});
        	</script>

</body>
</html>