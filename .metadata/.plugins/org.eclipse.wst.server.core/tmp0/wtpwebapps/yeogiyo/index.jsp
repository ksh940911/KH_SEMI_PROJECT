<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yeogiyo-main</title>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css" /> --%>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<style>
        body {margin: 0; padding: 0;}
        /********** 전체컨테이너 **********/
        div#container	{background-color:#F0F0F0; width:100%; margin:0 auto;}


        /********** header **********/
        header	{background: red; height:80px; position:relative; padding:10px 0 0 0; }
        header h1 {margin-left:10px;  color:white;}
        #loginBtn {position:absolute; width:150px; height:30px; top: 30px; right: 300px;}
        #joinBtn {position:absolute; width:150px; height:30px; top: 30px; right: 100px;}
    

        /********** search **********/
        section#search { background-color: yellow; float:left; width:100%; height: 150px; text-align: center;}

        /********** content **********/
        section#content	{ background-color:#F5F5F5; float:left; width:100%; min-height:500px; }
        
        

        /********** footer **********/
        footer { background-color:red; clear:both; height:75px; text-align:center;padding-top:40px;}
        footer p {color: white;}

</style>

</head>
<body>
	<%-- <h1>category</h1>
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
	</ul> --%>
	
	 <div id="container">

        <header>
            <h1>여기요</h1>
            	<button type="button" id="loginBtn" onclick="location.href='<%= request.getContextPath() %>/member/memberlogin';">로그인</button>
            	<button type="button" id="joinBtn" onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">회원가입</button>
            	<button type="button" id="memberManage" onclick="location.href='<%= request.getContextPath() %>/admin/memberManage';">회원관리</button>
            	<button type="button" id="resMamage" onclick="location.href='<%= request.getContextPath() %>/admin/resManage';">가게관리</button>
            	
        </header>

        <section id="search">

            <h2 align="center">"어디로 배달해 드릴까요?"</h2>
            <form action=""  method="GET">
                <input type="text" name="foodname" id="foodname">
                <input type="submit" value="검색">
            </form>

        </section>

    
        <section id="content">

            <h2 align="center" style="margin-top:200px;">content 부분</h2>

        </section>
        
        
        <footer>
            <p><strong>여기요</strong></p>
            <p>&lt;Copyright 1998-2021 <strong>KH정보교육원</strong>. All rights reserved.&gt;</p>

        </footer>


    </div>


	
</body>
</html>