<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� - ȸ������</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
<section id=enroll-container>
	<h2>ȸ�� ���� ���� �Է�</h2>
	<form name="memberEnrollFrm" action="<%= request.getContextPath() %>/member/memberEnroll" method="post">
		<table>
			<tr>
				<th>���̵�<sup>*</sup></th>
				<td>
					<input type="text" placeholder="" name="memberId" id="memberId" required>
					<input type="button" value="�ߺ��˻�" onclick="checkIdDuplicate();" />
					<!-- <input type="hidden" id="idValid" value="0" />  -->
					<%-- #idValid 1�̸� ��밡���� ���̵��̰� �ߺ��˻���, 0�̸� �ߺ��˻���. --%>
					<%-- ���̵� �ߺ��˻�� ajax�� ������ ���� --%>
				</td>
			</tr>
			<tr>
				<th>�н�����<sup>*</sup></th>
				<td>
					<input type="password" name="password" id="password" required>
					<br>
				</td>
			</tr>
			<tr>
				<th>�н�����Ȯ��<sup>*</sup></th>
				<td>	
					<input type="password" id="password2" required>
					<br>
				</td>
			</tr>  
			<tr>
				<th>�̸�<sup>*</sup></th>
				<td>	
				<input type="text"  name="memberName" id="memberName" required><br>
				</td>
			</tr>
			<tr>
				<th>�������</th>
				<td>	
				<input type="date" name="birthday" id="birthday" ><br />
				</td>
			</tr> 
			<tr>
				<th>���� </th>
				<td>
					<div class="gender-group">
						<label for="gender0" class="gender0 active">
							<input type="radio" name="gender" id="gender0" value="M" autocomplete="off" checked />����
						</label>
						<label for="gender1" class="gender1">
							<input type="radio" name="gender" id="gender1" value="F" autocomplete="off"/>����
						</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>�ּ�<sup>*</sup></th>
				<td>	
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
			<tr>
				<th>�� �ּ�</th>
				<td>	
					<input type="text" placeholder="" name="address_sub" id="address_sub"><br>
				</td>
			</tr>
			<tr>
				<th>�޴���<sup>*</sup></th>
				<td>	
					<input type="tel" placeholder="(-����)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email"><br>
				</td>
			</tr>
		</table>
		<input type="submit" value="ȸ������" >
	</form>
</section>
</body>
</html>