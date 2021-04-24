<%@page import="restaurant.model.vo.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Menu> list = (List<Menu>)request.getAttribute("list"); 
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css" />
<section id="restaurantList-container">
	<h2>메뉴관리</h2>
	<input type="button" value="메뉴추가" onclick="location.href='<%= request.getContextPath() %>/admin/menuEnroll';"/>
	<table id="tbl-menuList">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>카테고리</th>
			<th>설명</th>
			<th>가격</th>
			<th>이미지</th>
		</tr>
	</thead>
	<tbody>
	<% if (list == null || list.isEmpty()) { %>
		<tr>
			<td colspan="6" style="text-align:center;"> 메뉴가 없습니다. </td>
		</tr>
	<% 
		} else { 
		for(Menu menu : list) {
	%>
		<tr onmouseover="this.style.background='rgba(250, 0, 80, 0.2)'" onmouseout="this.style.background='white'">
			<td><%= menu.getMenuId() %></td>
			<td><%= menu.getMenuName() %></td>
			<td><%= menu.getMenuCategory() %></td>
			<td><%= menu.getDescription() %></td>
			<td><%= menu.getPrice() %></td>
			<td><img style="width: 50px; height:50px;" src="<%= menu.getMenuImg() %>" alt=""></td>
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