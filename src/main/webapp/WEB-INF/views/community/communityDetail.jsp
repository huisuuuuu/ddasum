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
	<link rel="stylesheet" type="text/css" href="/resources/css/communityDetail.css">
    <!--Toast editor cdn-->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!--Toast editor css-->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />	
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>	

    <div id="content_wrapper">
        <div id="page_title">혼밥시러 <br>
            <hr id="title_underbar">
        </div>
        <br><br><br><br><br>

        <div class="align_buttons">
            <div></div>
            <a href="/community/communityDetail.do?cNo="><button type="button" class="basic_button"><img src="/resources/images/arrow-up-sign-to-navigate.png" alt=""> 이전글</button></a>
            <a href="/community/communityDetail.do?cNo="><button type="button" class="basic_button"><img src="/resources/images/arrow-down-sign-to-navigate.png" alt=""> 다음글</button></a>
            <a href="/community/communityList.do"><button type="button" class="basic_button" style="width:60px;">목록</button></a>
        </div>
        
        <div id="board_detail">
            <div id="detail_area">${requestScope.map['community'].area } > <Strong>${requestScope.map['community'].sigu }</Strong></div>
            <div id="detail_title"><Strong>${requestScope.map['community'].cTitle }</Strong></div>
            <div>
                <div id="profile">프로필</div>
                <div id="info">
                    <div class="info">${requestScope.map['community'].nick }</div>
                    <div class="info">${requestScope.map['community'].cRegDate }</div>
                </div>
            </div>
            <hr class="underbar">
            <div id="detail_content">
            	<div id="viewer">
                   
                </div>
            </div>
    <script>
        const Editor = toastui.Editor;
               const viewer= Editor.factory({
           el: document.querySelector("#viewer"),
            viewer: true,
            height: "500px",
            initialValue: "# hello"
        });
    </script>        
           
            <div id="comment">
            	<c:if test="${!requestScope.map['comList'].isEmpty() }">
            		<div>댓글 (${requestScope.map['comList'].size() })</div>
                <hr class="underbar">
                
                	<c:forEach items="${requestScope.map['comList'] }" var="com">
                
	                	<div>
		                    <div id="profile">프로필</div>
		                    <div id="comment_detail">
		                        <div class="comment_nick"><Strong>${com.nick }</Strong></div>
		                        <div class="comment">com.comContent</div>
		                        <div class="comment_date">com.comRegDate</div>
		                        </div>
		                    <div clss="comment_option">
		                        <button class="comment_reply" type=button com-data="${com.ComNo }">
		                            답글
		                        </button>
		                        <button class="more_option">
		                            <img src="/resources/images/moreoptionicon.png" alt="">
		                        </button>
	                    </div>
                	</c:forEach> 
            	</c:if>
            	
                <!-- 댓글작성 -->
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
                    
                    <script>
                    	$(".comment_delete").click(function(){
                    		if(comfirm("삭제하시겠습니까?")){
                    			const comNo = $(this).attr("com-data");
                    			
                    			$.ajax({
                    				url:"/community/communityCommentDelete.do",
                    				type:"post",
                    				data:{"comNo": comNo},
                    				success:function(){
                    					alert("댓글을 삭제하였습니다.");
                    					//location.replace('/community/communityDetail.do?cNo='+${requstScope.c.getCNo()});	
                    				},
                    				error:function(){
                    					consol.log("ajax2.do 서버 호출 실패");
                    				}
                    			});
                    		}
                    	})
                    </script>
                </div>
                <hr class="underbar">
<!--                 <div>
                    <img src="resources/images/up-arrow.png" class="indent_arrow">
                    <div id="profile">프로필</div>
                    <div id="comment_detail">
                        <div class="comment_nick"><Strong>부천학생</Strong></div>
                        <div class="comment">저랑 같이 먹어요</div>
                        <div class="comment_date">2022.01.27</div>
                    </div>
                </div> -->
                <hr class="underbar">

            </div>
            <div class="align_buttons">
                <div></div>
                <c:if test="">
                <form action="/community/communityUpdate.do" method="post">
                	<input type="text" name="cNo" value="${requestScope.c.getCNo() }" hidden/>
                	<button type="button" class="basic_button" id="updateBtn">수정</button>
                </form>
                <button type="button" class="basic_button" id="deleteBtn">삭제</button>
                </c:if>
            </div>
            <script>
            	$("#deleteBtn").click(function(){
            		if(comfirm("삭제하시겠습니까?")){
            			
            			$.ajax({
            				url:"/community/communityCommentDelete.do",
            				type:"post",
            				data:{"comNo": comNo},
            				success:function(){
            					alert("댓글을 삭제하였습니다.");
            					location.replace('/community/communityDetail.do?cNo='+'${requestScope.c.getCNo()}');	
            				},
            				error:function(){
            					consol.log("ajax2.do 서버 호출 실패");
            				}
            			});
            		}
            	})
            	$("#updateBtn").click(function(){
            		
            	})
            </script>
        </div>
    </div>
    <script>
    $("#new_comment").keyup(function(){
        const comment = $("#new_comment").val();
        console.log(comment.length);
        $("#comment_length").html(comment.length + " / 200");
    })
    </script>
    <script>
    	const viewer = new toastui.Editor({
        el: $("#viewer"),
        viewer: true,
        height: "500px",
        initialValue: content
    	})
    </script>
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>      
</body>
</html>