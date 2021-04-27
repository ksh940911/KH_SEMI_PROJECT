<%@page import="order.model.vo.SelectedMenu"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="order.model.service.OrderService"%>
<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="order.model.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Order order = (Order)session.getAttribute("order");
	Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
	System.out.println("order@approval.jsp = " + order);
	System.out.println("restaurant @ approval.jsp = " + restaurant);
	
	StringBuilder sb = new StringBuilder();
	switch(order.getPaymentWay()){
		case OrderService.CREDIT_CARD : sb.append("신용카드");  break;
		case OrderService.KAKAO_PAY : sb.append("카카오페이"); break;
		case OrderService.CASH : sb.append("현금"); break;
	}
	String paymentWay = sb.toString();
	
	sb.delete(0, sb.length());
	switch(order.getPaymentPlace()){
		case OrderService.ONLINE : sb.append("요기서 결제"); break;
		case OrderService.OFFLINE : sb.append("현장 결제"); break;
	}
	String paymentPlace = sb.toString();
	
	String jsonOrder = order.getOrderMenu();
	Gson gson = new Gson();
	SelectedMenu[] smArr = gson.fromJson(jsonOrder, SelectedMenu[].class);

	
%>
	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="wrappers">
        <table class="tb-approval">
            <tr>
                <td class="sub-title">주문완료</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <h2 style="color:  #fa0050; margin: 15px 0 5px 0">주문 감사합니다</h2>
                    <hr>
                    <p>주문 요청이 완료되었습니다.</p>
                </td>
            </tr>
            <tr>
                <td class="panel-head">배달정보</td>
            </tr>
            <tr>
                <td class="panel-body">
                    <table class="sub-table">
                        <tr>
                            <td class="sub-table-header">주문식당</td>
                            <td class="sub-table-body"><%= restaurant.getResName() %></td>
                        </tr>
                        <tr>
                            <td class="sub-table-header">결제수단</td>
                            <td class="sub-table-body"><span class="sp-payment-place"><%= paymentPlace %></span> - <span class="sp-payment-way"><%= paymentWay %></span></td>
                        </tr>
                        <tr>
                            <td class="sub-table-header">주문자 정보</td>
                            <td class="sub-table-body"><span class="sp-member-name"><%= loginMember.getMemberName() %></span> / <span class="sp-address"><%= order.getAddress() %></span> <span class="sp-address-sub"><%= order.getAddressSub() %></span> / <span class="sp-phone"><%= order.getPhone() %></span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="panel-head">주문내역</td>
            </tr>
            <tr>
                <td class="panel-body">
                    <table class="sub-table">
                    <%  for(SelectedMenu sm : smArr){ %>
                 	    <tr>
                            <td class="sub-tb-menu-header"><%= sm.getMenuName() %> x <%= sm.getAmount() %>개</td>
                            <td class="sub-tb-menu-body"><%= (sm.getPrice() * sm.getAmount()) %>원</td>
                        </tr>
                    
                    <% } %>
                    
                        <!-- 반복 
                        <tr>
                            <td class="sub-tb-menu-header">김치볶음밥 x 1개</td>
                            <td class="sub-tb-menu-body">7000원</td>
                        </tr>
                        <tr>
                            <td class="sub-tb-menu-header">계란말이 x 2개</td>
                            <td class="sub-tb-menu-body"> 10000원</td>
                        </tr>
                         -->
                        <tr id="hr"> <!-- $(A).before(B) / A의 형제요소로 B를 직전에 추가 -->
                            <td colspan="2"><hr style="margin: 3px 0;"></td>
                        </tr>
                        <tr class="tr-total">
                            <td class="sub-tb-menu-header">총 결제 금액</td>
                            <td class="sub-tb-menu-body"><%= order.getTotalPrice() %>원</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <form action="<%= request.getContextPath() %>/member/orderList"> <%-- 주문내역페이지 서블릿 url --%>
        <input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
     	 <input type="submit" id="btn-ok" value="주문 내역 확인" >
        </form>
    </div>
    
    <script>
    //주문표 삭제
    sessionStorage.removeItem('<%= loginMember.getMemberId() %>');
    </script>
    
    <%
	//세션 속성 삭제
	session.removeAttribute("order");
	session.removeAttribute("restaurant");
    %>
   
<%@ include file="/WEB-INF/views/common/footer.jsp" %>