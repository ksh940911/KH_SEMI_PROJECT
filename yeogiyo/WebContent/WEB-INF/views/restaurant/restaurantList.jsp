<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Restaurant> list = (List<Restaurant>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>restaurant - list</title>
</head>
<body>
	<h1>restaurant List</h1>
	<table>
		<th>가게아이디</th>
		<th>가게명</th>
		<th>가게주소</th>
		<th>카테고리</th>
		<th>최소주문금액</th>
		<th>가게로고이미지</th>
		<th>별점평균</th>
		<th>리뷰갯수</th>
		<%for(Restaurant r : list){ %>
		<tr>
			<td><%=r.getResId() %></td>
			<td><a href="<%= request.getContextPath() %>/restaurant/menuList.do?resId=<%=r.getResId() %>"><%=r.getResName() %></a></td>
			<td><%=r.getResAddress() %></td>
			<td><%=r.getCategory() %></td>
			<td><%=r.getMinPrice() %></td>
			<td><img src="<%=r.getLogoImg() %>" alt="" /></td>
			<td><%=r.getRateAvg() %></td>
			<td><%=r.getReviewCnt() %></td>
			</tr>
		<% } %>
	</table>
</body>
</html>