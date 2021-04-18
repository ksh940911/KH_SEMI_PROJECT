<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/review.css" />

<script>
$(function(){
	$(document.reviewEnrollFrm).submit(reviewValidate);	
});

/**
* reviewEnrollFrm 유효성 검사
*/
function reviewValidate(){
	var $title = $("[name=title]");
	var $content = $("[name=content]");
	//제목을 작성하지 않은 경우 폼제출할 수 없음.
	if(/^.+$/.test($title.val()) == false){
		alert("제목을 입력하세요.");
		return false;
	}
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요.");
		return false;
	}

	return true;
}
</script>
<section id="review-container">
<h2>리뷰 작성</h2>
<form
	name="reviewEnrollFrm"
	action="<%=request.getContextPath() %>/review/reviewEnroll" 
	method="post"
	enctype="multipart/form-data">
	<table id="tbl-review-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="writer" value="<%= loginMember.getMemberId() %>" readonly/>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>			
			<input type="file" name="upFile">
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="40" name="content"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="등록하기">
		</th>
	</tr>
</table>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
