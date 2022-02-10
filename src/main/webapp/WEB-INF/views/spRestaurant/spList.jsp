<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원식당리스트</title>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/spList.css">
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>	

    <div id="content_wrapper">
        <div id="page_title">
            후원식당
        </div>
        <div id="area_select">
			<div class="area" data-area="all"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=all&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }" >전체</a></div>        
            <div class="area" data-area="SEOUL"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=SEOUL&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }" >서울</a></div>
            <div class="area" data-area="INCHEON"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=GYEONGGI&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }" >인천</a></div>
            <div class="area" data-area="GYEONGGI"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=INCHEON&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }">경기</a></div>
        </div>
        <div id="food_select">
            <div class="type" data-type="all"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=all&order=${requestScope.terms['order'] }">전체</a></div> |
            <div class="type" data-type="KOR"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=KOR&order=${requestScope.terms['order'] }">한식</a></div> |
            <div class="type" data-type="SCH"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=SCH&order=${requestScope.terms['order'] }">분식</a></div> |
            <div class="type" data-type="WES"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=WES&order=${requestScope.terms['order'] }">양식</a></div> |
            <div class="type" data-type="CHI"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=CHI&order=${requestScope.terms['order'] }">중식</a></div> |
            <div class="type" data-type="JAP"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=JAP&order=${requestScope.terms['order'] }">일식</a></div>
        </div>
        <div id="list_order">
            <form action="/spRestaurant/spRestaurantList.do" id="orderForm">
                <select name="order" id="order_select" style="border:none;">
                    <option value="desc">최신순</option>
                    <option value="count">수량순</option>
                </select>
                	<input type="text" name="area" value="${requestScope.terms['area'] }"  hidden/>
                	<input type="text" name="type" value="${requestScope.terms['type'] }"  hidden/>
            </form>
        </div>
        
        <div id="list_select">
		<c:choose>
		  <c:when test="${!requestScope.map['list'].isEmpty() }">
		  <br />
            <ul>
              <c:forEach items="${requestScope.map['list'] }" var="list">
                <li class="item">
                    <a href="/spRestaurant/spRestaurantDetail.do?bizNo=${list.bizNo }" class="item_link">
                        <div class="item_image">
                        	<img src="${list.bizImage}" alt="" />
                        </div>
                        <div class="item_name">
                     		${list.bizName }
                        </div>
                    </a>
                </li>
              </c:forEach> 
            </ul>
			<div id="page_wrap">
			    <ul class="page_ul">
			       ${requestScope.map['navi'] }
			    </ul>
			</div>            
          </c:when>
          <c:otherwise>
         	<div style="margin-top:20px;">
         		등록된 식당이 없습니다.
         	</div>
          </c:otherwise>    
        </c:choose>    
        </div>
    </div>
    
    <script>
    	$("#order_select").change(function(){
    			$("#orderForm").submit();
    	});
    	
    	$(function(){
    		const selectedArea = "${requestScope.terms['area'] }";
    		const selectedType = "${requestScope.terms['type'] }";
    		const selectedOrder = "${requestScope.terms['order'] }";
    		
    		$(".area").filter(function(index){
    			console.log(".area");
    			if($(this).attr("data-area")==selectedArea){
    				$(this).addClass("selected");
    				return;
    			}
    		});
    		
    		$(".type").filter(function(index){
    			console.log(".type");
    			if($(this).attr("data-type")==selectedType){
    				$(this).addClass("selected");
    				return;
    			}
    		});
    		$("#order_select").val(selectedOrder).prop("selected",true);
    		
    		
    	})
    </script>
    
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>    
</body>
</html>