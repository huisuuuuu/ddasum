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
	<link rel="stylesheet" type="text/css" href="/css/community/communityDetail.css">
</head>
<body>
    <div id="content_wrapper">
        <div id="page_title">혼밥시러 <br>
            <hr id="title_underbar">
        </div>
        <br><br><br><br><br>

        <div class="align_buttons">
            <div></div>
            <a href=""><button type="button" class="basic_button"><img src="resources/images/arrow-up-sign-to-navigate.png" alt=""> 이전글</button></a>
            <a href=""><button type="button" class="basic_button"><img src="resources/images/arrow-down-sign-to-navigate.png" alt=""> 다음글</button></a>
            <a href="/community/communityList.do"><button type="button" class="basic_button" style="width:60px;">목록</button></a>
        </div>
        
        <script>
        	$(".align_buttons")
        </script>
        <div id="board_detail">
            <div id="detail_area">지역 > <Strong>세부지역</Strong></div>
            <div id="detail_title"><Strong>제목</Strong></div>
            <div>
                <div id="profile">프로필</div>
                <div id="info">
                    <div class="info">혼밥시러</div>
                    <div class="info">2022.01.27</div>
                </div>
            </div>
            <hr class="underbar">
            <div id="detail_content">내용</div>
            <div id="comment">
                <div>댓글 (댓글갯수)</div>
                <hr class="underbar">
                <div>
                    <div id="profile">프로필</div>
                    <div id="comment_detail">
                        <div class="comment_nick"><Strong>부천학생</Strong></div>
                        <div class="comment">저랑 같이 먹어요</div>
                        <div class="comment_date">2022.01.27</div>
                        </div>
                    <div clss="comment_option">
                        <button class="comment_delete">
                            삭제
                        </button>
                            점점점
                    </div>
                </div>
                <hr class="underbar">
                <div>
                    <img src="resources/images/up-arrow.png" class="indent_arrow">
                    <div id="profile">프로필</div>
                    <div id="comment_detail">
                        <div class="comment_nick"><Strong>부천학생</Strong></div>
                        <div class="comment">저랑 같이 먹어요</div>
                        <div class="comment_date">2022.01.27</div>
                    </div>
                </div>
                <hr class="underbar">
                <div>
                    <div id="comment_area">
                        <form action="">
                            <input id="new_comment" type="text" name="newComment" maxlength="200">
                            <div class="align_buttons">
                            <div></div>
                            <div id="comment_length">0 / 200</div>
                            <input type="checkbox" id="secret" name="secretYN" value="Y"><label for="secret"></label>
                            <button id="comment_submit">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="align_buttons">
                <div></div>
                <button type="button" class="basic_button">수정</button>
                <button type="button" class="basic_button">삭제</button>
            </div>
        </div>
    </div>
    <script>
    $("#new_comment").keyup(function(){
        const comment = $("#new_comment").val();
        console.log(comment.length);
        $("#comment_length").html(comment.length + " / 200");
    })
    </script>
</body>
</html>