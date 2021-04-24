<%@page import="restaurant.model.vo.Menu"%>
<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Restaurant res = (Restaurant)request.getAttribute("res");
	int resId = res.getResId();
	String resName = res.getResName();
	String resAddress = res.getResAddress();
	String category = res.getCategory();
	int minPrice = res.getMinPrice();
	String logoImg = res.getLogoImg();
	double rateAvg = res.getRateAvg();
	int reviewCnt = res.getReviewCnt();
	Menu menu = res.getMenu();
	
	String[] categorys ={
			"프랜차이즈", "치킨", "피자/양식", "중국집", "한식",
			"일식/돈까스", "족발/보쌈", "분식", "카페/디저트", "편의점"
	};
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRes.css" />
<div class="content-wrapper">
<section class=resView-container>
	<form class="resUpdateFrm" id="resUpdateFrm" method="POST">
		<div class="resView-title">
			<p>[<%= resId %>.<%= resName %>] 가게 정보 수정</p>
		</div>
		<table>
			<tr>
				<th>No</th>
				<td>
					<input type="text" name="resId" id="resId" value="<%= resId %>" readonly />
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
				<select class="category" name="category">
					<option	value="<%= categorys[0] %>"	<%=  category.equals(categorys[0]) ? "selected" : "" %>>프렌차이즈</option>
					<option value="<%= categorys[1] %>" <%=  category.equals(categorys[1]) ? "selected" : "" %>>치킨</option>
					<option value="<%= categorys[2] %>" <%=  category.equals(categorys[2]) ? "selected" : "" %>>피자/양식</option>
					<option value="<%= categorys[3] %>" <%=  category.equals(categorys[3]) ? "selected" : "" %>>중국집</option>
					<option value="<%= categorys[4] %>" <%=  category.equals(categorys[4]) ? "selected" : "" %>>한식</option>
					<option value="<%= categorys[5] %>" <%=  category.equals(categorys[5]) ? "selected" : "" %>>일식/돈까스</option>
					<option value="<%= categorys[6] %>" <%=  category.equals(categorys[6]) ? "selected" : "" %>>족발/보쌈</option>
					<option value="<%= categorys[7] %>" <%=  category.equals(categorys[7]) ? "selected" : "" %>>분식</option>
					<option value="<%= categorys[8] %>" <%=  category.equals(categorys[8]) ? "selected" : "" %>>카페/디저트</option>
					<option value="<%= categorys[9] %>" <%=  category.equals(categorys[9]) ? "selected" : "" %>>편의점</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>로고</th>
				<td>
				<img style="width: 50px; height:50px;" src="<%= logoImg %>" alt="">
				</td>
			</tr>
			<tr>
				<th>가게명</th>
				<td>
				<input type="text" name="resName" id="resName" placeholder="가게명"value="<%= resName %>" required />
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				<input type="text" name="resAddress" id="reaAddress" placeholder="주소"value="<%= resAddress %>" required />
				</td>
			</tr>
			<tr>
				<th>최소주문금액</th>
				<td>
					<input type="range" name="minPrice" id="minPrice" min="0" max="20000" step="100" value="<%= minPrice %>"
								oninput="document.getElementById('mPval').innerHTML=this.value;"/><span id="mPval"><%= minPrice %></span>원
				</td>
			</tr>
		</table>
		<div class="button-class">
			<input type="button" value="메뉴관리" onclick="menuManage();" />
			<br />
			<input type="button" value="수정" onclick="updateRes();" />
			<input type="button" value="삭제" onclick="deleteRes();" />
			<input type="button" value="취소" onclick="location.href='<%= request.getContextPath() %>/admin/resManage';" />
		</div>
	</form>
	<form action="<%= request.getContextPath() %>/admin/menuManage"
		id="menuManageFrm"
		method="GET">
		<input type="hidden" name="resId" value="<%= resId %>" />
	</form>
</section>
</div>

<script>
function menuManage(){
	$("#menuManageFrm").submit();
};

function updateRes() {
	$("#resUpdateFrm").attr("action", "<%= request.getContextPath()%>/admin/resUpdate")
						 .submit();
};

<%-- 
function deleteRes(){
	var resId = "<%= resId %>";
	var memberName = "<%= resName %>";
	
	if(confirm("[" + resId + "]." + resName + " 가게를 삭제하시겠습니까?")){
		$("#resUpdateFrm")
			.attr("action", "<%= request.getContextPath()%>/admin/resDelete")
			.submit();	
	}
};
--%>
 
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>