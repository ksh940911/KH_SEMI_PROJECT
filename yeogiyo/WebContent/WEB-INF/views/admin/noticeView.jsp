<%@page import="notice.model.vo.NoticeImg"%>
<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% 
	Notice notice = (Notice)request.getAttribute("notice");
	NoticeImg noticeImg = (NoticeImg)request.getAttribute("noticeImg");
	boolean editable = loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole());
%>

<section id="notice-container">
	<h2>공지사항</h2>
	<div id="notice">
		<hr />
	<% if(notice != null) { %>
		<div id="notice-title"><%= notice.getNoticeTitle() %></div>
		
		<hr />
		<div id="notice-img">
			<img src="<%= request.getContextPath() %>/upload/notice/<%= noticeImg.getRenamedFilename() %>" />
		</div>
		
		<hr />
		<div id="notice-content"><%= notice.getNoticeContent() %></div>
		
		<hr />
		<% if(editable) { %>
			<input type="button" value="수정" onclick="updateNotice()" />
			<input type="button" value="삭제" onclick="deleteNotice()" />
		<% } %>
	<% } else { %>
		<div id="notice-noExist">공지사항이 없습니다.</div>
		<% if(editable) {%>
			<input type="button" value="등록" id="notice-add-btn" onclick="location.href'<%= request.getContextPath() %>/admin/noticForm';" />
		<% } %>
	<% } %>	
	</div>
</section>
<% if(editable) { %>
	<form 
		action="<%= request.getContextPath() %>/admin/noticeDelete"
		name="noticeDelFrm"
		method="POST">
		<input type="hidden" name="noticeNo" value="<%= notice.getNoticeNo() %>" />
	</form>
	<script>
	function updateNotice(){
		location.href="<%= request.getContextPath() %>/admin/noticeUpdate?no=<%= notice.getNoticeNo() %>";
	}
	
	function deleteNotice(){
		if(confirm("공지를 삭제하시겠습니까?")){
			$(document.noticeDelFrm).submit();
		}
	}
	</script>
<% } %>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>