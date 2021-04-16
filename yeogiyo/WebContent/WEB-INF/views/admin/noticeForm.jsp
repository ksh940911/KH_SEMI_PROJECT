<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 
	가게 상세페이지에서 공지부분에 [공지등록] 버튼 클릭시 noticeForm 페이지 이동 
-->
<section id="notice-container">
<h2>공지작성</h2>
<form 
	name="noticeEnrollFrm" 
	action="<%= request.getContextPath() %>/admin/noticeEnroll" 
	method="post"
	enctype="multipart/form-data" >
	<table id="tbl-notice-view">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" required /></td>
		</tr>
		<tr>
			<th>이미지파일</th>
			<td><input type="file" name="upImgFile" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols="30" rows="10"></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록" />
			</th>
		</tr>
	</table>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>