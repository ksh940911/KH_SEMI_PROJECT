<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<title>여기요 - rkrpcnrk</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRes.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>

<section id=enroll-container>
	<form name="menuEnrollFrm" action="<%= request.getContextPath() %>/admin/menuEnroll" method="POST">
		<div id="contentBox">
			<table>
				<tr>
					<th>가게번호</th>
					<td>
						<input type="text" name="resId" id="resId" value='<%= request.getParameter("resId")%>' readonly ><br>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>	
					<input type="text" name="category" id="category" required />	
					</td>
				</tr>	
				<tr>
					<th>메뉴명</th>
					<td>
					<input type="text" placeholder="메뉴명을 입력하세요." name="menuName" id="menuName" required><br>
					</td>
				</tr>
				<tr>
					<th>메뉴설명</th>
					<td>
					<textarea name="description" cols="30" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
					<input type="text" name="price" id="price" required/>
					</td>
				</tr>
				<tr>
					<th>로고 이미지</th>
					<td>
						<input type="file" name="upImgFile" accept="image/*" />
					</td>
				</tr>
				<tr>
					<th>
						<input type="submit" value="등록" />
						<input type="button" value="취소" onclick="location.href='<%= request.getContextPath() %>/admin/menuManage?resId=<%= request.getAttribute("resId")%>'">
					</th>
				</tr>
			</table>
		</div>
	</form>
</section>
<script>
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>