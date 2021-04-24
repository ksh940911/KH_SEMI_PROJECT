<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Member member = (Member)request.getAttribute("member");
	String memberId = member.getMemberId();
	String memberName = member.getMemberName();
	String password = member.getPassword();
	Date birthday = member.getBirthday() != null? loginMember.getBirthday() : null;
	String gender = member.getGender();
	String address = member.getAddress();
	String addressSub = member.getAddressSub() != null? loginMember.getAddressSub() : "";
	String phone = member.getPhone();
	String email = member.getEmail();
	Date memberEnroll = member.getMemberEnroll();
	String memberRole = member.getMemberRole();
%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminMember.css" />
<div class="content-wrapper">
<section class=memberView-container>
	<form class="memberUpdateFrm" id="memberUpdateFrm" method="POST">
		<div class="memberView-title">
			<p><%= memberName %>(<%= memberId %>) 회원 정보 수정</p>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text"  name="memberId" id="memberId" value="<%= memberId %>"  readonly><br>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
					<td>
					<input type="text"  name="password" id="password" value="********"  readonly><br>
					</td>
			</tr>
			<tr>
				<th>권한</th>
				
					<%-- <select class="member-role" data-member-id="<%= memberRole %>">
						<option 
							value="<%= MemberService.ADMIN_ROLE %>"
							<%=	MemberService.ADMIN_ROLE.equals(memberRole) ? "selected" : "" %>>관리자</option>
						<option 
							value="<%= MemberService.MEMBER_ROLE %>"
							<%= MemberService.MEMBER_ROLE.equals(memberRole) ? "selected" : "" %>>일반</option>
					</select> --%>
					<td>
					<input type="radio" name="memberRole" id="U" value="U" <%= memberRole.equals("U") ? "checked" : "" %>>
						<label for="U">일반사용자</label>
					<input type="radio" name="memberRole" id="A" value="A" <%= memberRole.equals("A") ? "checked" : "" %>>
						<label for="A">관리자</label>
					</td>
				
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text"  name="memberName" id="memberName" value="<%= memberName %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="date" name="birthday" id="birthday" value="<%= birthday %>"><br>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" id="gender0" value="M" <%= gender.equals("M") ? "checked" : "" %>>
						<label for="gender0">남자</label>
					<input type="radio" name="gender" id="gender1" value="F" <%= gender.equals("F") ? "checked" : "" %>>
						<label for="gender1">여자</label>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" id="postcode" placeholder="우편번호" required><br>
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address" id="address" placeholder="주소" value="<%= address %>"><br>
					<input type="text" name="addressSub" id="addressSub" placeholder="상세주소" value="<%= addressSub %>"><br>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" placeholder="abc@xyz.com" name="email" id="email" value="<%= email%>"><br></td>
			</tr>
		</table>
		<div class="button-class">
			<input type="button" value="수정" onclick="updateMember();" />
			<input type="button" value="삭제" onclick="deleteMember();" />
			<input type="button" value="취소" onclick="history.back()" />
		</div>
	</form>
</section>
</div>
<script>

function updateMember() {
	$("#memberUpdateFrm").attr("action", "<%= request.getContextPath()%>/admin/memberUpdate")
						 .submit();
}


/**
 * 중복검사 이후 전화번호를 변경하는 것을 방지
 */
$("#phone").change(function() {
	$("#phoneValid").val(0);
});


/**
 * 회원가입 유효성 검사
 */
 $(document.memberUpdateFrm).submit(function(){
	 //이름 유효성 검사
	 var $memberName = $("#memberName");
	 if(/^[가-힣]{2,5}/.test($memberName.val()) == false) {
		 alert("이름은 한글 2~5글자 사이로 입력해주세요.");
		 $memberName.select();
		 return false;
	 }
	 return true;
 });


/*
 * 다음 카카오 주소 API 스크립트
 */
 function execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var addrSub = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	 addrSub += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                	 addrSub += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(addrSub !== ''){
                	 addrSub = ' (' + addrSub + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 document.getElementById("addressSub").value = addrSub;
             
             } else {
                 document.getElementById("addressSub").value = '';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById("postcode").value = data.zonecode;
             document.getElementById("address").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("addressSub").focus();
         }
     }).open();
 };
 
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>