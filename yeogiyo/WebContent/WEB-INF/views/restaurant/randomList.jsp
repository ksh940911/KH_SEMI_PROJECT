<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Restaurant cRes = (Restaurant)request.getAttribute("restaurant");
	
	
%>    

    
<%@ include file="/WEB-INF/views/common/headerCategory.jsp" %>
	
	
    		
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
									<% if(cRes.getResImg() != null && cRes.getResImg().getImgResStatus()) { %>
s
									<% } else { %>
										<img src="<%= request.getContextPath() %>/images/logo.png" class="resList-img" style="width:50px;"/>	
									<% } %>
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
	

</script>	
	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
