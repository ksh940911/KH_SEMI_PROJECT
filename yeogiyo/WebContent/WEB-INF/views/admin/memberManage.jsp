<%@page import="member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	String type = request.getParameter("searchType");
	String kw = request.getParameter("searchKeyword");

%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/adminMember.css" />
<section id="memberManage-container">
	<h2 class="management">※회원관리</h2>
	<div id="search-container">
		<ul class="user_search">회원조회</ul>
		<select id="searchType">
			<option value="memberId"
				<%= "memberId".equals(type) ? "selected" : "" %>>아이디</option>
			<option value="memberName"
				<%= "memberName".equals(type) ? "selected" : "" %>>회원명</option>
			<option value="gender" <%= "gender".equals(type) ? "selected" : "" %>>성별</option>
		</select>
		<div id="search-memberId" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="memberId" /> <input
					type="text" name="searchKeyword" size="25"
					value="<%= "memberId".equals(type) ? kw : "" %>"
					placeholder="검색할 아이디를 입력하세요." class="searchName" />
				<button type="submit" class="search-Click">검색</button>
			</form>
		</div>
		<div id="search-memberName" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="memberName" /> <input
					type="text" name="searchKeyword" size="25"
					value="<%= "memberName".equals(type) ? kw : "" %>"
					placeholder="검색할 이름을 입력하세요." class="searchName" />
				<button type="submit" class="search-Click">검색</button>
			</form>
		</div>
		<div id="search-gender" class="search-type">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="gender" /> <input
					type="radio" name="searchKeyword" value="M"
					<%= "gender".equals(type) && "M".equals(kw) ? "checked" : "" %>>
				남 <input type="radio" name="searchKeyword" value="F"
					<%= "gender".equals(type) && "F".equals(kw) ? "checked" : "" %>>
				여
				<button type="submit" class="search-Click">검색</button>
			</form>
		</div>
	</div>

	<table id="tbl-memberList">

		<% if(list == null || list.isEmpty()) {%>
		<tr>
			<td colspan="9" style="text-align: center;">조회된 회원이 없습니다.</td>
		</tr>
		<% 	} else { %>
		<thead>
			<tr class="table_id">
				<th class="user_id">아이디</th>
				<th class="user_name">이름</th>
				<th class="user_power">회원권한</th>
				<th class="user_birth">생년월일</th>
				<th class="user_sex">성별</th>
				<th class="user_address">주소</th>
				<th>휴대폰번호</th>
				<th class="address">이메일</th>
				<th>회원가입일</th>
			</tr>
		</thead>
		<tbody>
		<%	for(Member m : list){%>
			<tr class="membership"
				onmouseover="this.style.background='rgba(250, 0, 80, 0.2)'"
				onmouseout="this.style.background='white'">
				<td><%= m.getMemberId() %></td>
				<td><%= m.getMemberName() %></td>
				<td style="text-align: center;"><%= m.getMemberRole().equals("U") ? "일반" : "관리자" %></td>
				<td><%= m.getBirthday() != null ? m.getBirthday() : ""%></td>
				<td><%= "M".equals(m.getGender()) ? "남" : "여" %></td>
				<td><%= m.getAddress() != null ? m.getAddress() : "" %> <%= m.getAddressSub() != null ? m.getAddressSub() : "" %></td>
				<td><%= m.getPhone() %></td>
				<td><%= m.getEmail() != null ? m.getEmail() : "" %></td>
				<td><%= m.getMemberEnroll() %></td>
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
<form action="<%= request.getContextPath() %>/admin/memberUpdate"
	name="memberUpdateFrm" method="GET">
	<input type="hidden" name="memberId" />
</form>
<script>
$("#tbl-memberList tr").click(function(){
	var tr = $(this);
	var td = tr.children();
	var memberId = td.eq(0).text();

	var $frm = $(document.memberUpdateFrm);
	$frm.find("[name=memberId]").val(memberId);
	$frm.submit();
});


$(searchType).change(function(){
	var searchTypeVal = $(this).val();
	$(".search-type")
		.hide()
		.filter("#search-" + searchTypeVal)
		.css("display", "inline-block");
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
