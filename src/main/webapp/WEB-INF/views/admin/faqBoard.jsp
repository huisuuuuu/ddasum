<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<script src="https://code.jquery.com/jquery-3.6.0.js"
integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/css/faqBoard.css">

<title>자주묻는질문</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<jsp:include page="../commons/header/site-header.jsp"/>
		</div>
		<div id="body">
			<div class="titleArea">
				<span class="title">자주 묻는 질문</span>
			</div>
			<div class="faqArea">
				<div class="listArea">
					<div class="icon">
						
					</div>
					<div class="subject">
					꿈나무 카드 인증안내
					</div>
					<div class="content">
						<div class="iconArea">
							<img class="img" src="/resources/images/answer.png">
						</div>
						<span class="comment">
							마이페이지 > 꿈나무 카드 인증 메뉴에 꿈나무 카드 사진을 업로드 하시면,<br>
							관리자가 3일 내에 승인 작업을 진행합니다. 상세한 내용은 카카오톡 문의 바랍니다.
						</span>
					</div>
					<div class="subject">
					후원 증빙 내역 다운로드 안내<br>
					</div>
					<div class="content">
					2011년 베스트 후원 업체 선정<br>
					</div>
					<div class="subject">
					꿈나무 카드 분실 대처
					</div>
					<div class="content">
					안내내용 추가<br>
					</div>
					<div class="subject">
					후원 업체 신청
					</div>
					<div class="content">
					안내서 배부<br>
					</div>
					<div class="subject">
					자원봉사자 모집 공고
					</div>
					<div class="content">
					안내내용 추가<br>
					</div>										
				</div>
			</div>
		<div id="footer">
			<jsp:include page="../commons/footer/site-footer.jsp"/>			
		</div>
	</div>





    <script>
        $(document).ready(function(){
            $(".subject").click(function(){
                $(this).next().slideToggle(200);
                $(this).style
            });    
        });
        
    </script>

</body>
</html>