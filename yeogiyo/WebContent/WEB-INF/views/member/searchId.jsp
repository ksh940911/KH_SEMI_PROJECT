<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="net.nurigo.java_sdk.api.Message"%>
<%@ page import="net.nurigo.java_sdk.exceptions.CoolsmsException" %>    
    
 
    
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class="verify-wrapper">
      <form name="idsearchFrm" action="<%= request.getContextPath() %>/member/searchId" method="POST">
        <div class="idsearch">
          <div class="name-phone">
            <ul>
              <li>
                <!-- <input type="text" placeholder="이름 입력"> -->
                <input type="tel" name="telephone" placeholder="(필수)전화번호 입력" required="required">
                <button type="button" class="sms-verify-btn" onclick="sms_verify();">인증</button>
              </li>
              <li>
                <!-- <input type="tel" placeholder="휴대폰 전화번호 입력"> -->
                <input type="tel" name="verifycode" placeholder="인증번호 입력">
              </li>
            </ul>
          </div>    
          <button type="submit" >아이디찾기</button>
        </div>
      </form>
    </div>

<script>
	function sms_verify(){
		var $tel = $("[name=telephone]").val();
		console.log($tel);
	}


</script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>