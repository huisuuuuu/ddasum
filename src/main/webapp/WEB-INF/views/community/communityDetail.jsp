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
	<!-- SweetAlert2 CDN -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/communityDetail.css">
	<link rel="stylesheet" type="text/css" href="/resources/commons/layout.css">
	<link rel="stylesheet" type="text/css" href="/resources/commons/mainTitle.css">
    <!--Toast editor cdn-->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!--Toast editor css-->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />	
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>	

 <div id="content">
 
         <div class="main_tit">
            <a href="/community/communityList.do" style="all:unset;"><h1>혼밥시러</h1></a>
            <div class="under"></div>
         </div>
         <div class="contents_wrap">

        <div class="align_buttons">
            <div></div>
            <a id="preCommunity" class="" href="/community/communityDetail.do?cNo=${requestScope.map['community'].preNo }&currentPage=${requestScope.map['currentPage'] }" ><button type="button" class="basic_button"><img src="/resources/images/arrow-up-sign-to-navigate.png" alt=""> 이전글</button></a>
            <a id="nextCommunity" class="" href="/community/communityDetail.do?cNo=${requestScope.map['community'].nextNo }&currentPage=${requestScope.map['currentPage'] }" ><button type="button" class="basic_button"><img src="/resources/images/arrow-down-sign-to-navigate.png" alt=""> 다음글</button></a>
            <a href="/community/communityList.do?currentPage=${requestScope.map['currentPage'] }"><button type="button" class="basic_button" style="width:60px;">목록</button></a>
        </div>
        
        <!-- 다음글/이전글이 없을 경우 버튼 disabled -->
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
                <div class="profile"><img src="${requestScope.map[community].pImage }" alt="" style="width:100%;height:100%;border-radius:20px;" onerror="this.src='/resources/images/userProfile.png'"/></div>
                <div id="info">
                    <div class="info">${requestScope.map['community'].nick }</div>
                    <div class="info">${requestScope.map['community'].cRegDate }</div>
                </div>
            </div>
            <hr class="underbar">
            <div id="detail_content">
            	<!-- toast ui edirot viewer 담을 태그-->
            	<div id="viewer">
                   
                </div>
            </div>
            
    <!-- toast ui viewer-->        
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
		                	<div>
		                		<div class="depth${com.comDepth }"></div>	
			                	<div class="commment_box" data-comNo="${com.comNo }">
				                    <div class="profile"><img src="${com.pImage }" alt="" style="width:100%;height:100%;border-radius:20px;"onerror="this.src='/resources/images/userProfile.png'"/></div>
				                    <div class="comment_detail comment_detail${com.comDepth }">
				                        <div class="comment_nick"><Strong>${com.nick }</Strong></div>
			                   
			                    	<c:if test="${String.valueOf(com.comSecretYN) eq 'N' || com.userNo == sessionScope.member.userNo || requestScope.map['community'].userNo == sessionScope.member.userNo || sessionScope.member.authorityId.equals('ADMIN')}">   
				                        <div class="comment">
			                        		<div class="pTagComment" data-comNo="${com.comNo}">${com.comContent }</div>
			                        		<button type="button" class="cUpBtn hidden">수정</button>
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
			                    <div class="reply_box" data-reply="none">
			                    </div>
			                </div>    
			                    <hr class="underbar">
	                	</c:forEach> 
	            	</c:when>
	            	
            		<c:otherwise>
            			<div style="margin:10px;">등록된 댓글이 없습니다.</div>
            		</c:otherwise>
            	</c:choose>
            	
            	<!-- 답글 작성 및 댓글 옵션 script -->
            	<script>
            		/* 답글작성 */
            		$(".comment_reply").click(function(){
            			const depth = parseInt($(this).attr("data-depth"))+1;
            			const pComNo = $(this).parent().parent().attr("data-comNo");
            			const writeBox = '<div class="comment_area reply_depth'+ depth +'" data-pComNo='+pComNo+'>'+
				                        '<textarea name="comComment" data-comNo="${com.comNo}" maxlength="200" style="width:100%" class="new_comment auto_size" data-depth='+depth+' placeholder="댓글을 입력해주세요" resize="none" ></textarea>'+
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
            		
					/* 댓글옵션닫아주는 함수 */
            		function hidden(){
            			const moreOption = $(".more_option_box");
						
            			moreOption.filter(function(index){
 				        	$(this).addClass("hidden");
				        });
            		};
					/* 옵션 열러주는 이벤트 함수 */
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
                   		<textarea name="newComment" data-comNo="${com.comNo}" maxlength="200" style="width:100%" class="new_comment auto_size" data-depth="1" placeholder="댓글을 입력해주세요" resize="none" wrap="hard"></textarea>
                        <div class="align_buttons">
                          <div></div>
                          <div class="comment_length">0 / 200</div>
                          <label class="secret_wrapper"><input type="checkbox" class="secret" name="secretYN" value="Y"><i class="check-icon"></i></label>
                          <button class="comment_submit" type="button">등록</button>
                        </div>
                    </div>
                </c:if>
           
                </div>
                    <!-- 댓글 CRUD script -->               
                    <script>
	                    $(document).ready(function () {
	                    	  /* 댓글 글수 카운트 */
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
	  	                    		/* 비밀댓글 값 */
	  	                    		if($(this).prev().children().prop("checked")){
	  	                    			comSecretYN = "Y";
	  	                    		}else{
	  	                    			comSecretYN = "N";
	  	                    		}
	  	                    		
	  	                    		/* 빈 댓글 방지 */
	  	                    		if(comContent.length==0){
	  	                    			return;
	  	                    		}
	  	                    		
	  	                    		/* ajax로 댓글 전송 */
 	  	                    		$.ajax({
	  	                    			url: "/community/commentInsert.do",
	  	                    			type: "post",
	  	                    			data: {"cNo":cNo, "comContent":comContent, "comDepth":comDepth, "pComNo":pComNo, "comSecretYN":comSecretYN},
	  	                    			success:function(result){
	  	                    				if(result=="true"){
	  	                    				location.reload(true);
	  	                    				}
	  	                    			},
	  	                    			error:function(){
	  	                    				console.log("ajax 통신 실패");
	  	                    			}
	  	                    		});
	  	                    	})
	                    	  });
	                    
						/* 댓글삭제 */
						$(document).on("click", ".comment_delete", function () {
                			const comNo = $(this).attr("data-comNo");
                    		
                			/* 댓글삭제 확인 alert */
                			Swal.fire({
              				  icon: "warning",
              				  title: "삭제하시겠습니까?",
              				  confirmButtonText: "예",
              				  showCancelButton: true,
              				  cancelButtonText: "아니오",				  
              				}).then((result) => {
              					if(result.isConfirmed){
              						/* 댓글 삭제 확인 시 ajax로 댓글 삭제 */
              						$.ajax({
                          				url:"/community/communityCommentDelete.do",
                          				type:"post",
                          				data:{"comNo":comNo},
                          				success:function(result){
                  							
                          					if(result=="true"){ // 삭제 성공
              	            					Swal.fire({
              	            						  icon: "success",
              	            						  title: "성공!",
              	            						  text: "댓글을 삭제하였습니다.",
              	            						  confirmButtonText: "확인"
              	            						}).then((result) => {
              	            							if(result.isConfirmed){
              	            								location.reload(true);
              	            							}
              	            						})
                          					}else{ // 삭제 실패
              	            					Swal.fire({
              	            						  icon: "error",
              	            						  title: "실패!",
              	            						  text: "댓글을 삭제하지 못했습니다.",
              	            						  confirmButtonText: "확인"
              	            						});
                          					}		
                          				},
                          				error:function(){
                          					console.log("서버 호출 실패");
                          				}
              						})
              					}else{
  	            					Swal.fire({
	            						  icon: "info",
	            						  title: "취소!",
	            						  text: "취소하였습니다.",
	            						  confirmButtonText: "확인"
	            						});
              					};
              				});
                    	});
						
						/* 댓글 수정 */
						$(document).on("click", ".comment_update", function () {
							
							const $commentBox = $(this).parent().parent().parent().prev().children(".comment").children();
							
							/* div태그 수정속성 추가 */
 							$commentBox.attr("contenteditable",true);
							/* div태그 입력 css 적용을 위한 클래스 추가 */
 							$commentBox.addClass("updateCommentWrite");
 							/* 수정버튼 */
							$commentBox.next().removeClass("hidden");
							/* 댓글옵션창 숨기기 */
	            			hidden();
						});
						
						$(document).on("click", ".cUpBtn", function () {
								//$(".cUpBtn").click(function(){
									const comment = $(this).prev().html();
									const comNo = $(this).prev().attr("data-comNo");
									/* 수정댓글 ajax로 전송 */
									$.ajax({
		                				url:"/community/commentUpdate.do",
		                				type:"post",
		                				data:{"comNo": comNo, "comment":comment},
		                				success:function(result){
		                					location.reload(true);
		                				},
		                				error:function(){
		                					console.log("서버 호출 실패");
		                				}
		                			});								
								//});

						});
						// text에 맞춰 textarea 크기 조정
						$("textarea.auto_size").on('keydown keyup', function () {
						  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
						});
                    </script>

            </div>
         <!-- 게시글 작성자 또는 관리자에게만 수정 삭제버튼 생성 -->
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
		
			<!-- 게시물 삭제 script -->
            <script>
            	$("#deleteBtn").click(function(){
            		const cNo = ${requestScope.map['community'].cNo};
            		
        			Swal.fire({
      				  icon: "warning",
      				  title: "삭제하시겠습니까?",
      				  confirmButtonText: "예",
      				  showCancelButton: true,
      				  cancelButtonText: "아니오",				  
      				}).then((result) => {
      					if(result){
      						$.ajax({
                  				url:"/community/communityDelete.do",
                  				type:"post",
                  				data:{"cNo":cNo},
                  				success:function(result){
          							console.log(result);
          							console.log(typeof(result));
          							
                  					if(result=="true"){ // 삭제 성공
      	            					Swal.fire({
      	            						  icon: "success",
      	            						  title: "성공!",
      	            						  text: "게시물을 삭제하였습니다.",
      	            						  confirmButtonText: "확인",
      	            						}).then((result) => {
      	            							if(result){
      	            								location.replace("/community/communityList.do?currentPage=1");
      	            							}
      	            						})
                  					}else{ // 삭제 실패
      	            					Swal.fire({
      	            						  icon: "error",
      	            						  title: "실패!",
      	            						  text: "게시물을 삭제하지 못했습니다.",
      	            						  confirmButtonText: "확인",
      	            						});
                  					}		
                  				},
                  				error:function(){
                  					console.log("서버 호출 실패");
                  				}
      						})
      					}
      				});
            	})
            </script>
        </div>
   </div>
    <br /><br />
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>      
</body>
</html>