<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Restaurant r = (Restaurant) request.getAttribute("restaurant");
    
    %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="wrapper">
        <form id="payFrm" action="" method="post">
            <table id="tb-order">
                <tr>
                    <td class="sub-title">결제하기</td>
                </tr>
                <tr>
                    <td class="panel-head">배달정보</td>
                </tr>
                <tr>
                    <td class="panel-body" style="text-align: right;">
                        <label for="address">주소</label>
                        <input type="text" class="panel-text" name="address" id="address" placeholder="<%= loginMember.getAddress() %>"><br>
                        <input type="text" class="panel-text" name="address-sub" id="address-sub" placeholder="<%= loginMember.getAddressSub() %>" required><br>
                        <label for="phone">휴대전화번호</label>
                        <input type="text" class="panel-text" name="phone" id="phone" placeholder="<%= loginMember.getPhone() %>" required>
                    </td>
                </tr>
                <tr>
                    <td class="panel-head">주문시 요청사항</td>
                </tr>
                <tr>
                    <td class="panel-body" style="text-align: right;">
                        <textarea class="form-control" name="comment" id="comment" cols="30" rows="3" maxlength="100" placeholder='코로나19 예방을 위해 비대면 배달 권장드립니다. 요기서 결제 선택 후, "문 앞 배달"을 요청사항에 남겨주세요.'></textarea>
                        <span>1</span><span>/100</span>
                    </td>
                </tr>
                <tr>
                    <td class="panel-head">결제수단 선택</td>
                </tr>
                <tr>
                    <td class="panel-body">
                        <p><strong>요기서 결제</strong> <span class="stxt">웹에서 미리 결제</span></p>
                        <input type="button" class="paybtn online" id="credit-online" value="신용카드">
                        <button type="button" class="paybtn online"><img style="width: 40px; " src="<%= request.getContextPath() %>/images/payment_icon_yellow_large.png" alt="">카카오페이</button>
                        <br>
                        <p><strong>현장 결제</strong> <span class="stxt">음식받고 직접 결제</span></p>
                        <input type="button" class="paybtn offline" id="credit-offline" value="신용카드">
                        <input type="button" class="paybtn offline" id="cash" value="현금">
                    </td>
                </tr>

            </table>

            <table id="tb-order-cart">
                <tr>
                    <td class="panel-head">주문내역</td>
                </tr>
                <tr>
                    <td id="cart-res-name"><%= r.getResName() %></td>
                </tr>
                <tr>
                    <td>
                        <ul id="cart-ul">
                            <!-- 세션 배열수만큼 반복// -->
                            <li class="cart-li">
                                <div class="left">메뉴명 x 0개</div>
                                <div class="right"><span>00000</span>원</div>
                            </li>
                            <!-- //반복종료 -->
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="td-total">
                        <div class="left">총 결제금액</div>
                        <div class="right"><span>00000</span>원</div>
                    </td>
                </tr>
                <tr>
                    <td class="td-notice">
                        <span class="notice">이용약관, 개인정보 수집 및 이용, 개인정보 제3자 제공 , 전자금융거래 이용약관, 만 14세 이상 이용자 내용 확인하였으며 결제에 동의합니다.</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" id="btn-pay" value="결제하기">
                    </td>
                </tr>
            </table>


        </form>
    </div>
    <script>
    /*
     <ul id="cart-ul">
	    <!-- 세션 배열수만큼 반복// -->
	    <li class="cart-li">
	        <div class="left">메뉴명 x 0개</div>
	        <div class="right"><span>00000</span>원</div>
	    </li>
	    <!-- //반복종료 -->
    */
    
    /*
    	주문표 html
    */
    //세션에서 주문내용 가져오기
    var selectedMenuArr = JSON.parse(sessionStorage.getItem('selectedMenuArr'));
    
    $.each(selectedMenuArr, function(i, menu){
    	
    });
    
    
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>