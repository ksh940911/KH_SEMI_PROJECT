<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Restaurant r = (Restaurant) request.getAttribute("restaurant");
    
    %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="wrapper">
        <form id="payFrm" action="<%=request.getContextPath() %>/order/order.do" method="post">
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
                        <input type="hidden" name="member_id" value="<%=loginMember.getMemberId() %>" />
                        <input type="hidden" name="res_id" value="<%= r.getResId() %>" />
                        <input type="text" class="panel-text" name="address" id="address" placeholder="<%= loginMember.getAddress() %>"><br>
                        <input type="text" class="panel-text" name="address-sub" id="address-sub" placeholder="<%= loginMember.getAddressSub() %>" required><br>
                        <label for="phone">휴대전화번호</label>
                        <input type="text" class="panel-text" name="phone" id="phone" placeholder="<%= loginMember.getPhone() %>" required>
                        <input type="hidden" id="payment_way" name="payment_way" value="" /> <%-- 결제수단 : 신용카드(C), 카카오페이(K), 현금(M) --%>
                        <input type="hidden" id="payment_place" name="payment_place"/><%-- 결제장소 : 요기서결제(N), 현장결제(F) --%>
                        <input type="hidden" id="order_menu" name="order_menu"/> <%-- 주문내역 세션에서 가져온 json 그대로 담기 --%>
                        <input type="hidden" id="total_price" name="total_price" />
                    </td>
                </tr>
                <tr>
                    <td class="panel-head">주문시 요청사항</td>
                </tr>
                <tr>
                    <td class="panel-body" style="text-align: right;">
                        <textarea class="form-control" name="order-comment" id="order-comment" cols="30" rows="3" maxlength="100" placeholder='코로나19 예방을 위해 비대면 배달 권장드립니다. 요기서 결제 선택 후, "문 앞 배달"을 요청사항에 남겨주세요.'></textarea>
                        <span>1</span><span>/100</span>
                    </td>
                </tr>
                <tr>
                    <td class="panel-head">결제수단 선택</td>
                </tr>
                <tr>
                    <td class="panel-body">
                        <p><strong>요기서 결제</strong> <span class="stxt">웹에서 미리 결제</span></p>
                        <input type="button" class="paybtn online" value="신용카드">
                        <button type="button" class="paybtn online" value="kakaopay"><img style="width: 40px; " src="<%= request.getContextPath() %>/images/payment_icon_yellow_large.png" alt="">카카오페이</button>
                        <br><br>
                        <p><strong>현장 결제</strong> <span class="stxt">음식받고 직접 결제</span></p>
                        <input type="button" class="paybtn offline" value="카드">
                        <input type="button" class="paybtn offline" value="현금">
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
                            <!-- 세션 배열수만큼 반복
                            <li class="cart-li">
                                <div class="left">메뉴명 x 0개</div>
                                <div class="right"><span>00000</span>원</div>
                            </li>
                            -->
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="td-total">
                        <div class="left">총 결제금액</div>
                        <div class="right"><span id="total-price">00000</span>원</div>
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
    	주문표 html
    */
    //세션에서 주문내용 가져오기
    var selectedMenuArr = JSON.parse(sessionStorage.getItem('selectedMenuArr'));
    
    var totalPrice = 0;
    $.each(selectedMenuArr, function(i, menu){
    	console.log(menu);
    	var $html = '<li class="cart-li"><div class="left">'+menu["menuName"]+'x'+menu["amount"]+'개</div><div class="right">'+menu["totalPrice"]+'원</div></li>';
    	$("#cart-ul").append($html);
    	totalPrice += menu["totalPrice"];
    	
    });
    
    /*
    총 결제금액 표시. hidden input에 담기
    */
    $("#total-price").text(totalPrice); //span Tag
    $("#total_price").val(totalPrice); //input Tag
    console.log($("#total_price").val());
    
    /*
    결제수단 버튼 클릭 시, 
    	색상 변경(활성화)
    	결제방법, 결제장소 hidden input에 담기
    */
	   var paymentWay = ""; //신용카드(C), kakaopay(K), 현금(M)
	   var paymentPlace = ""; //요기서결제(N), 현장결제(F)
    $(".paybtn").click(function(){
    
    	var $arr = $(".paybtn");
    	var thisvar = this;
    	
    	$arr.each(function(i, btn){
    		if(thisvar.value === btn.value){
    			//클릭한 버튼 색상 변경
    			$(thisvar).css("color", "#fa0050").css("border", "1px solid #fa0050");
    			
    			//클릭한 버튼의 결제방법 변수에 담기
    			switch(thisvar.value){
    				case '신용카드' : paymentWay = 'C'; break;
    				case '카드' : paymentWay = 'C'; break;
    				case 'kakaopay' : paymentWay = 'K'; break;
    				case '현금' : paymentWay = 'M'; break;
    			}
    			
    			//클릭한 버튼의 결제장소 변수에 담기
    			var classList = thisvar.classList;
    			$(classList).each(function(i, elem){
    				if(elem === 'online'){
    					paymentPlace = 'N';
    				}
    				else if(elem === 'offline'){
    					paymentPlace = 'F';
    				}
    			});

    		}
    		else{
    			//클릭 안한 버튼 원래색으로 변경
    			$(btn).css("color", "black").css("border", "1px solid #CCCCCC");
    		}
    	});
    	
    	//hidden input에 paymentWay, paymentPlace 담기
    	var $paymentWay = $("#payment_way");
    	$paymentWay.val(paymentWay);
    	
    	var $paymentPlace = $("#payment_place");
    	$paymentPlace.val(paymentPlace);
    	
    });
    
    /*
  	 '결제하기' 버튼 클릭 시
    */
    $("#btn-pay").click(function(){
    	
    	if(paymentWay == "" || paymentPlace == ""){
    		alert("결제 수단을 고르세요.");
    	}else{
    		//hidden input에 메뉴 json값 담기
        	var json = sessionStorage.getItem("selectedMenuArr");
        	$("#order_menu").val(json);
        	
        	//submit
        	$("#payFrm").submit();
		
// 			$.ajax({
<%-- 				url : '<%=request.getContextPath() %>/order/order.do', --%>
// 				dataType: 'json',
// 				success: function(data){
// 					console.log(data);
// 					var box = data.next_redirect_pc_url;
// 					window.open(box);
// 				},
// 				error: function(xhr, status, err){
// 					console.log(xhr, status, err)
// 				}
// 			});


    	}
    	
    	
    	
    });
    
    
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>