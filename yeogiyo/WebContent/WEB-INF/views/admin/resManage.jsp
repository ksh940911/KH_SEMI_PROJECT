<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Restaurant> list = (List<Restaurant>)request.getAttribute("list");
	int resId = 0;
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css" />
<style>
	div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(250, 0, 80, 0.7);}
</style>
<section id="restaurantList-container">
	<h2>가게관리</h2>
		<div id="search-container">
	
			<div id="search-resId" class="search-type">
	            <form action="<%=request.getContextPath()%>/admin/restaurantFinder">
	               가게조회 : <input type="text" name="searchResId"  size="25" placeholder="검색할 가게를 입력하세요."/>
	                <button type="submit">검색</button>			
	            </form>	
	        </div>
		</div>
<table id="tbl-resList">
	<thead>
		<tr>
			<th>가게번호</th>
			<th>카테고리</th>
			<th>가게로고</th>
			<th>가게명</th>
			<th>가게주소</th>
			<th>최소주문금액</th>
			<th>별점평균</th>
			<th>리뷰갯수</th>
		</tr>
	</thead>
	<tbody>
	<% if (list == null || list.isEmpty()) { %>
		<tr>
			<td colspan="9" style="text-align:center;"> 조회된 가게가 없습니다. </td>
		</tr>
	<% 
		} else { 
		for(Restaurant res : list) {
	%>
		<tr onmouseover="this.style.background='rgba(250, 0, 80, 0.2)'" onmouseout="this.style.background='white'">
			<td><%= res.getResId() %></td>
			<td><%= res.getCategory() %></td>
			<td><img style="width: 50px; height:50px;" src="<%= res.getLogoImg() %>" alt=""></td>
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

<%-- <form action="<%= request.getContextPath() %>/admin/resDelete" id="res-del-frm" method="POST">
	<input type="hidden" name="resId" value="<%= %>" />

</form> --%>
<script>
$("#tbl-resList tr").click(function(){
	var tr = $(this);
	var td = tr.children();
	console.log(tr.text());
	resId = td.eq(0).text();
	console.log(resId);
	
});
function updateRes(){
	
	
}

function deleteRes(){
	if(confirm("가게를 삭제 하시겠습니까?")){
		var $frm = $("#res-del-frm");
		$frm.submit();
	}
	
}

</script>

<%-- 	<input type="button" value="신규등록" />
	<input type="button" value="가게찾기(가게명)" /><!-- 텍스트박스 검색?  -->
	
	 <input type="button" id="noticeMamage" onclick="location.href='<%= request.getContextPath() %>/notice/noticeManage';">공지관리</button>
	 <input type="button" id="reviewMamage" onclick="location.href='<%= request.getContextPath() %>/notice/reviewManage';">리뷰관리</button>
 --%>	 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>