<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/headerMemberView.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css" />
<div class="content-wrapper" >

	<form action="<%= request.getContextPath() %>/member/memberDelete" method="post" onsubmit="return deleteConfirm()">
	<div class="memberView-title">
		<p>회원 탈퇴</p>
	</div>
		<table>
			<tr>
				<td>아이디 확인</td>
				<td>
					<input type="text" placeholder="ID를 입력하세요." name="memberId" id="memberId" required>
				</td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td>
					<input type="password" placeholder="비밀번호를 입력하세요." name="password" id="password" required>
				</td>
			</tr>
		</table>
		<div class="button-class">
			<input type="submit" value="회원 탈퇴"/>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script>

function deleteConfirm() {
	return confirm("정말로 삭제하시겠습니까?");
}
</script>