<%@page import="member.model.vo.Member"%>
<%@page import="member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String msg = (String) session.getAttribute("msg");
if (msg != null)
	session.removeAttribute("msg");

Member loginMember = (Member) session.getAttribute("loginMember");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- meta 선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여기요</title>

<!-- link 선언 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/menu_header_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/content_style_index.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/search_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/menuList.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/order.css">

<!-- script 선언 -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
<script>
<%if (msg != null) {%>
alert("<%=msg%>
	");
<%}%>
	
</script>


</head>
<body>
	<div id="container">
		<header>
			<div class="header_container">
				<div class="logo_container">
					<h1>
						<a href="<%=request.getContextPath()%>"> <img
							src="<%=request.getContextPath()%>/images/Home_button.png"
							alt="홈으로" width="150" height="50">
						</a>
					</h1>
				</div>
				<div class="nav_container" id="nav_menu">
					<%
					if (loginMember == null) {
					%>
					<div class="login_container">
						<ul class="login">
							<button type="button" id="loginBtn"
								onclick="location.href='<%=request.getContextPath()%>/member/memberlogin';">로그인</button>
						</ul>
					</div>
					<%
					} else if ("A".equals(loginMember.getMemberRole())) {
					%>
					<table id="admin">
						<tr>
							<td>관리자님, 반갑습니다</td>
						</tr>
						<tr>
							<td><input type="button" value="로그아웃"
								onclick="location.href='<%=request.getContextPath()%>/member/logout';" /></td>
						</tr>
					</table>
					<%
					} else {
					%>

					<table id="login">
						<tr>
							<td><%=loginMember.getMemberName()%>님, 반갑습니다</td>
							<td><input type="button" value="장바구니" name="basket" /></td>
						</tr>
						<tr>
							<td><input type="button" value="마이페이지" /> <input
								type="button" value="로그아웃"
								onclick="location.href='<%=request.getContextPath()%>/member/logout';" />
							</td>
						</tr>
					</table>

					<%
					}
					%>
				</div>
			</div>
			<div id="category" class="category-menu clearfix collapse  in"
				aria-expanded="true">
				<ul>

					<li class="hidden-xs menu-search"><a
						class="btn btn-default ico-search1"
						ng-click="toggle_category_block()"></a></li>
					<!--pc button-->
					<!-- ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class="active"
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct01"></i><span ng-bind="ct.title"
						class="category-name ng-binding">전체보기</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct12"></i><span ng-bind="ct.title"
						class="category-name ng-binding">1인분 주문</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct10"></i><span ng-bind="ct.title"
						class="category-name ng-binding">프랜차이즈</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct02"></i><span ng-bind="ct.title"
						class="category-name ng-binding">치킨</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct03"></i><span ng-bind="ct.title"
						class="category-name ng-binding">피자/양식</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct04"></i><span ng-bind="ct.title"
						class="category-name ng-binding">중국집</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct05"></i><span ng-bind="ct.title"
						class="category-name ng-binding">한식</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct06"></i><span ng-bind="ct.title"
						class="category-name ng-binding">일식/돈까스</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct07"></i><span ng-bind="ct.title"
						class="category-name ng-binding">족발/보쌈</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct08"></i><span ng-bind="ct.title"
						class="category-name ng-binding">야식</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct09"></i><span ng-bind="ct.title"
						class="category-name ng-binding">분식</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct11"></i><span ng-bind="ct.title"
						class="category-name ng-binding">카페/디저트</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li ng-repeat="ct in session_storage.categories" class=""
						ng-hide="! ct.enabled &amp;&amp; ct.optional"
						ontouchend="(function(){})()"
						ng-click="select_category(ct, city, zipcode, $event)"><i
						class="category-icon ico-ct13"></i><span ng-bind="ct.title"
						class="category-name ng-binding">편의점/마트</span></li>
					<!-- end ngRepeat: ct in session_storage.categories -->
					<li class="main-search hide">
						<form action="https://www.yogiyo.co.kr/mobile/"
							onsubmit="return false" class="ng-pristine ng-valid">
							<div class="input-group">
								<input type="search" name="category_keyword"
									class="form-control ng-pristine ng-untouched ng-valid"
									placeholder="음식점이나 메뉴를 검색해보세요." ng-model="category_keyword.v"
									ng-change="show_search_cancel_button()"> <span
									class="input-group-btn">
									<button
										class="btn-search-category-cancel btn btn-default ng-hide"
										type="button" ng-show="is_show_cancel_button"
										ng-click="clear_search_keyword($event)"></button>
									<button class="btn btn-default ico-search" type="button"
										id="category_search_button" ng-click="search_restaurant()">&nbsp;</button>
								</span>
							</div>
						</form>
					</li>
				</ul>
			</div>
		</header>


		<section id="content">