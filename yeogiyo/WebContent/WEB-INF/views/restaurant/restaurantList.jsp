<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% List<Restaurant> list = (List<Restaurant>)request.getAttribute("list"); %>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<h1>restaurant list</h1>
	<table class="tb-restaurant">
	<tr>
		<th>가게 아이디</th>
		<th>가게명</th>
		<th>가게 주소</th>
		<th>카테고리</th>
		<th>최소주문금액</th>
		<th>가게로고이미지</th>
		<th>별점평균</th>
		<th>리뷰갯수</th>
	</tr>
	<% for(Restaurant r : list){ %>
	<tr>
		<td><%= r.getResId() %></td>
		<td><a href="<%= request.getContextPath() %>/restaurant/menuList.do?res_id=<%=r.getResId() %>"><%= r.getResName() %></a></td>
		<td><%= r.getResAddress() %></td>
		<td><%= r.getCategory() %></td>
		<td><%= r.getMinPrice() %></td>
		<td><img style="width: 200px;" src="<%= r.getLogoImg() %>" alt="" /></td>
		<td><%= r.getRateAvg() %></td>
		<td><%= r.getReviewCnt() %></td>
	</tr>
	
	<%} %>
	</table>
	
	<style>
.tb-restaurant{
border-collapse : collapse;
border : 1px solid #000;
}

.tb-restaurant>tbody>tr, .tb-restaurant>tbody>tr>td, .tb-restaurant>tbody>tr>th{
border : 1px solid #000;
}
</style>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>