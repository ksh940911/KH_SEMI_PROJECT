<%@page import="restaurant.model.vo.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Menu> list = (List<Menu>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu list</title>
<style>
table{
	border-collapse : collapse;
	border: 1px solid black;
}
th, tr, td{
	border: 1px solid black;
}
img{
	width : 100px;
	height : 100px;
}
</style>
</head>
<body>
	<table>
		<th>메뉴아이디</th>
		<th>가게아이디</th>
		<th>메뉴명</th>
		<th>메뉴소개</th>
		<th>메뉴 카테고리</th>
		<th>가격</th>
		<th>메뉴이미지</th>
		<% for(Menu m : list){ %>
		<tr>
			<td><%= m.getMenuId() %></td>
			<td><%= m.getResId() %></td>
			<td><%= m.getMenuName() %></td>
			<td><%= m.getDescription() == null? "" : m.getDescription() %></td>
			<td><%= m.getMenuCategory() %></td>
			<td><%= m.getPrice() %></td>
			<td>
				<%if(m.getMenuImg() != null){ %>
				<img src="<%= m.getMenuImg() %>" alt="" />
				<%} %>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>