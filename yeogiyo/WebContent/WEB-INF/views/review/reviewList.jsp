<%@page import="review.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Review> list = (List<Review>) request.getAttribute("list");

%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/review.css" />
<section id="review-container">
	<h2>클린리뷰</h2>
	<%
		//if(loginMember != null){
	%>
	<input type="button" id="review-add-btn" value="리뷰등록">
  		<form id="review-add-frm" action="<%=request.getContextPath()%>/review/reviewForm">

        	<input type="hidden" name="resId" value="<%= request.getAttribute("resId")%>">
        	<input type="hidden" name="orderMenu" value="<%= request.getAttribute("orderMenu")%>">
        </form>
	<%
		//}
	%>
	<div>
	<%
		Review review = new Review();
		int star = review.getReviewStar();
		if(star < 1){
			System.out.println("☆☆☆☆☆");
		}
		if(star < 2){
			System.out.println("★☆☆☆☆");
		}
		if(star < 3){
			System.out.println("★★☆☆☆");
		}
		if(star < 4){
			System.out.println("★★★☆☆");
		}
		if(star < 5){
			System.out.println("★★★★☆");
		}
		else
			System.out.println("★★★★★");
	%>
	<br><span style="text-align:center"><%= review.getReviewStar() %>/5</span>
	</div>
	<table id="tbl-review">
		<tr>
			<th colspan="6">리뷰 *개</th>
		</tr>
	<% 
	   if(list != null && !list.isEmpty()) { 
		  for(Review r : list){
	%>	
		<tr>
			<td><%= r.getMemberId() %></td>
			<td><%= r.getReviewTime() %></td>
			<td><%= r.getReviewStar() %></td>
			<td>
				<% if(r.getReviewphoto() != null){ %>
				<img src="<%= request.getContextPath() %>/upload/review/<%= r.getReviewphoto().getPhotoRenamedFilename()%>" width="16px"/>
				<% } %>
			</td>
			<td><%= r.getReviewOrder() %></td>
			<td><%= r.getReviewContent() %></td>
		</tr>
	<%   
		  }
		} else { 
	%>
		<tr>
			<td colspan="6" style="text-align:center;">남겨진 리뷰가 없습니다. 주문 후 첫번째 리뷰를 남겨보세요!</td>
		</tr>
	<% } %>
	</table>

	<div id='pageBar'><%= request.getAttribute("pageBar") %></div>
</section>
<script>
   
     $("#review-add-btn").click(function(){
     	var $frm = $("#review-add-frm");
     	console.log($("[name=resId]").val());
     	//
        	$frm.submit();
     });
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

