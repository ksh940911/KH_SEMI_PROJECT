<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- meta 선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- link 선언 -->
<!-- <link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style_index.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header_style.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer_style.css" />
<!-- script 선언 -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<!--  
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="./js/script.js"></script> -->
<title>여기요</title>

<style>
section#content .content-wrap{ margin: 10px; height: 800px; } 
section#content .login-container{width:500px; margin: 0 auto; }
.login-container .title { text-align: center; margin-top: 30px;}
.login-container .title span{font-size: 2em;}
.login-container ul {text-align: center; padding: 0; margin-top: 50px;}
.login-container li {list-style: none;}
.login-container li input {width: 98%; height: 30px;}
.checkbox {position: relative;}
.checkbox span {position: absolute; right: 5px;}
.checkbox span a { color: grey; text-decoration: none; font-size: small;}
.login-submit {text-align: center;}
.login-submit input { width: 500px; height:40px; margin-top: 30px; }
.join-container {  width: 500px; height:400px; background-color: black; margin: 30px auto; text-align: center; }
.join-container span {color: white;}
</style>


</head>
<body>
  <div id="container">
	<header>
		<div class="header_container">
			<div class="logo_container">
				<h1>
					<a href="./index.jsp" class="Home_btn"> <img src="../img/Home_button.png"
						alt="홈으로" width="150" height="50">
					</a>
				</h1>
			</div>
			<div class="nav_container" id="nav_menu">
				<div class="login_container">
					<ul class="login">
						<button type="button" id="loginBtn" onclick="location.href='<%= request.getContextPath() %>/member/memberlogin';">로그인</button>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<section id="content">