<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header_sign.jsp" %>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<body>
<section id=enroll-container>
	<h2>회원 가입 정보 입력</h2>
	<form name="memberEnrollFrm" action="<%= request.getContextPath() %>/member/memberEnroll" method="post">
		<table>
			<tr>
				<th>아이디<sup>*</sup></th>
				<td>
					<input type="text" placeholder="" name="memberId" id="memberId" required>
					<input type="button" value="중복검사" onclick="checkIdDuplicate();" />
					<!-- <input type="hidden" id="idValid" value="0" />  -->
					<%-- #idValid 1이면 사용가능한 아이디이고 중복검사함, 0이면 중복검사전. --%>
					<%-- 아이디 중복검사는 ajax로 구현할 예정 --%>
				</td>
			</tr>
			<tr>
				<th>패스워드<sup>*</sup></th>
				<td>
					<input type="password" name="password" id="password" required>
					<br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인<sup>*</sup></th>
				<td>	
					<input type="password" id="password2" required>
					<br>
				</td>
			</tr>  
			<tr>
				<th>이름<sup>*</sup></th>
				<td>	
				<input type="text"  name="memberName" id="memberName" required><br>
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
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
			<tr>
				<th>상세 주소</th>
				<td>	
					<input type="text" placeholder="" name="address_sub" id="address_sub"><br>
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
		<input type="submit" value="회원가입" >
	</form>
</section>
</body>
</html>