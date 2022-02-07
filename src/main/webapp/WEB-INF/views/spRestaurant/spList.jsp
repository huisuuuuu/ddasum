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
            <a href="" class="">서울</a><br>
            <a href="" class="">인천</a><br>
            <a href="" class="">경기</a>
        </div>
        <div id="food_select">
            <div><a href="">전체</a></div> |
            <div><a href="">한식</a></div> |
            <div><a href="">분식</a></div> |
            <div><a href="">양식</a></div> |
            <div><a href="">중식</a></div> |
            <div><a href="">일식</a></div>
        </div>
        <div id="list_order">
            <form action="">
                <select name="type" id="" style="border:none;">
                    <option value="latest">최신순</option>
                    <option value="count">수량순</option>
                </select>

            </form>
        </div>
        <div id="list_select">
            <ul>
                <li class="item">
                    <a href="" class="item_link">
                        <div class="item_image">
                        </div>
                        <div class="item_name">
                            가가식당
                        </div>
                    </a>

                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
                <li class="item">
                   <a href="" class="item_link">
                    <div class="item_image">
                    </div>
                    <div class="item_name">
                        가가식당
                    </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>    
</body>
</html>