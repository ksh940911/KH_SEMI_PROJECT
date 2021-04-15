<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% List<Restaurant> list = (List<Restaurant>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
border-collapse : collapse;
border : 1px solid #000;
}

tr, td, th{
border : 1px solid #000;
}

img{
	width: 200px;
}
</style>
</head>
<body>
	<h1>restaurant list</h1>
	<table>
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
		<td><img src="<%= r.getLogoImg() %>" alt="" /></td>
		<td><%= r.getRateAvg() %></td>
		<td><%= r.getReviewCnt() %></td>
	</tr>
	
	<%} %>
	</table>
</body>
</html>