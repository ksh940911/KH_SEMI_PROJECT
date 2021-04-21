<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	
	SimpleDateFormat transFormat = new SimpleDateFormat();

	String memberId = loginMember.getMemberId();
	String memberName = loginMember.getMemberName();
	String birthday = loginMember.getBirthday() != null? transFormat.format(loginMember.getBirthday()) : "등록되지 않은 정보입니다."; //null처리 어떻게 할지
	String gender = loginMember.getGender() == "M"? "남자" : "여자";
	String address = loginMember.getAddress();
	String addressSub = loginMember.getAddressSub() != null? loginMember.getAddressSub() : "";
	String phone = loginMember.getPhone();
	String email = loginMember.getEmail();
	Date memberEnroll = loginMember.getMemberEnroll();
	
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member.css" />
<title>내 정보 보기</title>
<div class="content-wrapper">
<section id=enroll-container>
<h1>내 정보</h1>
<table>
	<tr>
		<th>아이디</th>
		<td><%= memberId %></td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td><%= memberName %></td>
	</tr>
	<tr>
		<th>생일</th>
		<td><%= birthday %></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><%= gender %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%= address %> <%= addressSub %></td>
	</tr>
	<tr>
		<th>휴대폰 번호</th>
		<td><%= phone %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%= email %></td>
	</tr>
	<tr>
		<th>회원가입일</th>
		<td><%= memberEnroll %></td>
	</tr>
</table>
<input type="button" value="내 정보 수정" onclick="location.href='<%= request.getContextPath()%>/member/memberUpdate';"/>
<input type="button" value="비밀번호 변경" onclick="location.href='<%= request.getContextPath()%>/member/updatePassword';"/><br>
<input type="button" id="deletMemberBtn" value="회원탈퇴" onclick="location.href='';"/><br>
</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>