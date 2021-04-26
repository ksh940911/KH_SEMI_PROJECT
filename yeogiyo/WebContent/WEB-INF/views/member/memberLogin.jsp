<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 네이버 로그인 api -->


	<div class="content-wrap">
        <form id="loginFrm" action="<%= request.getContextPath() %>/member/memberlogin" method="POST" name="loginFrm">
            <div class="login-container">
                <div class="title"><img src="<%= request.getContextPath() %>/images/logo.png" alt="로고" width="150" height="50"></div>
                <ul>
                    <li>
                        <input type="text" name="memberId" id="memberId" placeholder="아이디" required="required" value="<%= saveId != null ? saveId : ""%>">
                        <span class="err-msg">유효한 아이디 형식이 아닙니다.</span>
		    		</li>
                    <li>
                        <input type="password" name="password" id="password" placeholder="비밀번호" required="required">
                    </li>
                    
                </ul>
                <div class="checkbox">
                    <input type="checkbox" name="saveId" id="saveId" <%= saveId != null ? "checked" : "" %>>
                    <label for="saveId">아이디저장</label>
                    <span><a href="<%= request.getContextPath() %>/member/searchId">아이디찾기</a> | <a href="<%= request.getContextPath() %>/member/searchPwd">비밀번호찾기</a></span>
                </div>
            </div>
            <div class="login-submit">
                <input type="submit" value="로그인" name="loginbtn" disabled="disabled">
            </div>
            <!-- 네이버 아이디로 로그인하기 버튼 -->
 
        </form>
        <div class="join-container">
            <a href="<%= request.getContextPath() %>/member/memberEnroll">
                <img src="<%= request.getContextPath() %>/images/sign_banner.png" alt="가입배너">
            </a>
        </div>
	</div>

<script>

$("#memberId").keyup(function(){
	if(/^[a-zA-Z0-9]{4,12}$/.test($("#memberId").val()) == false){
		$(".err-msg").css("display","block");
	}else {
		$(".err-msg").css("display","none");
	}
	
	
	if($("#memberId").val() == ""){
		$(".err-msg").css("display","none");
	}
	
});


$("#password").keyup(function(){
	if(/^[a-zA-Z0-9]{4,12}$/.test($("#memberId").val()) == true && /^[a-zA-Z0-9]{4,12}$/.test($("#password").val()) == true){
		$("[name=loginbtn]").css("background-color","#fa0050")
							.css("cursor","pointer")
							.removeAttr("disabled");
	}else{
		$("[name=loginbtn]").css("background-color","#ccc")
							.css("cursor","")
							.attr("disabled","true");
	}
	
});


	
	


//유효성검사
/* $("#loginFrm").submit(function(){
	var $memberId = $(memberId);
	var $password = $(password);
	
	if(/^[a-zA-Z0-9]{4,12}$/.test($memberId.val()) == false){
		alert("유효한 아이디를 입력하세요");
		$memberId.select();
		return false;
	}
	
	if(/^[a-zA-Z0-9]{4,12}$/.test($password.val()) == false){
		alert("유효한 비밀번호를 입력하세요");
		$password.select();
		return false;
	}
		
	
});  */





<%@ include file="/WEB-INF/views/common/footer.jsp" %>
