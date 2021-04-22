<%@page import="member.model.vo.Member"%>
<%@page import="member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String)session.getAttribute("msg");
	if(msg != null)
		session.removeAttribute("msg");
	
	Member loginMember = (Member)session.getAttribute("loginMember");

%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- meta 선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여기요</title>

<!-- link 선언 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header_style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/content_style_index.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer_style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login_style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search_style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/menuList.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/order.css">

<!-- script 선언 -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
<% if(msg != null) { %>
alert("<%= msg %>");
<% } %>
</script>


</head>
<body>
  <div id="container">
	<header>
		<div class="header_container">
			<div class="logo_container">
				<h1>
					<a href="<%= request.getContextPath() %>"> <img src="<%= request.getContextPath() %>/images/Home_button.png"
						alt="홈으로" width="150" height="50">
					</a>
				</h1>
			</div>
		</div>
	</header>
	
	
	<section id="content">