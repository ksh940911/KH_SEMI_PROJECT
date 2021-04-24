<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id="notice-enroll-container">
<h2>공지작성</h2>
<form 
	name="noticeEnrollFrm" 
	action="<%= request.getContextPath() %>/admin/noticeEnroll" 
	method="post"
	enctype="multipart/form-data" >
	<input type="hidden" name="resId" value='<%= request.getAttribute("resId") %>' />
	<table id="tbl-notice-form">
		<tr>
			<th>제목</th>
			<td><input type="text" name="noticeTitle" required /></td>
		</tr>
		<tr>
			<th>이미지추가</th>
			<td><input type="file" name="upImgFile" accept="image/*"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="noticeContent" cols="30" rows="10"></textarea></td>
		</tr>
		<tr>
			<th>
				<input type="submit" value="등록" />
				<input type="button" value="취소" onclick="location.href='<%= request.getContextPath() %>/admin/noticeView?resId=<%= request.getAttribute("resId") %>'">
			</th>
		</tr>
	</table>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>