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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/commons/adminCommon.css">
<link rel="stylesheet" href="/resources/commons/adminNavigation.css">
<link rel="stylesheet" href="/resources/commons/adminBoard.css">
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
                <p>후원 정산 관리</p>
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
					<p>후원 정산 현황</p>
                	<div id="search-area">
					<span>검색기간</span>
					<input type="checkbox" name="daily">
					<span>일별</span>
					<input type="date"> ~ <input type="date">
					<button>어제</button>
					<button>1주일</button>
					<button>1개월</button>
						<p>
							<input type="checkbox" name="daily" >
							<span>월별</span>
							<input type="month">
							<select>
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
						</p>
						</div>
					<span>검색어</span>
					<select>
						<option value="">사업자유형</option>

					</select>
					<input type="text"/><br>
					<div style="text-align: center;">
						<input class="confirmBTN" type="submit" value="검색">
						<input class="confirmBTN" type="button" value="초기화">
					</div>
				</div>

					</div>
                </div>
                <hr>
      
                <div class="table_wrap">
                    <table>
                        <thead>
                            <tr>
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
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><a href="/admin/adminUserDetail.do"><button type="button" class="ok_btn">확인</button></a></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="none_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
                            </tr>
                            <tr>
                                <td>꿈나무</td>
                                <td>user11</td>
                                <td>닉네임1</td>
                                <td>user11@naver.com</td>
                                <td>2022-02-02</td>
                                <td><button type="button" class="ok_btn">확인</button></td>
                                <td><button type="button" class="ok_btn">상세보기</button></td>
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