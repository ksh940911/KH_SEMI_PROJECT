<%@page import="restaurant.model.vo.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Restaurant r = (Restaurant) request.getAttribute("restaurant");
    
    %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="wrapper">
        <form id="payFrm" action="<%=request.getContextPath() %>/order/order.do" method="post">
            <table class="tb-order" id="tb-order">
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
                        <input type="text" class="panel-text" name="address" id="address" value="<%= loginMember.getAddress() %>"><br>
                        <input type="text" class="panel-text" name="address-sub" id="address-sub" value="<%= loginMember.getAddressSub() %>" required><br>
                        <label for="phone">휴대전화번호</label>
                        <input type="text" class="panel-text" name="phone" id="phone" value="<%= loginMember.getPhone() %>" required>
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

            <table class="tb-order" id="tb-order-cart">
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
    <!-- 결제모듈 아임포트 jQuery 라이브러리 -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
    <script>
    
    //아임포트 초기화
	var IMP = window.IMP;
	IMP.init('imp32692513'); //가맹점 식별코드
    
    /*
    	주문표 html
    */
    //세션에서 주문내용 가져오기
    var selectedMenuArr = JSON.parse(sessionStorage.getItem('selectedMenuArr'));
    
    var totalPrice = 0;
    $.each(selectedMenuArr, function(i, menu){
    	console.log(menu);
    	var $html = '<li class="cart-li"><div class="left">'+menu["menuName"]+'x'+menu["amount"]+'개</div><div class="right">'+(Number(menu["totalPrice"]) * Number(menu["amount"]))+'원</div></li>';
    	$("#cart-ul").append($html);
    	totalPrice += (Number(menu["totalPrice"]) * Number(menu["amount"]));
    	
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
    	//전역변수
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
    	
    	<% if(loginMember == null){ %>
    		alert("로그인이 필요합니다.");
    	<% } else { %>
    	
    	if(confirm("결제하시겠습니까?")){
    		
    		

        	if(paymentWay == "" || paymentPlace == ""){
        		alert("결제 수단을 고르세요.");
        	}else{
       			//온라인 신용카드 결제일 경우
        		if(paymentWay === 'C' && paymentPlace === 'N'){
        			//아임포트 결제 api작동
        			
        			var name = ($(".cart-li:eq(1)").find(".left").text()) + " 외"; //주문명
        			var amount = Number($("#total-price").text()); //결제 금액
        			
        			
        			IMP.request_pay({
        			    pg : 'inicis', // version 1.1.0부터 지원.
        			    pay_method : 'card',
        			    merchant_uid : 'merchant_' + new Date().getTime(),
        			    name : name,
        			   //amount : amount
        			   amount : 10 //테스트용 10원 설정
        			}, function(rsp) {
        				 if ( rsp.success ) {
        				    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        				    	jQuery.ajax({
        				    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
        				    		type: 'POST',
        				    		dataType: 'json',
        				    		data: {
        					    		imp_uid : rsp.imp_uid
        					    		//기타 필요한 데이터가 있으면 추가 전달
        				    		}
        				    	}).done(function(data) {
        				    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
        				    		if ( everythings_fine ) {
        				    			var msg = '결제가 완료되었습니다.';
        				    			msg += '\n고유ID : ' + rsp.imp_uid;
        				    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
        				    			msg += '\결제 금액 : ' + rsp.paid_amount;
        				    			msg += '카드 승인번호 : ' + rsp.apply_num;

        				    			alert(msg);
        				    		} else {
        				    			//[3] 아직 제대로 결제가 되지 않았습니다.
        				    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
        				    		}
        				    	});
        				    	//성공 시 이동할 페이지
        				    <%-- 	location.href="<%= request.getContextPath() %>/order/approval.do"; --%>
        				    	
        				    	//hidden input에 메뉴 json값 담기
        		            	var json = sessionStorage.getItem("selectedMenuArr");
        		            	$("#order_menu").val(json);
        				    	
        		            	
        		            	//submit
        		            	$("#payFrm").submit(); //OrderServlet doPost()로 이동
        				    	
        				    } else {
        				        var msg = '결제에 실패하였습니다.';
        				        msg += '에러내용 : ' + rsp.error_msg;
        				        //실패시 이동할 페이지
        		                //location.href="<%=request.getContextPath()%>/order/payFail";
        				        alert(msg);
        				    }
        			});
        			
        		
        			
        		}
        		else{
        			//신용카드 결제가 아닐 경우
        			
            		//hidden input에 메뉴 json값 담기
                	var json = sessionStorage.getItem("selectedMenuArr");
                	$("#order_menu").val(json);
                	
                	console.log($("#order_menu").val());
                	
                	//submit
                	$("#payFrm").submit();
        		}
    	}

		<% } %>


    	}
    	
    	
    });
    
    
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>