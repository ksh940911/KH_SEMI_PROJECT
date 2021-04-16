<%@page import="notice.model.vo.NoticeImg"%>
<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% 
	Notice notice = (Notice)request.getAttribute("notice");
	NoticeImg noticeImg = (NoticeImg)request.getAttribute("noticeImg");
%>

<section id="notice-container">

	<div id="notice">
		<hr />
		<div id="notice-title"><%= notice.getNoticeTitle() %></div>
		
		<hr />
		<div id="notice-img">
			<img src="<%= request.getContextPath() %>/upload/notice/<%= noticeImg.getRenamedFilename() %>" />
		</div>
		
		<hr />
		<div id="notice-content"><%= notice.getNoticeContent() %></div>
		
	</div>

</section>