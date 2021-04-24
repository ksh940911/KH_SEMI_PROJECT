<%@page import="restaurant.model.vo.ResImg"%>
<%@page import="restaurant.model.vo.Menu"%>
<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	ResImg resImg = new ResImg();
	Restaurant res = (Restaurant)request.getAttribute("res");
	System.out.println("resImg@ 1 ="+resImg);
	if(res.getResImg() == null){
		resImg.setImgResStatus(false);
		res.setResImg(resImg);
		System.out.println("resImg@ 2 ="+resImg);
	}
		
	String[] categorys ={
			"프랜차이즈", "치킨", "피자/양식", "중국집", "한식",
			"일식/돈까스", "족발/보쌈", "분식", "카페/디저트", "편의점"
	};
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRes.css" />
<!-- 다음 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="content-wrapper">
<section class=resView-container>
	<form class="resUpdateFrm" id="resUpdateFrm" method="POST" enctype="multipart/form-data">
		<div class="resView-title">
			<p>[<%= res.getResId() %>.<%= res.getResName() %>] 가게 정보 수정</p>
		</div>
		<table>
			<tr>
				<th>No</th>
				<td>
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
				<th>이미지</th>
				<td>
				<input type="file" name="upImgFile" />
				<% if(res.getResImg().getImgResStatus()){ %>
					<p style="margin: 5px 0;">
						<img src="<%= request.getContextPath() %>/imges/image-icon.png" width="20px">
						<%= res.getResImg().getOriginalFilname() %>
						<input type="checkbox" name="delImgFile" id="delImgFile" value="<%= res.getResImg().getImgResNo() %>"/>
						<label for="delImgFile">이미지 삭제</label>
					</p>
				<% } %>
				</td>
			</tr>
			<tr>
				<th>가게명</th>
				<td>
				<input type="text" name="resName" id="resName" placeholder="가게명"value="<%= res.getResName() %>" required />
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" id="postcode" placeholder="우편번호"><br>
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address" id="address" placeholder="주소"><br>
					<input type="text" name="addressSub" id="addressSub" placeholder="상세주소"><br>
					<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목"><br>
				</td>
			</tr>
			<tr>
				<th>최소주문금액</th>
				<td>

				<input type="text" name="minPrice" id="minPrice" placeholder="0" value="<%= res.getMinPrice() %>"/>
					<input type="range" name="minPrice" id="minPrice" min="0" max="20000" step="100" value="<%= res.getMinPrice() %>"
								oninput="document.getElementById('mPval').innerHTML=this.value;"/><span id="mPval"><%= res.getMinPrice() %></span>원

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
		// 파일 선택
		$("delImgFile").prop("checked", true)
					   .on("click", function(){
							return false; });
	} else {
		// 파일 선택 취소
		$("#delImgFile").prop("checked", false)
						.off("click");
	}
});	

function menuManage(){
	$("#menuManageFrm").submit();
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
             var extraAddr = ''; // 참고항목 변수

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
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 document.getElementById("extraAddress").value = extraAddr;
             
             } else {
                 document.getElementById("extraAddress").value = '';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById("postcode").value = data.zonecode;
             document.getElementById("address").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("addressSub").focus();
         }
     }).open();
 }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>