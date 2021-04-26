<%@page import="restaurant.model.vo.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Menu> list = (List<Menu>)request.getAttribute("list"); 
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminMenu.css" />
<section id="restaurantList-container">
	<h2>메뉴관리</h2>
	<input type="button" value="메뉴추가" onclick="menuEnroll();"/>
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
			<td id="resId" style="display:none" ><%= menu.getResId() %></td>

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
	action="<%= request.getContextPath() %>/admin/menuEnroll"
	name="menuEnrollFrm"
	method="GET">
	<input type="hidden" name="resId" />
</form>
<form 
	action="<%= request.getContextPath() %>/admin/menuUpdate"
	name="menuUpdateFrm"
	method="GET">
	<input type="hidden" name="menuId" />
</form>
<script>
function menuEnroll(){
	var resId = $("#resId").text();
	var $frm = $(document.menuEnrollFrm);
	$frm.find("[name=resId]").val(resId);
	$frm.submit();
};

$("#tbl-menuList tr").click(function(){
	var tr = $(this);
	var td = tr.children();
	var menuId = td.eq(1).text();

	var $frm = $(document.menuUpdateFrm);
	$frm.find("[name=menuId]").val(menuId);
	$frm.submit();
});

</script> 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>