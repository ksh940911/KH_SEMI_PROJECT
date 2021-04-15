<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yeogiyo-main</title>
</head>
<body>
	<h1>category</h1>
	<ul>
		<li>Random</li>
		<li><a href="<%= request.getContextPath() %>/restaurant/restaurantList.do">전체보기</a></li>
		<li>프랜차이즈</li>
		<li>피자/양식</li>
		<li>중국집</li>
		<li>한식</li>
		<li>족발/보쌈</li>
		<li>분식</li>
		<li>카페/디저트</li>
	</ul>
	
<input type="button" value="임시 회원가입" onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">

</body>
</html>