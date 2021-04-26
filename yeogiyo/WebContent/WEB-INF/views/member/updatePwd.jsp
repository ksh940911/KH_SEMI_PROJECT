<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerMemberView.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css" />
<section class="content-wrapper" id=updatePwd-container>
	<form 
		name="updatePwdFrm" 
		action="<%=request.getContextPath()%>/member/updatePassword" 
		method="post" >
		<div class="memberView-title">
			<p>비밀번호 변경</p>
		</div>
		<table>
			<tr>
				<th>현재 비밀번호</th>
				<td><input type="password" name="password" id="password" required></td>
			</tr>
			<tr>
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" name="newPassword" id="newPassword" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>	
					<input type="password" id="passwordCheck" required><br>
				</td>
			</tr>
		</table>
		<div class="button-class">
			<input type="submit" value="변경" />
			<input type="submit" value="취소 " onclick="history.back()" /><br><br>
			<a href="<%= request.getContextPath() %>/member/searchPwd">비밀번호를 잊으셨나요?</a>
		</div>
	</form>
</section>

<!-- Modal -->
<!--  
<div class="modal fade" id="dataModal" tabindex="-1" role="dialog" aria-labelledby="dataModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-sm">
    <div class="modal-content" >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="dataModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" >

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div> 
-->

<script>

//폼제출 유효성 검사
$("[name=updatePwdFrm]").submit(function(){
	var $oldPassword = $("#password");
	var $newPassword = $("#newPassword");
	var $newPasswordCheck = $("#passwordCheck");
	
	if($newPassword.val() != $newPasswordCheck.val()) {
		alert("입력한 비밀번호가 일치하지 않습니다.");
		$newPassword.select();
		return false;
	}
	
	if(/^[a-zA-Z0-9]{4,12}$/.test($newPassword.val()) == false) {
		 alert("패스워드는 4~12자리의 영문자, 숫자만 가능합니다.");
		 $newPassword.select();
		 return false;
	}
	
	if ($oldPassword.val() == $newPassword.val()) {
		alert("기존 비밀번호와 신규 비밀번호는 같을 수 없습니다.");
		$oldPassword.select();
		return false;
	}
	
	return true;
});


</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>