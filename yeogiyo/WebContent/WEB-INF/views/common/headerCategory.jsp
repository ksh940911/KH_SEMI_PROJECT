<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String category = (String)request.getAttribute("category"); %>    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    
    <div class="recommendList">
    	
  		<div class="restaurant-categori-menu" >

			<ul>
				<% if(category != "오늘뭐먹지") { %>
				<li class="menu-search">
					<!-- <a class="search-category-btn">검색</a> -->
					<img class="search-category-btn" src="../images/sprite-icon2.png" alt="검색" />
				</li>
				<% } %>
				<li class="menu m0" onclick="location.href='<%= request.getContextPath() %>/restaurant/randomList'" 
				<% if("오늘뭐먹지".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name" >오늘뭐먹지</span>
				</li>
				<li class="menu m1" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do'"
				 <% if("전체보기".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name" >전체보기</span>
				</li>
				<li class="menu m3" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=franchise'"
				<% if("프랜차이즈".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name" >프랜차이즈</span>
				</li>
				<li class="menu m4" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=chicken'"
				<% if("치킨".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">치킨</span>
				</li>
				<li class="menu m5" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=pizza'"
				<% if("피자/양식".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">피자/양식</span>
				</li>
				<li class="menu m6" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=chinese'"
				<% if("중국집".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">중국집</span>
				</li>
				<li class="menu m7" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=korean'"
				<% if("한식".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">한식</span>
				</li>
				<li class="menu m8" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=japanese'"
				<% if("일식/돈까스".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">일식/돈까스</span>
				</li>
				<li class="menu m9" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=pork'"
				<% if("족발/보쌈".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">족발/보쌈</span>
				</li>
				<li class="menu m10" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=snack'"
				<% if("분식".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">분식</span>
				</li>
				<li class="menu m11" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=cafe'"
				<% if("카페/디저트".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">카페/디저트</span>
				</li>
				<li class="menu m12" onclick="location.href='<%= request.getContextPath() %>/restaurant/restaurantList.do?category=convi'"
				<% if("편의점".equals(category)) { %> id="selected" <% } %>>
					<span class="category-name">편의점</span>
				</li>
				<li class="main-search">
					<form name="ResSearchFrm" action="<%= request.getContextPath() %>/restaurant/restaurantList.do">
						<div class="input-group">
							<input type="search" name="category_keyword" placeholder="음식점을 검색해보세요." class="category_input" required="required"/>
							<input type="hidden" name="search_category" value="<%= category %>" />
							<span class="searchBtn">
								<!-- <button type="button" id="category_search_button" class="category_search_button" onclick="searchRes()">검색</button> -->
								<input type="submit" id="category_search_button" class="category_search_button" value="검색"/>
							</span>
						</div>
					</form>
				</li>
				
			
			</ul>


	</div>
