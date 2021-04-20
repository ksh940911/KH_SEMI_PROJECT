<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기요 - 회원가입</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/memberEnroll.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
<section id=enroll-container>
	<!-- 여기요 로고 삽입 -->
	<h1>여기요</h1>
	<form name="memberEnrollFrm" action="<%= request.getContextPath() %>/member/memberEnroll" method="post">
		<div id="contentBox">
			<table>
					<tr>
						<th>아이디<sup>*</sup></th>
						<td>
							<input type="text" placeholder="ID를 입력하세요." name="memberId" id="memberId" onkeyup="memberIdCheck()" required>
							<%-- #idValid 1이면 사용가능한 아이디이고 중복검사함, 0이면 중복검사전. --%>
							<input type="hidden" id="idValid" value="0" />
							<span id="memberIdResult"></span>
						</td>
					</tr>
				<tr>
					<th>패스워드<sup>*</sup></th>
					<td>
						<input type="password" placeholder="비밀번호를 입력하세요." name="password" id="password" required>
						<br>
					</td>
				</tr>
				<tr>
					<th>패스워드확인<sup>*</sup></th>
					<td>	
						<input type="password" placeholder="비밀번호를 확인하세요." id="password2" required>
						<br>
					</td>
				</tr>  
				<tr>
					<th>이름<sup>*</sup></th>
					<td>	
					<input type="text" placeholder="이름을 입력하세요." name="memberName" id="memberName" required><br>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>	
					<input type="date" name="birthday" id="birthday" ><br />
					</td>
				</tr> 
				<tr>
					<th>성별 </th>
					<td>
						<div class="gender-group">
							<label for="gender0" class="gender0 active">
								<input type="radio" name="gender" id="gender0" value="M" autocomplete="off" checked />남자
							</label>
							<label for="gender1" class="gender1">
								<input type="radio" name="gender" id="gender1" value="F" autocomplete="off"/>여자
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>주소<sup>*</sup></th>
					<td>	
						<input type="text" placeholder="주소를 입력하세요." name="address" id="address"><br>
					</td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td>	
						<input type="text" placeholder="" name="addressSub" id="addressSub"><br>
					</td>
				</tr>
				<tr>
					<th>휴대폰<sup>*</sup></th>
					<td>	
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>	
						<input type="email" placeholder="abc@xyz.com" name="email" id="email"><br>
					</td>
				</tr>
			</table>
			<div class="exformTxt"><sup>*</sup> 표시는 필수적으로 입력해주셔야 가입이 가능합니다.</div>
		</div>
		<input type="submit" value="회원가입" id="joinButton">
	</form>
</section>
<script>

/**
 * ajax 비동기방식으로 아이디 중복 검사
 */
function memberIdCheck(){
	$.ajax({
		url: "<%= request.getContextPath() %>/member/memberIdCheck",
		method : "POST",
		data : {
			id : $("#memberId").val()
		},
		success : function(data) {
			if(data == "success") {
				$("#memberIdResult").html("<p style='color:blue'>사용 가능한 아이디입니다.</p>");
				$("#idValid").val(1);
			} else if(data == "fail"){
				$("#memberIdResult").html("<p style='color:red'>중복된 아이디입니다.</p>");
				$("#idValid").val(0);
			}
		}
	})
};

/**
 * 중복검사 이후 다시 아이디를 변경하는 것을 방지
 */
$("#memberId").change(function() {
	$("#idValid").val(0);
});

/**
 * 회원가입 유효성 검사
 */
 $(document.memberEnrollFrm).submit(function(){
	 var re = /^[a-zA-Z0-9]{4,12}$/ //아이디, 패스워드 정규표현식
	 var $memberId = $("#memberId");
	 var $idValid = $("#idValid");
	 
	 //아이디 유효성 검사
	 if(re.test($memberId.val()) == false) {
		 alert("아이디는 4~12자리의 영문자, 숫자만 가능합니다.");
		 $memberId.select();
		 return false;
	 }
	 
	if($idValid.val() == 0) {
		alert("아이디 중복검사를 해주세요.");
		$idValid.select();
		return false;
	}
	 
	 var $pwd1 = $("#password");
	 var $pwd2 = $("#password2");
	 
	 //패스워드 유효성 검사
	 if(re.test($pwd1.val()) == false) {
		 alert("패스워드는 4~12자리의 영문자, 숫자만 가능합니다.");
		 $pwd1.select();
		 return false;
	 }
	 
	 if($pwd1.val() != $pwd2.val()) {
		 alert("패스워드가 일치하지 않습니다.");
		 $pwd1.select();
		 return false;
	 }
	 
	 //이름 유효성 검사
	 var $memberName = $("#memberName");
	 if(/^[가-힣]{2,5}/.test($memberName.val()) == false) {
		 alert("이름은 한글 2~5글자 사이로 입력해주세요.");
		 $memberName.select();
		 return false;
	 }
	 
	 //휴대폰번호
	 var $phone = $("#phone");
	 //숫자가 아닌 문자 제거
	 $phone.val($phone.val().replace(/[^0-9]/g, ""))
	 
	 if(/^01[0-9]{8}/.test($phone.val()) == false) {
		 alert("유효한 휴대폰 번호를 입력해주세요.");
		 $phone.select();
		 return false;
	 }
	 
	 return true;
	 
 });
 
 
</script>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>