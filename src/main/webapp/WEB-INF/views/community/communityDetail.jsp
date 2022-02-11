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
        <br><br><br><br>

        <div class="align_buttons">
            <div></div>
            <a id="preCommunity" class="" href="/community/communityDetail.do?cNo=${requestScope.map['community'].preNo }&currentPage=${requestScope.map['currentPage'] }" ><button type="button" class="basic_button"><img src="/resources/images/arrow-up-sign-to-navigate.png" alt=""> 이전글</button></a>
            <a id="nextCommunity" class="" href="/community/communityDetail.do?cNo=${requestScope.map['community'].nextNo }&currentPage=${requestScope.map['currentPage'] }" ><button type="button" class="basic_button"><img src="/resources/images/arrow-down-sign-to-navigate.png" alt=""> 다음글</button></a>
            <a href="/community/communityList.do?currentPage=${requestScope.map['currentPage'] }"><button type="button" class="basic_button" style="width:60px;">목록</button></a>
        </div>
        
        <script>
       		$(function(){
       			if(${requestScope.map['community'].preNo }==0){
       				$("#preCommunity").addClass("prevent");
       				$("#preCommunity").children().attr("disabled",true);
       			}
       			if(${requestScope.map['community'].nextNo }==0){
       				$("#nextCommunity").addClass("prevent");
       				$("#nextCommunity").children().attr("disabled",true);
       			}
       		})
        </script>
        
        <div id="board_detail">
            <div id="detail_area">${requestScope.map['community'].area } > <Strong>${requestScope.map['community'].sigu }</Strong></div>
            <div id="detail_title"><Strong>${requestScope.map['community'].cTitle }</Strong></div>
            <div>
                <div class="profile"><img src="${requestScope.map[community].pImage }" alt="" /></div>
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
	            initialValue: "${requestScope.map['community'].cContent}"
        });
    </script>        
           
            <div id="comment">
            		<div>댓글 
            			<c:if test="${!requestScope.map['comment'].isEmpty() }">
            				(${requestScope.map['comment'].size() })
            			</c:if>
            		</div>
                <hr class="underbar">
                <c:choose>
	                <c:when test="${!requestScope.map['comment'].isEmpty() }">
	                	<c:forEach items="${requestScope.map['comment'] }" var="com">
	                		<div class="depth${com.comDepth }"></div>	
		                	<div class="commment_box" data-comNo="${com.comNo }">
			                    <div class="profile"><img src="${com.pImage }" alt="" /></div>
			                    <div class="comment_detail comment_detail${com.comDepth }">
			                        <div class="comment_nick"><Strong>${com.nick }</Strong></div>
		                   
		                    	<c:if test="${String.valueOf(com.comSecretYN) eq 'N' || com.userNo == sessionScope.member.userNo || requestScope.map['community'].userNo == sessionScope.member.userNo || sessionScope.member.authorityId.equals('ADMIN')}">   
			                        <div class="comment">
		                        		<input type="text" value="${com.comContent }" name="updateComment" data-comNo="${com.comNo}" class="update_comment update_disabled" disabled/>
		                        		<%-- <button type="button" class="comment_update_btn hidden" data-comNo="${com.comNo}">수정</button> --%>
			                        </div>
			                    </c:if>
			                    <c:if test="${String.valueOf(com.comSecretYN) eq 'Y' && com.userNo != sessionScope.member.userNo && requestScope.map['community'].userNo != sessionScope.member.userNo && !sessionScope.member.authorityId.equals('ADMIN')}">
			                        <div class="comment">비밀댓글입니다.</div>
								</c:if>			                    
		                     
			                        <div class="comment_date">${com.comRegDate }</div>
			                    </div>
			                 <c:if test="${sessionScope.member != null }">  
			                    <div class="comment_option">
			                        <button class="comment_reply" type="button" data-depth="${com.comDepth }">
			                            답글
			                        </button>
			                        <button class="more_option">
			                            <img src="/resources/images/moreoptionicon.png" alt="">
			                        </button>
			                    <c:if test="${com.userNo == sessionScope.member.userNo || sessionScope.member.authorityId.equals('ADMIN')}">    
			                        <div class="more_option_box hidden" data-show="none">
			                        	<div class="option_box">
				                	    	<div class="comment_update">수정</div>
							                <div class="comment_delete" data-comNo="${com.comNo }">삭제</div>
							            </div>
			                       	</div>
			                    </c:if>  	
		                    	</div>
		                    </c:if> 	
		                    </div>
		                    <div class="reply_box" data-reply="none"></div>
		                    <hr class="underbar">
	                	</c:forEach> 
	            	</c:when>
            		<c:otherwise>
            			<div style="margin:10px;">등록된 댓글이 없습니다.</div>
            		</c:otherwise>
            	</c:choose>
            	
            	<script>
            		/* 답글작성 */
            		$(".comment_reply").click(function(){
            			const depth = parseInt($(this).attr("data-depth"))+1;
            			const pComNo = $(this).parent().parent().attr("data-comNo");
            			const writeBox = '<div class="comment_area reply_depth'+ depth +'" data-pComNo='+pComNo+'>'+
				                        '<input class="new_comment" type="text" name="comComment" maxlength="200" data-depth='+depth+'>'+
				                        '<div class="align_buttons">'+
				                        	'<div></div>'+
				                        	'<div class="comment_length">0 / 200</div>'+
				                        	'<label class="secret_wrapper"><input type="checkbox" class="secret" name="secretYN" value="Y"><i class="check-icon"></i></label>'+
				                        	'<button class="comment_submit" type="button">등록</button>'+
				                        '</div>'+
				                		'</div>';
            			
            			const div = $(this).parent().parent().next();
            			const replyBox = $(".reply_box");

            			if(div.attr("data-reply")=="none"){
            				div.html(writeBox);
            				div.attr("data-reply","show");
            				$("#basic_comment").css("display","none");
            				
            			}else{
             				div.html("");
            				div.attr("data-reply","none");
            				$("#basic_comment").css("display","block");
            			};
                        
            		})
            		
					/* 댓글옵션 */
            		function hidden(){
            			
            			const moreOption = $(".more_option_box");
						
            			moreOption.filter(function(index){
 				        	$(this).addClass("hidden");
				        });
            		};
			
            		$(document).on("click", ".more_option", function () {
		                	const box = $(this).next(".more_option_box");

					        if(box.hasClass("hidden")===true){
					        	hidden();
					        	box.removeClass("hidden");
					        }else{
					        	box.addClass("hidden");
					        }; 
            			
	                });
            		
            	</script>
            	
                <!-- 기본댓글작성 -->
                <c:if test="${sessionScope.member !=null }">
                    <div class="comment_area" id="basic_comment" data-pComNo="0">
                            <input class="new_comment" type="text" name="newComment" maxlength="200" data-depth="1" placeholder="댓글을 입력해주세요">
                            <div class="align_buttons">
	                            <div></div>
	                            <div class="comment_length">0 / 200</div>
	                            <label class="secret_wrapper"><input type="checkbox" class="secret" name="secretYN" value="Y"><i class="check-icon"></i></label>
	                            <button class="comment_submit" type="button">등록</button>
                            </div>
                    </div>
                </c:if>
           
                </div>
                                    
                    <script>
	                    $(document).ready(function () {
	                    	  /* 댓글 글수 */
	                    	  $(document).on("keyup", ".new_comment", function () {
	                    		const comment = $(this).val();

	  	                        $(this).next().children(".comment_length").html(comment.length + " / 200");
	                    	  });
	                    	  /* 댓글 등록 */
	                    	  $(document).on("click", ".comment_submit", function () {
		                    	  
	  	                    		const cNo = ${requestScope.map['community'].cNo};
	  	                    		const comContent = $(this).parent().prev().val();
	  	                    		const comDepth = $(this).parent().prev().attr("data-depth");
	  	                    		const pComNo = $(this).parent().parent().attr("data-pComNo");
	  	                    		let comSecretYN;
	  	                    		if($(this).prev().children().prop("checked")){
	  	                    			comSecretYN = "Y";
	  	                    		}else{
	  	                    			comSecretYN = "N";
	  	                    		}
	  	                    		
 	  	                    		$.ajax({
	  	                    			url: "/community/commentInsert.do",
	  	                    			type: "post",
	  	                    			data: {"cNo":cNo, "comContent":comContent, "comDepth":comDepth, "pComNo":pComNo, "comSecretYN":comSecretYN},
	  	                    			success:function(result){
	  	                    				location.reload("/community/communityDetail.do?cNo="+cNo+"?currentPage="+"${requestScope.currentPage }");
	  	                    			},
	  	                    			error:function(){
	  	                    				console.log("ajax 통신 실패");
	  	                    			}
	  	                    		});
	  	                    	})
	                    	  });
						/* 댓글삭제 */
						$(document).on("click", ".comment_delete", function () {
                    		if(confirm("삭제하시겠습니까?")){
                    			const comNo = $(this).attr("data-comNo");
                    			console.log(comNo);
                    			$.ajax({
                    				url:"/community/communityCommentDelete.do",
                    				type:"post",
                    				data:{"comNo": comNo},
                    				success:function(){
                    					alert("댓글을 삭제하였습니다.");
                    					location.reload(true);
                    				},
                    				error:function(){
                    					console.log("서버 호출 실패");
                    				}
                    			});
                    		};
                    	});
						/* 댓글 수정 */
						$(document).on("click", ".comment_update", function () {
							/* console.log($(this).parent().parent().parent().prev().children().next().children().children().val()); */
							const $comment = $(this).parent().parent().parent().prev().children(".comment").children();
							$comment.removeClass("update_disabled");
							$comment.prop("disabled", false);
							$comment.next().removeClass("hidden");
						});
						$(document).on("keydown", ".update_comment", function (key) {
							if(key.keyCode==13){
								const comment = $(this).val();
								const comNo = $(this).attr("data-comNo");
								
								console.log(comment);
								console.log(comNo);
								
                    			$.ajax({
                    				url:"/community/commentUpdate.do",
                    				type:"post",
                    				data:{"comNo": comNo, "comment":comment},
                    				success:function(){
                    					alert("댓글을 수정하였습니다.");
                    					location.reload(true);
                    				},
                    				error:function(){
                    					console.log("서버 호출 실패");
                    				}
                    			});
							}
							
						});
                    </script>

            </div>
         <c:if test="${sessionScope.member.userNo == requestScope.map['community'].userNo || sessionScope.member.authorityId.equals('ADMIN')}">
            <div class="align_buttons">
                <div></div>
                
                <form action="/community/communityUpdatePage.do" method="post">
                	<input type="text" name="cNo" value="${requestScope.map['community'].cNo }" hidden/>
                	<input type="text" name="currentPage" value="${requestScope.map['currentPage'] }" hidden/>
                	<button type="submit" class="basic_button" id="updateBtn">수정</button>
                </form>
                <button type="button" class="basic_button" id="deleteBtn">삭제</button>
                
            </div>
		</c:if>
            <script>
            	$("#deleteBtn").click(function(){
            		if(comfirm("삭제하시겠습니까?")){
            			
            			$.ajax({
            				url:"/community/communityDelete.do",
            				type:"post",
            				data:{"cNo": cNo},
            				success:function(){
            					location.replace('/community/communityDetail.do?currentPage=1}');	
            				},
            				error:function(){
            					consol.log("서버 호출 실패");
            				}
            			});
            		}
            	})

            </script>
        </div>

    <br /><br /><br /><br /><br />
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>      
</body>
</html>