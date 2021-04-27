<%@page import="restaurant.model.vo.ResImg"%>
<%@page import="restaurant.model.vo.Menu"%>
<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	ResImg resImg = new ResImg();
	Restaurant res = (Restaurant)request.getAttribute("res");
	if(res.getResImg() == null){
		resImg.setImgResStatus(false);
		res.setResImg(resImg);
	}
		
	String[] categorys ={
			"프랜차이즈", "치킨", "피자/양식", "중국집", "한식",
			"일식/돈까스", "족발/보쌈", "분식", "카페/디저트", "편의점"
	};
%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRes.css" />

<div class="content-wrapper">
<section class=resView-container>
	<form class="resUpdateFrm" id="resUpdateFrm" method="POST" enctype="multipart/form-data">
		<img src="/yeogiyo/images/logo.png"  class="loggo">
		<div class="resView-title">
			<p class="updateRes">[<%= res.getResId() %>.<%= res.getResName() %>]</p> 
			<input type="button" class="clickAddBtn" value="공지관리" onclick="noticeManage();" />
		</div>
		<div id="contentBox">
		<table>
			<tr>
				<th class="resIdNo">No</th>
				<td class="resIdNo">
					<input type="text" name="resId" id="resId" value="<%= res.getResId() %>" readonly />
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
				<select class="category" name="category">
					<option	value="<%= categorys[0] %>"	<%=  res.getCategory().equals(categorys[0]) ? "selected" : "" %>>프렌차이즈</option>
					<option value="<%= categorys[1] %>" <%=  res.getCategory().equals(categorys[1]) ? "selected" : "" %>>치킨</option>
					<option value="<%= categorys[2] %>" <%=  res.getCategory().equals(categorys[2]) ? "selected" : "" %>>피자/양식</option>
					<option value="<%= categorys[3] %>" <%=  res.getCategory().equals(categorys[3]) ? "selected" : "" %>>중국집</option>
					<option value="<%= categorys[4] %>" <%=  res.getCategory().equals(categorys[4]) ? "selected" : "" %>>한식</option>
					<option value="<%= categorys[5] %>" <%=  res.getCategory().equals(categorys[5]) ? "selected" : "" %>>일식/돈까스</option>
					<option value="<%= categorys[6] %>" <%=  res.getCategory().equals(categorys[6]) ? "selected" : "" %>>족발/보쌈</option>
					<option value="<%= categorys[7] %>" <%=  res.getCategory().equals(categorys[7]) ? "selected" : "" %>>분식</option>
					<option value="<%= categorys[8] %>" <%=  res.getCategory().equals(categorys[8]) ? "selected" : "" %>>카페/디저트</option>
					<option value="<%= categorys[9] %>" <%=  res.getCategory().equals(categorys[9]) ? "selected" : "" %>>편의점</option>
				</select>
				</td>
			</tr>
			<tr>
				<th class="resImg">이미지</th>
				<td>
				<input type="file" name="upImgFile" />
				<% if(res.getResImg().getImgResStatus()){ %>
					<p class="pImg" style="margin: 5px 0;">
						<img src="<%= request.getContextPath() %>/imges/image-icon.png" width="20px">
						<%= res.getResImg().getOriginalFilname() %>
						<input type="checkbox" name="delImgFile" id="delImgFile" value="<%= res.getResImg().getImgResNo() %>"/>
						<label for="delImgFile">이미지 삭제</label>
					</p>
				<% } %>
				</td>
			</tr>
			<tr>
				<th class="store">가게명</th>
				<td>
				<input type="text" name="resName" id="resName" placeholder="가게명"value="<%= res.getResName() %>" required />
				</td>
			</tr>
			<tr>
				<th>기존 주소</th>
				 <td class="addrBefore">	
					<input type="text" name="address" id="address" value="<%= res.getResAddress() %>"readonly><br>
				 </td>
			</tr>
			<tr>
				<th>주소</th>
				<td class="addr">	
					<input type="text" id="postcode" placeholder="우편번호"><br>
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address" id="address" placeholder="주소"><br>
					<input type="text" name="addressSub" id="addressSub" placeholder="상세주소"><br>
					<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목"><br>
				</td>
			</tr>
			<tr>
				<th class="min_sum">최소주문금액</th>
				<td>
				<input type="text" name="minPrice" id="minPrice" placeholder="0" value="<%= res.getMinPrice() %>"/>
				<input type="range" name="minPrice" id="minPrice" min="0" max="20000" step="100" value="<%= res.getMinPrice() %>"
					oninput="document.getElementById('mPval').innerHTML=this.value;"/><span id="mPval"><%= res.getMinPrice() %></span>원
				</td>
			</tr>
		</table>
		<div class="clickBtnDiv">
			<input type="button" class="clickBtn" value="수정" onclick="updateRes();" />
			<input type="button" class="clickBtn" value="삭제" onclick="deleteRes();" />
			<input type="button" class="clickBtn" value="취소" onclick="location.href='<%= request.getContextPath() %>/admin/resManage';" />
		</div>
	</div>
	</form>
	<form action="<%= request.getContextPath() %>/notice/noticeView?resId=<%= res.getResId() %>"
		id="noticeManageFrm"
		method="GET">
		<input type="hidden" name="resId" value="<%= res.getResId() %>" />
	</form>
	<form action="<%= request.getContextPath()%>/admin/resDelete"
		id="resDeleteFrm"
		method="POST">
		<input type="hidden" name="resId" value="<%= res.getResId() %>" />
	</form>
</section>
</div>

<script>

$("[name=upImgFile]").change(function(){
	if($(this).val() != ""){
		$("delImgFile").prop("checked", true)
					   .on("click", function(){
							return false; });
	} else {
		$("#delImgFile").prop("checked", false)
						.off("click");
	}
});	

function noticeManage(){
	$("#noticeManageFrm").submit();
};

function updateRes() {
	$("#resUpdateFrm").attr("action", "<%= request.getContextPath()%>/admin/resUpdate")
						 .submit();
};

 
function deleteRes(){
	var resId = "<%= res.getResId() %>";
	var resName = "<%= res.getResName() %>";
	
	if(confirm("[" + resId + "]." + resName + " 가게를 삭제하시겠습니까?")){
		$("#resDeleteFrm").submit();	
	}
};

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>