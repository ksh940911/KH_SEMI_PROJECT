<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<title>여기요 - rkrpcnrk</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRes.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<!-- 다음 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<section id=enroll-container>
	<!-- 여기요 로고 삽입 -->
	<div class="enroll-title">
		<img src="<%= request.getContextPath() %>/images/logo.png" alt="로고" width="150" height="50">
	</div>
	<form name="resEnrollFrm" action="<%= request.getContextPath() %>/admin/resEnroll" method="POST">
		<div id="contentBox">
			<table>
				<tr>
					<th>가게명</th>
					<td>
					<input type="text" placeholder="가게명을 입력하세요." name="resName" id="resName" required><br>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>	
					<select class="category" name="category">
						<option	value="프랜차이즈">프렌차이즈</option>
						<option	value="치킨">치킨</option>
						<option value="피자/양식">피자/양식</option>
						<option value="중국집">중국집</option>
						<option value="한식">한식</option>
						<option value="일식/돈까스">일식/돈까쓰</option>
						<option value="족발/보쌈">족발/보쌈</option>
						<option value="분식">분식</option>
						<option value="카페/디저트">카페/디저트</option>
						<option value="편의점">편의점</option>
					</select>
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
					<th>로고 이미지</th>
					<td>
						<input type="file" name="upImgFile" accept="image/*" />
					</td>
				</tr>
				<tr>
					<th>최소주문금액</th>
					<td>
						<input type="range" name="minPrice" id="minPrice" min="0" max="20000" step="100" value="0"
								oninput="document.getElementById('mPval').innerHTML=this.value;"/><span id="mPval"></span>원
					</td>
				</tr>
				<tr>
					<th>
						<input type="submit" value="등록" />
						<input type="button" value="취소" onclick="location.href='<%= request.getContextPath() %>/admin/resManage'">
					</th>
				</tr>
			</table>
		</div>
	</form>
</section>
<script>

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