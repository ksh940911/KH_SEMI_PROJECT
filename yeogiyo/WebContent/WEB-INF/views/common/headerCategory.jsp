<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
  		<div class="restaurant-categori-menu" >

			<ul>
				<li class="menu search">
					<a href="" class="search-btn">검색</a>
				</li>
				<li class="menu m0" onclick="location.href='<%= request.getContextPath() %>/restaurant/randomList'">
					<span class="m0">오늘뭐먹지</span>
				</li>
				<li class="menu m1" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do'">
					<span class="m1">전체보기</span>
				</li>
				<li class="menu m3">
					<span class="m3">프랜차이즈</span>
				</li>
				<li class="menu m4">
					<span class="m4">치킨</span>
				</li>
				<li class="menu m5">
					<span class="m5">피자/양식</span>
				</li>
				<li class="menu m6">
					<span class="m6">중국집</span>
				</li>
				<li class="menu m7">
					<span class="m7">한식</span>
				</li>
				<li class="menu m8">
					<span class="m8">일식/돈까스</span>
				</li>
				<li class="menu m9">
					<span class="m9">족발/보쌈</span>
				</li>
				<li class="menu m10">
					<span class="m10">분식</span>
				</li>
				<li class="menu m11">
					<span class="m11">카페/디저트</span>
				</li>
				<li class="menu m12">
					<span class="m12">편의점</span>
				</li>
				
			
			</ul>


</div>