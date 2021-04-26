<%@page import="member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	String type = request.getParameter("searchType");
	String kw = request.getParameter("searchKeyword");

%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/memberManage.css" />
<style>
	div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(250, 0, 80, 0.7);}
	div#search-memberId {display: <%= type == null || "memberId".equals(type) ? "inline-block" : "none" %>;}
	div#search-memberName{display:<%= "memberName".equals(type) ? "inline-block" : "none" %>;}
	div#search-gender{display: <%= "gender".equals(type) ? "inline-block" : "none" %>;}
</style>
<section id="memberManage-container">
	<h2>회원관리</h2>
	   <div id="search-container">
        회원조회 : 
        <select id="searchType">
            <option value="memberId" <%= "memberId".equals(type) ? "selected" : "" %>>아이디</option>		
            <option value="memberName" <%= "memberName".equals(type) ? "selected" : "" %>>회원명</option>
            <option value="gender" <%= "gender".equals(type) ? "selected" : "" %>>성별</option>
        </select>
        <div id="search-memberId" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberId"/>
                <input type="text" name="searchKeyword"  size="25" value="<%= "memberId".equals(type) ? kw : "" %>" placeholder="검색할 아이디를 입력하세요."/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-memberName" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberName"/>
                <input type="text" name="searchKeyword" size="25" value="<%= "memberName".equals(type) ? kw : "" %>" placeholder="검색할 이름을 입력하세요."/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-gender" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="gender"/>
				<input type="radio" name="searchKeyword" value="M" <%= "gender".equals(type) && "M".equals(kw) ? "checked" : "" %>> 남
                <input type="radio" name="searchKeyword" value="F" <%= "gender".equals(type) && "F".equals(kw) ? "checked" : "" %>> 여
                <button type="submit">검색</button>
            </form>
        </div>
    </div>

<table id="tbl-memberList">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>회원권한</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>주소</th>
				<th>휴대폰번호</th>
				<th>이메일</th>
				<th>회원가입일</th>
			</tr>
		</thead>
		<tbody>
			<% if(list == null || list.isEmpty()) {%>
				<tr>
					<td colspan="9" style="text-align:center;"> 조회된 회원이 없습니다. </td>
				</tr>
			<% 
				} else {
					for(Member m : list){
			%>
				<tr onmouseover="this.style.background='rgba(250, 0, 80, 0.2)'" onmouseout="this.style.background='white'">
					<td><%= m.getMemberId() %></td>
					<td><%= m.getMemberName() %></td>
					<td style="text-align:center;"><%= m.getMemberRole().equals("U") ? "일반" : "관리자" %></td>
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
<form 
	action="<%= request.getContextPath() %>/admin/memberUpdate"
	name="memberUpdateFrm"
	method="GET">
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

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
