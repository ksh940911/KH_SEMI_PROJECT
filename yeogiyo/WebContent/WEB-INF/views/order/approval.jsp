<%@page import="order.model.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Order order = (Order)session.getAttribute("order");
System.out.println("order@approval.jsp = " + order);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결제완료</h1>
	<input type="button" href="<%= request.getContextPath() %>" value="메인화면으로" />
</body>
</html>