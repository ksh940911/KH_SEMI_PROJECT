<%@page import="member.model.vo.Member"%>
<%@page import="member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String)session.getAttribute("msg");
	if(msg != null)
		session.removeAttribute("msg");
	
	Member loginMember = (Member)session.getAttribute("loginMember");

	
	String saveId = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();  
			if("saveId".equals(name))
				saveId = value;
		}
	}
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/restaurantList.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/menuList.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/order.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/aproval.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/random_style.css">





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
			<div class="nav_container" id="nav_menu">
			<% if(loginMember == null) { %>
				<div class="login_container">
					<ul class="login">
						<button type="button" id="loginBtn" onclick="location.href='<%= request.getContextPath() %>/member/memberlogin';" >로그인</button>
					</ul>
				</div>
			<% } else if(MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())) { %>
				<table id="admin">
					<tr>
						<td>관리자님, 반갑습니다</td>
						<td><input type="button" value="회원관리" onclick="location.href='<%= request.getContextPath() %>/admin/memberManage';" /></td>
					</tr>
					<tr>
						<td><input type="button" value="로그아웃" onclick="location.href='<%= request.getContextPath() %>/member/logout';"/></td>
						<td><input type="button" value="가게관리" onclick="location.href='<%= request.getContextPath() %>/admin/resManage';"/></td>
					</tr>
				</table>
			<% } else {%>
			
				<table id="login">
					<tr>
						<td><%= loginMember.getMemberName() %>님, 반갑습니다</td>
						<td><input type="button" value="장바구니" name="basket"/></td>
					</tr>
					<tr>
						<td>
							<input type="button" value="마이페이지" onclick="location.href='<%= request.getContextPath() %>/member/memberView';"/>
							<input type="button" value="로그아웃" onclick="location.href='<%= request.getContextPath() %>/member/logout';"/>							
						</td>
					</tr>
				</table>
				
			<% } %>	
			</div>
		</div>
	</header>
	
	
	<section id="content">