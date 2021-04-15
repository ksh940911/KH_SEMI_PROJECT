<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	    
	    
	    
	    <div class="row">
            <!-- ngRepeat: banner in banner_list -->
			<a href="" class="thumbnail" ng-click="select_home_category('Random')">
				<a href="">
					<div class="category-title">랜덤선택</div> <img
					src="images/category-00.png">
				</a>
			</a>
		</div>
                
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
			<a href="" class="thumbnail" ng-click="select_home_category('all')">
				<a href="">
					<div class="category-title">전체보기</div> <img
					src="images/category-01.png">
				</a>
			</a>
		</div>
		
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                ng-click="select_home_category('프랜차이즈')">
                <div class="category-title">프랜차이즈</div><img src="images/category-10.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('치킨')">
                <div class="category-title">치킨</div><img src="images/category-02.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                ng-click="select_home_category('피자양식')">
                <div class="category-title">피자/양식</div><img src="images/category-03.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('중식')">
                <div class="category-title">중국집</div><img src="images/category-04.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('한식')">
                <div class="category-title">한식</div><img src="images/category-05.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                ng-click="select_home_category('일식돈까스')">
                <div class="category-title">일식/돈까스</div><img src="images/category-06.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                ng-click="select_home_category('족발보쌈')">
                <div class="category-title">족발/보쌈</div><img src="images/category-07.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('분식')">
                <div class="category-title">분식</div><img src="images/category-09.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                ng-click="select_home_category('카페디저트')">
                <div class="category-title">카페/디저트</div><img src="images/category-11.png">
            </a></div>
        <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('편의점')">
                <div class="category-title">편의점</div><img src="images/category-convenience-store.png">
            </a></div>
        
<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<%-- <%

	//Member loginMember = (Member)session.getAttribute("loginMember");
	String loginMember = null; //테스트용
%> --%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yeogiyo-main</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<style>
        body {margin: 0; padding: 0;}
        /********** 전체컨테이너 **********/
        div#container	{background-color:#F0F0F0; width:100%; margin:0 auto;}


        /********** header **********/
        header	{background: red; height:80px; position:relative; padding:10px 0 0 0; }
        header h1 {margin-left:10px;  color:white;}
        header #loginBtn {position:absolute; width:150px; height:30px; top: 30px; right: 100px;}
    


        /********** content **********/
        section#content	{ background-color:#F5F5F5; float:left; width:100%; min-height:800px; }
        
        

        /********** footer **********/
        footer { background-color:red; clear:both; height:75px; text-align:center;padding-top:40px;}
        footer p {color: white;}

</style>

</head>
<body>
<<<<<<< HEAD
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

=======
	 <div id="container">
		@@@@@@@@@@@@@@@@@@@@header@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        <header>
	    	<h1>여기요</h1>
	        
	        <div class="login-container">    
	        <% if(loginMember == null) { %>    
	            <button type="button" id="loginBtn" onclick="location.href='<%= request.getContextPath() %>/member/memberlogin';">로그인</button>
	            
	        <% } else { %>
	            <table id="login">
	            	<tr>
	            		<td>님, 반갑습니다.</td>
	            	</tr>
	            	<tr>
	            		<input type="button" value="마이페이지"/>
	            		<input type="button" value="로그아웃"/>
	            		<input type="button" value="장바구니"/>	            		
	            	</tr>
	            </table>
	        <% } %>        
            </div>
        </header>

		@@@@@@@@@@@@@@@@@@@@섹션부분@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
        <section id="content">

            <h2 align="center" style="margin-top:200px;">content 부분</h2>
			
        </section>
        
        
        @@@@@@@@@@@@@@@@@@@@footer@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        <footer>
            <p><strong>여기요</strong></p>
            <p>&lt;Copyright 1998-2021 <strong>KH정보교육원</strong>. All rights reserved.&gt;</p>

        </footer>


    </div>
>>>>>>> 0409a243903373eb846581b233606174cf46fc6e
</body>
</html> --%>