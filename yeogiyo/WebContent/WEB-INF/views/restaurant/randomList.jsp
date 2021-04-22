<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Restaurant cRes = (Restaurant)request.getAttribute("restaurant");
	
	
%>    
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	
	
	
	
	<div class="recommendList">
		
		<div class="restaurant-categori-menu" >
		
					<ul>
						<li class="menu search">
							<a href="" class="search-btn">검색</a>
						</li>
						<li class="menu m0">
							<span class="m0">오늘뭐먹지</span>
						</li>
						<li class="menu m1">
							<span class="m1">전체보기</span>
						</li>
						<li class="menu m2">
							<span class="m2">1인분 주문</span>
						</li>
						<li class="menu m3">
							<span class="m3">프랜차이즈</span>
						</li>
						<li class="menu m4">
							<span class="m4">치킨</span>
						</li>
						<li class="menu m5">
							<span class="m5">피자/양식</span>
						</li>
						<li class="menu m6">
							<span class="m6">중국집</span>
						</li>
						<li class="menu m7">
							<span class="m7">한식</span>
						</li>
						<li class="menu m8">
							<span class="m8">일식/돈까스</span>
						</li>
						<li class="menu m9">
							<span class="m9">족발/보쌈</span>
						</li>
						<li class="menu m10">
							<span class="m10">분식</span>
						</li>
						<li class="menu m11">
							<span class="m11">카페/디저트</span>
						</li>
						<li class="menu m12">
							<span class="m12">편의점</span>
						</li>
						
					
					</ul>
		
		
		</div>
		
		<div class="recommendlogo">
			<div class="logo">
				<img src="<%= request.getContextPath() %>/images/random_bottom_logo.png" alt="오늘뭐먹지로고" />
			</div>
		</div>
		
		
		<div class="recommend-title">
			<p class="recommend-food">오늘의 추천</p>
		</div>
		
		<div class="recommend-one">
			<div class="recommend-restaurant">
				<div class="recommend-item" onclick="location.href='<%= request.getContextPath() %>/restaurant/menuList.do?res_id=<%= cRes.getResId() %>';">
					<table>
						<tbody>
							<tr>
								<td id="td1">
									<div class="logo">
										<img src="<%= cRes.getLogoImg() %>" alt="가게사진" />
									</div>
								</td>
								<td id="td2">
									<div class="restaurant-name"><%= cRes.getResName() %></div>
									<div class="stars">
										<span class="ico-star">★ 4.8</span>
										<span class="review" id="user-review"> 리뷰 <%= cRes.getReviewCnt() %></span>
										<!-- <span class="review" id="ceo-review"> 사장님댓글 83</span> -->
									</div>
									<div class="info">
										<span class="payment-method">요기서 결제</span>
										<span class="min-price"> <%= cRes.getMinPrice() %>원 이상 배달</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<span class="delivery-time">45~55분</span>
				</div>
			</div>
		</div>
		
		
		
	</div>
	
	
<script>
	
/* $(".recommend-item").click(function(){
	
	
	
	
	
}); */


</script>	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
