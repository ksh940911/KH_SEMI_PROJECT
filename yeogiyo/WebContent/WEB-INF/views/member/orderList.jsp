<%@page import="member.model.vo.MemberOrderList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="order.model.service.OrderService"%>
<%@page import="order.model.vo.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/headerMemberView.jsp"%>
<%
	List<MemberOrderList> orderList = (List<MemberOrderList>)request.getAttribute("orderList");
	OrderService orderService = new OrderService();
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css" />
<section class="orderList-content">
	<div class="content-wrapper">
		<table class="orderList-table">
			<tr>
				<th>주문일자</th>
				<th>가게명</th>
				<th>주문 음식</th>
				<th>결제 방법</th>
				<th>결제 금액</th>
				<th>리뷰 쓰기</th>
			</tr>
			<%
				for(int i = 0; i < orderList.size(); i++) {
					MemberOrderList order = orderList.get(i);
			%>
			<tr>
				<td><%=order.getOrderDate()%></td>
				<td><%=order.getResName()%></td>
				<td>
				<%
					JSONParser parser = new JSONParser();
					Object obj = parser.parse(order.getOrderMenu());
					JSONArray jsonArray = (JSONArray)obj;
					
					JSONObject jsonObj = (JSONObject)jsonArray.get(0);
					
				%>
				<form action="<%= request.getContextPath() %>/review/reviewForm?resId=<%= order.getResId()%>" method="GET">
					<%= jsonObj.get("menuName") %>
					<% 
					int menuCnt = jsonArray.size();
					if(menuCnt - 1 > 0) {
					%>
					외 <%= menuCnt - 1 %>개
					<% } %>
					</td>
					<%
						String payWay = "";
						switch(order.getPaymentWay().charAt(0)){
							case 'C': payWay = "신용카드";  break;
							case 'K': payWay = "카카오페이"; break;
							case 'M': payWay = "현금"; break;
					}
					%>
					<td><%= payWay %></td>
					<td><%=order.getTotalPrice()%></td>
					<td>
					<input type="button" value="리뷰 쓰기" onclick="location.href='<%= request.getContextPath() %>/review/reviewForm?resId=<%= order.getResId()%>';"/>
					<input type="hidden" name="resId" id="resId" value="<%= order.getResId()%>"/>
					<input type="hidden" name="orderMenu" id="orderMenu" value="<%= jsonObj.get("menuName")%>"/>
					<input type="hidden" name="menuCnt" id="menuCnt" value="<%= menuCnt%>"/>
				</form>
				</td>
			</tr>
			<% } %>
		</table>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>