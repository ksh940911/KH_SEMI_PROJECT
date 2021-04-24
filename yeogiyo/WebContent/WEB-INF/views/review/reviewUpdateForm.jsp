<%@page import="review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
    	Review review = (Review) request.getAttribute("review");
    %>    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/review.css" />

<script>
$(function(){
	$(document.reviewEnrollFrm).submit(reviewValidate);	
});

/**
* reviewEnrollFrm 유효성 검사
*/
function reviewValidate(){
	var $content = $("[name=content]");
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요.");
		return false;
	}

	return true;
	
	
	
}
function test(){
	switch(review.getReviewStar()){
case 1:
	document.getElementById('star-1').checked=true;
	break;
case 2:
	document.getElementById('star-2').checked=true;
	break;
case 3:
	document.getElementById('star-3').checked=true;
	break;
case 4:
	document.getElementById('star-4').checked=true;
	break;
case 5:
	document.getElementById('star-5').checked=true;
	break;
	}
	
}
</script>
<section id="review-container">
<h2>주문내역불러올 공간</h2>
<form
	name="reviewUpdateFrm"
	action="<%=request.getContextPath() %>/review/reviewUpdate" 
	method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="resId" value="<%= request.getAttribute("resId") %>" />
	<input type="hidden" name="reviewNo" value="<%= review.getReviewNo() %>" />
	<table id="tbl-review-view">
	<tr>
		<th colspan="5">별점을 선택해주세요.</th>
	</tr>
	<tr>
		<td>
		<script>test()</script>
		<input type="radio" name="star" id="star-1" value=1 ><label for="star-1">★</label>
		<input type="radio" name="star" id="star-2" value=2> <label for="star-2">★★</label>
		<input type="radio" name="star" id="star-3" value=3> <label for="star-3">★★★</label>
		<input type="radio" name="star" id="star-4" value=4><label for="star-4">★★★★</label>
		<input type="radio" name="star" id="star-5" value=5 checked><label for="star-5">★★★★★</label>
		</td>
	</tr>	
	<tr>
		<td colspan="5"><textarea rows="5" cols="40" name="content" placeholder="여기요를 통해 음식을 주문해주셔서 감사합니다.&#13;&#10;더 좋은 서비스를 위해 별점과 리뷰를 등록해주세요."></textarea></td>
	</tr>
	<br><hr><br>
	<tr>
		<td>
			<input type="text" name="writer" value="<%= loginMember.getMemberId() %>" hidden/>
		</td>
	</tr>
	<tr>
		<td>
			<input type='file' id='reviewphotofile' name='reviewphoto' style='display: none;'>
			<img src="<%=request.getContextPath()%>/images/reviewphoto.png" id='reviewphotoid' border='0' onclick='document.all.reviewphoto.click()'>
		<script>			
	         $('#reviewphotofile').change(function () {
	     	  	readURL(this);
	     	});

	     	function readURL(input) {
	     	    if (input.files && input.files[0]) {
	     	        var reader = new FileReader();
	     	        reader.onload = function (e) {
	     	            $('#reviewphotoid').attr('src', e.target.result);
	     	        }
	     	        reader.readAsDataURL(input.files[0]);
	     	    }
	     	}
		</script>	
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<input style="width:300px" type="image" src="<%=request.getContextPath()%>/images/reviewsubmit.png">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>