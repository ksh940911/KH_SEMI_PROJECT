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
	var $content = $("[name=content]");
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요.");
		return false;
	}

	return true;
}
</script>
<div class="content-wrapper">
	<section id="review-container">
	<h2 id=reviewh2><strong><%= request.getAttribute("orderMenu") %></strong> 리뷰 작성</h2>
	<form
		name="reviewEnrollFrm"
		action="<%=request.getContextPath() %>/review/reviewEnroll" 
		method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="resId" value="<%= request.getAttribute("resId") %>" />
		<input type="hidden" name="orderMenu" value="<%= request.getAttribute("orderMenu") %>" />
		<input type="hidden" name="menuCnt" value="<%= request.getAttribute("menuCnt") %>" />
		<table id="tbl-review-view">
		<tr>
			<th colspan="5">별점을 선택해주세요.</th>
		</tr>
		<tr>
			<td>
			<input type="radio" name="star" id="star-1" value=1><label for="star-1">★</label>
			<input type="radio" name="star" id="star-2" value=2><label for="star-2">★★</label>
			<input type="radio" name="star" id="star-3" value=3><label for="star-3">★★★</label>
			<input type="radio" name="star" id="star-4" value=4><label for="star-4">★★★★</label>
			<input type="radio" name="star" id="star-5" value=5 checked><label for="star-5">★★★★★</label>
			</td>
		</tr>	
		<tr>
			<td colspan="5"><textarea rows="5" cols="40" name="content" placeholder="여기요를 통해 음식을 주문해주셔서 감사합니다.&#13;&#10;더 좋은 서비스를 위해 별점과 리뷰를 등록해주세요"></textarea></td>
		</tr>
		<br><hr><br>
		<tr>
			<td>
				<input type="text" name="writer" value="<%= loginMember.getMemberId() %>" hidden/>
			</td>
		</tr>
		<tr>
			<td style="text-align:center">
				<input type='file' id='reviewphotofile' name='reviewphoto' style='display: none;'>
				<img src="<%=request.getContextPath()%>/images/reviewphoto.png" id='reviewphotoid' border='0' onclick='document.all.reviewphoto.click()' width="300px" height="300px">
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
				<input style="width:310px" type="image" src="<%=request.getContextPath()%>/images/reviewsubmit.png">
			</td>
		</tr>
	</table>
	</form>
	</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
