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
		
		<% if(notice.getNoticeImg() != null) { %>
		<div id="notice-img">
			<img src="<%= request.getContextPath() %>/upload/notice/<%= noticeImg.getRenamedFilename() %>" />
		</div>
		<% } %>
					
		<hr />
		<div id="notice-content"><%= notice.getNoticeContent() %></div>
		
		<hr />
		<% if(editable) { %>
			<input type="button" value="수정" onclick="updateNotice()" />
			<input type="button" value="삭제" onclick="deleteNotice()" />
		<% } %>
	<% } else { %>
		<div id="notice-noExist">공지사항이 없습니다.</div>
	<% } %>	
  		<% if(editable && (notice == null)) { %>
  		<input type="button" id="notice-add-btn" value="등록">
  		<form id="notice-add-frm" action="<%= request.getContextPath() %>/admin/noticeForm">
        	<input type="hidden" name="resId" value="<%= request.getAttribute("resId")%>">
        </form>
		<% } %>
	</div>
</section>

<% if (editable) { %>
<script>
$("#notice-add-btn").click(function(){
	var $frm = $("#notice-add-frm");
	console.log($("[name=resId]").val());
   	$frm.submit();
});
</script>
	<% if(notice != null) { %>
		
		<form 
			id="notice-update-frm" 
			action="<%= request.getContextPath() %>/admin/noticeUpdate?resId=<%= notice.getResId() %>">
        	<input type="hidden" name="resId" value="<%= request.getAttribute("resId")%>">
        </form>
		
		<form 
			action="<%= request.getContextPath() %>/admin/noticeDelete"
			id="notice-del-frm"
			method="POST">
				<input type="hidden" name="noticeNo" value="<%= notice.getNoticeNo() %>" />
				<input type="hidden" name="resId" value="<%= request.getAttribute("resId")%>">
		</form>
					
		<script>
		function updateNotice(){
			var $frm = $("#notice-update-frm");
			$frm.submit();
		};
		
		function deleteNotice(){
			if(confirm("공지를  ㄹㅇ 삭제 하시겠습니까?")){
				var $frm = $("#notice-del-frm");
				$frm.submit();
			}
		};
		</script>
	<% } %>
<% } %>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>