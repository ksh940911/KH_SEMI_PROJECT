<%@page import="notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Notice notice = (Notice) request.getAttribute("notice");
%>
<section id="notice-container">
<h2>공지 수정</h2>
<form 
	name="noticeUpdateFrm"
	action="<%= request.getContextPath() %>/admin/noticeUpdate"
	enctype="multipart/form-data"
	method="POST"
	>
	<input type="hidden" name="noticeNo" value="<%= notice.getNoticeNo() %>" />
	<input type="hidden" name="resId" value="<%= notice.getResId() %>" />
	<table id="tbl-notice-view">
		<tr>
			<th>제목</th>
			<td><input type="text" name="noticeTitle" value="<%= notice.getNoticeTitle() %>" required /></td>
		</tr>
		<tr>
			<th>이미지추가</th>
			<td>
				<input type="file" name="upImgFile" />
				<% if(notice.getNoticeImg() != null){ %>
				<p style="margin: 5px 0;">
					<img src="<%= request.getContextPath() %>/imges/image-icon.png" width="20px">
					<%= notice.getNoticeImg().getOriginalFilname() %>
					<input type="checkbox" name="delImgFile" id="delImgFile" value="<%= notice.getNoticeImg().getImgNo() %>"/>
					<label for="delImgFile">이미지 삭제</label>
				</p>
				<% } %>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="noticeContent" cols="30" rows="10"><%= notice.getNoticeContent() %></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정" />
				<input type="button" value="취소" onclick="history.go(-1);" />
			</th>
		</tr>
	</table>

</form>
</section>
<script>
$("[name=upImgFile]").change(function(){
	if($(this).val() != ""){
		// 파일 선택
		$("delImgFile").prop("checked", true)
					   .on("click", function(){
							return false; });
	} else {
		// 파일 선택 취소
		$("#delImgFile").prop("checked", false)
						.off("click");
	}
})	

$(document.noticeUpdateFrm).submit(function(){
	var $content = $("[name=content]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
})

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>