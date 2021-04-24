<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerMemberView.jsp" %>
<%
	String oldphone = loginMember.getPhone();
	String memberId = loginMember.getMemberId();
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member.css" />
<section id=updatePhone-container>
	<h3>전화번호 변경</h3>
	<form 
		name="updatePhoneFrm" 
		action="<%=request.getContextPath()%>/member/updatePhone" 
		method="post" >
		<table>
			<tr>
				<th>변경할 휴대전화</th>
				<td>
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
					<input type="hidden" id="phoneValid" value="0" />
					<span id="phoneResult"></span>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="변경" />
					<input type="button" value="취소" onclick="history.back()" />
				</td>
			</tr>
		</table>
	</form>
</section>
<script>

$("#phone").blur(function(){
 	$.ajax({
 		url: "<%= request.getContextPath() %>/member/memberPhoneCheck",
 		method : "POST",
 		data : {
 			id : "<%= memberId %>",
 			newPhone : $("#phone").val(),
 			oldPhone : "<%= oldphone %>"
 		},
 		success : function(result) {
 			 //휴대폰번호
 			 var $phone = $("#phone").val();
 			 //숫자가 아닌 문자 제거
//  		 $phone.val($phone.val().replace(/[^0-9]/g, ""))
 			 console.log(result);
 			 
 			 if(/^01[0-9][0-9]{8}/.test($phone) == false) {
 				 console.log("유효성 검사 테스트");
 				 $("#phoneResult").html("<p style='color:red'>유효한 휴대폰 번호를 입력하세요</p>");
 				 $("#phoneValid").val(0);
 				 return false;
 			 } else if (result == 0) {
 				 console.log("이미 가입");
 				 $("#phoneResult").html("<p style='color:red'>이미 회원가입된 휴대폰 번호입니다.</p>");
 				 $("#phoneValid").val(0);
 			 } else if (result == 1) {
 				 console.log("사용 가능");
 				 $("#phoneResult").html("<p style='color:blue'>사용 가능한 휴대폰 번호입니다.</p>");
 				 $("#phoneValid").val(1);
 			 }
 		},
 		
		error: function(xhr, staus, err){
			console.log(xhr, staus, err);
		}
 	})
 });

$("#phone").change(function() {
	$("#phoneValid").val(0);
});

$("[name=updatePhoneFrm]").submit(function(){
	if($("#phoneValid").val() == 0) {
		alert("사용할 수 없는 휴대폰 번호입니다. 다시 입력하세요.");
		$("#phone").select();
		return false;
	}
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>