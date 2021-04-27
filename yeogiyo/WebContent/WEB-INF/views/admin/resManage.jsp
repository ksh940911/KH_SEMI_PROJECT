<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Restaurant> list = (List<Restaurant>)request.getAttribute("list");
	
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRes.css" />

<section id="restaurantList-container">
	<h2 class="management"> ※가게관리</h2>
	<div id="search-container">
		<ul class="res_search">가게조회</ul>
			<div id="search-resId" class="search-type">
	            <form action="<%=request.getContextPath()%>/admin/resFinder">
	    	         <input type="text" name="searchResName"  size="25" placeholder="검색할 가게명을 입력하세요." class="searchName"/>
	                <button type="submit" class="search-Click">검색</button>			
	            </form>	
	        </div>
		</div>
				<input type="button" value="신규가게등록" onclick="location.href='<%= request.getContextPath() %>/admin/resEnroll';"/>
	<table id="tbl-resList">
		<% if (list == null || list.isEmpty()) { %>
			<tr>
				<td colspan="8" style="text-align:center;"> 조회된 가게가 없습니다. </td>
			</tr>
		<% } else { %>
		<thead>
			<tr class="table_id">
				<th class="res_id">가게번호</th>
				<th class="res_category">카테고리</th>
				<th class="res_img">가게로고</th>
				<th class="res_name">가게명</th>
				<th class="rse_address">가게주소</th>
				<th class="res_min_price">최소주문금액</th>
				<th class="res_rate_avg">별점평균</th>
				<th class="res_review_cnt">리뷰갯수</th>
			</tr>
		</thead>
		<tbody>
	<% for(Restaurant res : list) { %>
		<tr class="resLists" 
			onmouseover="this.style.background='rgba(250, 0, 80, 0.2)'" 
			onmouseout="this.style.background='white'">
			<td><%= res.getResId() %></td>
			<td><%= res.getCategory() %></td>
			<td>
			<% if(res.getResImg() != null && res.getResImg().getImgResStatus()) { %>
				<img src="<%= request.getContextPath() %>/upload/res/<%= res.getResImg().getRenamedFilename() %>" class="resList-img" style="width:50px;"/>	
			<% } else { %>
				<img src="<%= request.getContextPath() %>/images/logo.png" class="resList-img" style="width:50px;"/>	
			<% } %> 
			
			</td>
			<td><%= res.getResName() %></td>
			<td><%= res.getResAddress() %></td>
			<td><%= res.getMinPrice() %></td>
			<td><%= res.getRateAvg() %></td>
			<td><%= res.getReviewCnt() %></td>
		</tr>
	<% 
			}
		}
	%>
	</tbody>
</table>
<div id="pageBar">
	<%= request.getAttribute("pageBar") %>
</div>
</section>

<form 
	action="<%= request.getContextPath() %>/admin/resUpdate"
	name="resUpdateFrm"
	method="GET">
	<input type="hidden" name="resId" />
</form>

<script>
$("#tbl-resList tr").click(function(){
	var tr = $(this);
	var td = tr.children();
	var resId = td.eq(0).text();

	var $frm = $(document.resUpdateFrm);
	$frm.find("[name=resId]").val(resId);
	$frm.submit();
});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>