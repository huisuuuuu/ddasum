<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따숨</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/css/community/communityList.css">
</head>
<body>
    <div id="content_wrapper">
        <div id="page_title">혼밥시러 <br>
            <hr id="title_underbar">
        </div>
        <br><br><br><br><br>
        <div id="board_wrapper">
            <div class="table_tr">
                <button type="button" class="color_button" id="board_write">글쓰기</button>
				<script>
					$("board_write").click(function(){
						// 로그인 확인코드 추가
						
						location.replace("/community/communityWritePage.do");
					})
				</script>
                <div id="search_wrapper">
                    <form action="">
                        <select name="type" id="search_type">
                            <option value="title">제목</option>
                            <option value="writer">작성자</option>
                            <option value="all">제목+작성자</option>
                        </select>
                        <div id="search_bar">
                            <input id="search_keyword" type="text" name="keyword" placeholder="검색어를 입력해주세요">
                            <button class="color_button"><img src="resources/images/searchImage.png" alt=""></button>
                        </div>
                    </form>
                </div>
            </div>

            <table id="board_table">
                <tr class="board_table_tr">
                    <th class="td_no">번호</th>
                    <th class="td_area">지역</th>
                  <a href="">
                    <th class="td_title">제목</th>
                  </a>
                    <th class="td_writer">작성자</th>
                    <th class="td_date">작성일</th>
                    <th class="td_count">조회수</th>
                </tr>

            </table>

        </div>
    </div>
</body>
</html>