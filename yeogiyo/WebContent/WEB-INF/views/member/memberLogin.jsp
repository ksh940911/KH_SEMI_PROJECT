<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<div class="content-wrap">
        <form id="loginFrm" action="<%= request.getContextPath() %>/member/memberlogin" method="POST" name="loginFrm">
            <div class="login-container">
                <div class="title"><span>여기요</span></div>
                <ul>
                    <li>
                        <input type="text" name="memberId" id="memberId" placeholder="아이디" >
                    </li>
                    <li>
                        <input type="password" name="password" id="password" placeholder="비밀번호" >
                    </li>
                    
                </ul>
                <div class="checkbox">
                    <input type="checkbox" name="saveId" id="saveId">
                    <label for="saveId">아이디저장</label>
                    <span><a href="#">아이디찾기</a> | <a href="#">비밀번호찾기</a></span>
                </div>
            </div>
            <div class="login-submit">
                <input type="submit" value="로그인">
            </div>    
        </form>
        <div class="join-container">
            <span>이미지(회원가입페이지링크)</span>
            <a href="#">
                <img src="" alt="">
            </a>

        </div>
	</div>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>