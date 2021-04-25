<%@page import="review.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Review> list = (List<Review>) request.getAttribute("list");
	Review review = (Review)request.getAttribute("review");

	boolean editable = loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole());
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/review.css" />
<div class="content-wrapper">
	<section id="review-container">
		<h2 id=reviewh2>클린리뷰</h2>
		<%
			if(loginMember != null){
		%>
		<input type="button" id="review-add-btn" value="리뷰등록">
	  		<form id="review-add-frm" action="<%=request.getContextPath()%>/review/reviewForm">
	        	<input type="hidden" name="resId" value="<%= request.getAttribute("resId")%>">
	        </form>
		<%
			}
		%>
		<table class="tbl-review">
			<tr>
				<th>작성자</th>
				<th>작성일</th>
				<th>별점</th>
				<th>리뷰사진</th>
				<th>주문내역</th>
				<th>리뷰내용</th>
				<th colspan="2">수정 / 삭제</th>
			</tr>
		<% 
		   if(list != null && !list.isEmpty()) { 
			  for(Review r : list){
		%>	
			<tr>
				<td><%= r.getMemberId() %></td>
				<td><%= r.getReviewTime() %></td>
				<td>
				<% if(r.getReviewStar() == 1) { %>
					<p>☆☆☆☆★</p>
				<%
					}
				%>
				<% if(r.getReviewStar() == 2) { %>
					<p>☆☆☆★★</p>
				<%
					}
				%>
				<% if(r.getReviewStar() == 3) { %>
					<p>☆☆★★★</p>
				<%
					}
				%>
				<% if(r.getReviewStar() == 4) { %>
					<p>☆★★★★</p>
				<%
					}
				%>
				<% if(r.getReviewStar() == 5) { %>
					<p>★★★★★</p>
				<%
					}
				%>
				</td>
				<td>
					<% if(r.getReviewphoto() != null){ %>
					<img src="<%= request.getContextPath() %>/upload/review/<%= r.getReviewphoto().getPhotoRenamedFilename()%>" width="300px" height="300px"/>
					<%
					}
					%>
					<% if(r.getReviewphoto() == null){ %>
					<img src="<%= request.getContextPath() %>/images/reviewPhoto-empty.png" width="300px" height="300px"/>
					<%
					}
					%>
				</td>
				<td><%= r.getReviewOrder() %></td>
				<td><%= r.getReviewContent() %></td>
				<td>
				<input type="button" id="review-update-btn" value="리뷰수정">
					<form id="review-update-frm" action="<%=request.getContextPath()%>/review/reviewUpdate">
						<input type="hidden" name="resId" value="<%= request.getAttribute("resId")%>">
						<input type="hidden" name="reviewNo" value="<%= r.getReviewNo() %>">
					</form>
				</td>
				<td>
				<input type="button" id="review-delete-btn" value="리뷰삭제">
					<form id="review-delete-frm" action="<%=request.getContextPath()%>/review/reviewDelete">
						<input type="hidden" name="resId" value="<%= request.getAttribute("resId")%>">
						<input type="hidden" name="reviewNo" value="<%= r.getReviewNo() %>">
					</form>
				</td>
			</tr>
		<%
			   }
			} else{
		%>
			<tr>
				<td colspan="8" style="text-align:center;">남겨진 리뷰가 없습니다. 주문 후 첫번째 리뷰를 남겨보세요!</td>
			</tr>
		<% } %>
		</table>
		<div id='pageBar'><%= request.getAttribute("pageBar") %></div>
	</section>
	
	<script>
	$("#review-add-btn").click(function(){
		var $frm = $("#review-add-frm");
		console.log($("[name=resId]").val());
	    $frm.submit();
	});
	
	$("#review-update-btn").click(function(){
		var $frm = $("#review-update-frm");
		console.log($("[name=resId]").val());
		console.log($("[name=reviewNo]").val());
	    $frm.submit();
	});
	
	$("#review-delete-btn").click(function(){
		var $frm = $("#review-delete-frm");
		console.log($("[name=resId]").val());
		console.log($("[name=reviewNo]").val());
		if(confirm("리뷰를 삭제하시겠습니까?")){
	    $frm.submit();
		}
	});
	</script>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

