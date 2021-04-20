<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<div class="verify-wrapper">
      <form name="pwdsearchFrm">
        <div class="pwdsearch">
          <div class="id-email">
            <ul>
              <li>
                <input type="text" placeholder="아이디 입력">
              </li>
              <li>
                <input type="email" placeholder="이메일 입력">
              </li>
            </ul>
          </div>    
          <button type="submit" >비밀번호 찾기</button>
        </div>
      </form>
    </div>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>