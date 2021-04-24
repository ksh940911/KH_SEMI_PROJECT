<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member_header.css" />
<nav class="member-menu-nav">
	<ul class="member-menu-ul">
		<li class="member-menu mm0" onclick="location.href='<%= request.getContextPath()%>/member/memberView';"/>내 정보 홈</li>
		<li class="member-menu mm1" onclick="location.href='<%= request.getContextPath()%>/member/memberUpdate';"/>내 정보 수정</li>
		<li class="member-menu mm2" onclick="location.href='<%= request.getContextPath()%>/member/updatePassword';"/>비밀번호 변경</li>
		<li class="member-menu mm3" onclick="location.href='<%= request.getContextPath()%>/member/updatePhone';"/>전화번호 변경</li>
		<li class="member-menu mm4" onclick="location.href='<%= request.getContextPath()%>/member/orderList';"/>주문 내역</li>
		<li class="member-menu deco"> | </li>
		<li class="member-menu mm5" onclick="location.href='<%= request.getContextPath()%>/member/memberDelete';"/>회원탈퇴</li>
	</ul>
</nav>