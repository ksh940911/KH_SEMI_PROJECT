<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="restaurant.model.vo.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<Menu> list = (List<Menu>)request.getAttribute("list");
    Restaurant r = (Restaurant) request.getAttribute("restaurant");
    %>
<%@ include file="/WEB-INF/views/common/headerCategory.jsp" %>
    <div class="menu-wrapper">
    <table class="tb-menuList" id="restaurant-info">
        <tr>
            <td colspan="2" id="res_name"><b><%= r.getResName() %></b></td>
        </tr>
        <tr>
			<td id="logo-img">
			<% if(r.getResImg() != null && r.getResImg().getImgResStatus()) { %>
				<img src="<%= request.getContextPath() %>/upload/res/<%= r.getResImg().getRenamedFilename() %>" class="resList-img"/>	
			<% } else { %>
				<img src="<%= request.getContextPath() %>/images/logo.png" class="resList-img" style="width:50px;"/>	
			<% } %>
			</td>
            <td id="res-info-sub">
                <span class="star-fill" id="star1">★</span>
                <span class="star-fill" id="star2">★</span>
                <span class="star-fill" id="star3">★</span>
                <span class="star-fill" id="star4">★</span>
                <span class="star-empty" id="star5">★</span>
                <input type="button" id="btn-review" value="리뷰 보기">
                <input type="button" id="btn-notice" value="사장님 공지">
                <form id="frm-review" action="">
                    <input type="hidden" name="resId" value="<%= r.getResId() %>">
                </form>
                <form id="frm-notice" action="">
                    <input type="hidden" name="resId" value="<%= r.getResId() %>">

                </form>
                <br>
                <span style="color: #999">결제</span> 신용카드, 현금<br>
                배달시간 00분<br>
            </td>
        </tr>
    </table>

    <div>
        <table class="tb-menuList" id="cart">
            <tr>
                <td id="cart-title" style="padding: 0 10px">주문표  <input type="button" id="cart-del-all" value="전체삭제" style="float:right; cursor:pointer;"></td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li class="cart-empty">
                            주문표에 담긴 메뉴가 없습니다.
                        </li>
                        <!--주문표에 추가한 경우//-->
                        <!--
                        <li class="li-order">
                            <div>주문 메뉴 이름</div>
                            <div class="left">
                                <input type="button" class="btn-order-del" value="X">
                                <span class="span-order-price">1000</span>원
                            </div>
                            <div class="right">
                                <input type="button" value="-">
                                <span class="amnt">10</span>
                                <input type="button" value="+">
                            </div>
                        </li>
                        -->
                        <!--//주문표에 추가한 경우-->
                    </ul>
                </td>
            </tr>
            <tr>
                <td id="td-total">합계 금액 : <span id="total-price">0</span>원</td>
            </tr>
            <tr>
                <td><input type="button" id="btn-order" class="btn-order" value="주문하기" onclick=""></td>
                <form id="orderFrm" action="<%= request.getContextPath() %>/order/order.do">
              	  <input type="hidden" name="resId"  value="<%= r.getResId() %>" />
                </form>
            </tr>
        </table>
    </div>
<br><br><br><br><br><br><br>
    <br>
    <h3>메뉴 (<span id="menu_cnt"><%=list.size() %></span>) </h3>
    <div class="container">
        <!-- 포토메뉴. 6개 노출. 사진 없으면 div 아예 안보이게 분기처리 -->
        <div id="menu-horizontal">
            <div id="slide">
            <% for(int i = 0; i < list.size(); i++){ %>
                <div class="hori-menu btn-layer-popup">
                	<div class="menu-id" style="display : none;"><%= list.get(i).getMenuId() %></div>
                <% if(list.get(i).getMenuImg()!= null){ %>
                    <div class="hori-photo"><img src="<%= list.get(i).getMenuImg() %>" alt=""></div>
                    <% } else{ %>
                    <div class="hori-photo"><img src="<%= request.getContextPath() %>/images/defaultMenu.png" alt=""></div>
                    <% } %>
                    <div class="hori-menu-name"><%= list.get(i).getMenuName() %></div>
                    <div class="hori-price"><span><%= list.get(i).getPrice() %></span>원</div>
                </div>
                <% if(i > 4) break; %>
                <% } %>
            </div>
        </div>
        
        <!-- ul : 메뉴 카테고리만큼 반복생성 -->
        
        <% 
        //카테고리를 Set에 담아 중복 제거
        Set<String> categorySet = new HashSet<>();
        for(int i = 0; i < list.size(); i++){
        	categorySet.add(list.get(i).getMenuCategory());
        }
        
       //	List<String> categoryList = new ArrayList<>(categorySet);
        
        //카테고리만큼 토글메뉴 반복 생성
        for(String s : categorySet){
        //for(int i = 0; i < categoryList.size(); i++){
        	
        %>
        <div class="menu-category-wrapper">
            <div class="menu-category"><span><%= s %></span><!--<span class="arrow" style="float: right;">▼</span>--></div>
            <ul class="ul-menu-list"  id="<%= s %>">
                <!-- 메뉴 카테고리 누르면 나타나고/사라지는 메뉴. 카테고리별 메뉴만큼 반복생성 -->
               <% for(Menu m : list){
            	  
            	   if(s.equals(m.getMenuCategory())){
            	   %>
                <li class="li-menu btn-layer-popup">
                    <table class="tb-menuList">
                        <tr>
                            <td class="td-menu-text">
                           		 <div class="menu-id" style="display : none;"><%= m.getMenuId() %></div>
                                <div class="menu-name"><%= m.getMenuName() %></div>
                                <div class="description"><%= m.getDescription() != null? m.getDescription() : "" %></div>
                                <br>
                                <div class="price"><span><%= m.getPrice() %></span>원</div>
                            </td>
                            <% if(m.getMenuImg() != null){ %>
                            <td class="td-menu-img"><img src="<%= m.getMenuImg() %>" alt=""></td>
                        	<% } else { %>
                        	<td class="td-menu-img"><img src="<%= request.getContextPath() %>/images/defaultMenu.png" alt=""></td>
                        	<% } %>
                        </tr>
                    </table>
                </li>
                <!--  하얀메뉴 반복종료 -->
	        <% 
	        } // if(s.equals(m.getMenuCategory()) 종료  %>
	     <%  } //카테고리변 메뉴리스트 반복 종료  %>
            </ul>
    	</div>
    <%  } //카테고리 토글메뉴 반복 종료 %>
 </div>
    <!--  .container 끝  -->

 <!-- 레이어 팝업. ajax로 json받아서 요소 생성-->
 <div class="dim-layer">
 	<!--
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="detail-header">
            <div class="title">메뉴상세</div>
            <input type="button" class="btn-layerClose" value="X">
        </div>
        <div class="pop-container">
            <div class="pop-conts">
            
               
               <div class="detail-image"><img src="https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%89%B4%EC%9A%95%EB%B2%84%EA%B1%B0/2021-02-24/%EC%A0%9C%ED%9C%B4FR_20210223_%EB%89%B4%EC%9A%95%EB%B2%84%EA%B1%B0_%EB%89%B4%EC%9A%95%EB%B2%84%EA%B1%B0_1080x640.jpg" alt=""></div>
                <div class="detail-text">
                    <div class="detail-menu-name">메뉴명</div>
                    <div class="menu-description">설명설명</div>
                </div>
                <div class="detail-price">
                    <strong>가격</strong>
                    <div class="detail-price-price"><span class="price">4500</span>원</div>
                  </div>
                  <div class="quantity-control">
                    <strong>수량</strong>
                    <div>
                      <input type="button" value="-">
                      <span>1</span>
                      <input type="button" value="+">
                    </div>
                  </div>
                  <div class="detail-total-wrap">
                    <strong>총 주문금액</strong>
                    <div class="total"><strong><span>4500</span>원</strong></div>
                  </div>
                
                
               
            </div>
            <div class="detail-btn-wrap">
                <button class="btn-add-cart" onclick="add_to_cart();">주문표에 추가</button>
                <button class="btn-order" onclick="checkout()">주문하기</button>
                <div class="message ng-binding"></div>
              </div>
        </div>
    </div>
    -->
</div>
<!-- 레이어 팝업 끝 -->

 <script>
 
	var resIdJAVA = <%= r.getResId() %>;
	<% if(loginMember != null){ %>
	var memberIdJAVA = '<%= loginMember.getMemberId() %>';
 	<% } else { %>
 	var memberIdJAVA = "";
 	<% } %>
   
   
     /*
     btn-review클릭 시 가게 번호 담아서 리뷰 페이지로 이동
     */
     $("#btn-review").click(function(){
    	 
    	 console.log("review!");
    	 console.log("resId@menulist="+resIdJAVA)
	     var servletUrl = "<%= request.getContextPath() %>/review/reviewList"; //<-여기에 이동할 서블릿 url작성
	     var $frm = $("#frm-review");
	     //폼에 hidden input으로 가게아이디 담아놨어요. 서블릿에서 파라미터명 "res_id"로 꺼내세요 
	    	 
     	$frm.attr("action", servletUrl).submit();
     

     });
     
     /*
     btn-notice클릭 시 가게 번호 담아서 사장님 공지 페이지로 이동
     */
     $("#btn-notice").click(function(){
    	 
     
		 console.log("notice!");
    	 
	     var servletUrl = "<%= request.getContextPath() %>/notice/noticeView"; //<-여기에 이동할 서블릿 url작성
	     var $frm = $("#frm-notice");
	     //폼에 hidden input으로 가게아이디 담아놨어요. 서블릿에서 파라미터명 "res_id"로 꺼내세요 
	    	 
     	$frm.attr("action", servletUrl).submit();



         
     });
    
     
     
	/*
	메뉴 선택 시 레이어 팝업창 띄우기---------------------------------
	*/
     $('.btn-layer-popup').click(function(){
    	console.log("popup");
    	var $clickedMenuId = $(this).find(".menu-id").text();
    	console.log("$clickedMenuId = " + $clickedMenuId);
    	
    	//ajax로 menu id 보내고 메뉴객체 json받기 
    	$.ajax({
    		url: "<%= request.getContextPath() %>/restaurant/menu.do",
    		data : {
    			menuId : $clickedMenuId	
    		},
    		success : function(data){
    			//console.log(data);
    			
    			//json data반영한 팝업레이어 html 삽입
    			if(data.menuImg != null){
    			var $popupHtml = $('<div class="dimBg"></div><div id="layer2"class="pop-layer"><div class="detail-header"><div class="title">메뉴상세</div><input type="button"class="btn-layerClose"value="X"></div><div class="pop-container"><div class="pop-conts"><div class="detail-image"><img src="' + data.menuImg + '"alt=""></div><div class="detail-menu-id" style="display:none;">' + data.menuId + '</div><div class="detail-text"><div class="detail-menu-name">' + data.menuName + '</div><div class="menu-description">' + data.description + '</div></div><div class="detail-price"><strong>가격</strong><div class="detail-price-price"><span class="price" id="popup-price">' + data.price + '</span>원</div></div><div class="quantity-control"><strong>수량</strong><div><input type="button" id="popup-btn-minus" value="-"><span id="popup-amount">1</span><input type="button" id="popup-btn-plus" value="+"></div></div><div class="detail-total-wrap"><strong>총주문금액</strong><div class="total"><strong><span id="popup-total-price">4500</span>원</strong></div></div></div><div class="detail-btn-wrap"><button class="btn-add-cart"onclick="addCartById();">주문표에추가</button><button class="btn-order"onclick="checkout();">주문하기</button><div class="message ng-binding"></div></div></div></div>');
    				
    			} else{
    			var $popupHtml = $('<div class="dimBg"></div><div id="layer2"class="pop-layer"><div class="detail-header"><div class="title">메뉴상세</div><input type="button"class="btn-layerClose"value="X"></div><div class="pop-container"><div class="pop-conts"><div class="detail-image"><img src="<%= request.getContextPath() %>/images/defaultMenu.png" alt=""></div><div class="detail-menu-id" style="display:none;">' + data.menuId + '</div><div class="detail-text"><div class="detail-menu-name">' + data.menuName + '</div><div class="menu-description">' + data.description + '</div></div><div class="detail-price"><strong>가격</strong><div class="detail-price-price"><span class="price" id="popup-price">' + data.price + '</span>원</div></div><div class="quantity-control"><strong>수량</strong><div><input type="button" id="popup-btn-minus" value="-"><span id="popup-amount">1</span><input type="button" id="popup-btn-plus" value="+"></div></div><div class="detail-total-wrap"><strong>총주문금액</strong><div class="total"><strong><span id="popup-total-price">4500</span>원</strong></div></div></div><div class="detail-btn-wrap"><button class="btn-add-cart"onclick="addCartById();">주문표에추가</button><button class="btn-order"onclick="checkout()">주문하기</button><div class="message ng-binding"></div></div></div></div>');
    				
    			}
    			
    			$(".dim-layer").html($popupHtml);
    			
    			//팝업 컨트롤
		        layer_popup($("#layer2"));
    			
    		},
    		error: function(xhr, status, err){
    			console.log(xhr, status, err)
    		}
    	
    	});
    	
    	  //this로 메뉴번호 받아서 layer_popup()에 같이 보내는게 좋을..까?
  	  });
     
    function layer_popup(el){
        $(".dim-layer").show();
        var $el = $(el);    //레이어의 id를 $el 변수에 저장

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }
        
        //수량 늘리기 줄이기
		var $btnMinus = $("#popup-btn-minus");
        var $btnPlus = $("#popup-btn-plus");
        var $amountSpan = $("#popup-amount");
        var originalPriceValue = $("#popup-price").text();
        var $totalPriceSpan = $("#popup-total-price");
        
        //console.log($btnMinus, $btnPlus, $amountSpan, originalPriceValue, $totalPriceSpan);
        btn_plus_minus($btnMinus, $btnPlus, $amountSpan, originalPriceValue, $totalPriceSpan);
            
        
        //esc 눌러 닫기
        $(document).keydown(function(event) {
            if ( event.keyCode == 27 || event.which == 27 ) {
                dim_layer_hide();
            }
        });

        //버튼 눌러 닫기
        $el.find('.btn-layerClose').click(function(){
            dim_layer_hide();
        });
        
        //dim영역 눌러 닫기
        $('.dimBg').click(function(){
            dim_layer_hide();
        });
    }
    
    /*
     - + 버튼으로 수량 조절하기
    */
    function btn_plus_minus($btnMinus, $btnPlus, $amountSpan, originalPriceValue, $totalPriceSpan){
    	//console.log("function");
    	
    	//total price 초기화
    	$totalPriceSpan.text(originalPriceValue);
    	
    	//amount 초기화 
    	$amountSpan.text(1);
    	
    	
    	var i = 1;
    	var totalPriceValue = Number($totalPriceSpan.text());
    	$btnPlus.click(function(){
    		i++;
    		
    		$amountSpan.text(i);
 
    		totalPriceValue = Number((originalPriceValue * i));
    		$totalPriceSpan.text(totalPriceValue);
    		
    	
    	});
    	
    	$btnMinus.click(function(){
    		if(i <= 1){
    			return false;
    		}
    		else{
    			i--;
    		}
        		$amountSpan.text(i);
        		
        		totalPriceValue = Number((originalPriceValue * i));
        		$totalPriceSpan.text(totalPriceValue);

    	});
    	
    	
    }

    function dim_layer_hide(){
        
        //팝업창 숨기기
        $(".dim-layer").hide();
        
    }
    //---------------------------------------
    
   function addCartById(){
    	
    	//1. 로그인 여부 확인
    	<% if(loginMember != null){ %>
    	
    	var memberId = memberIdJAVA;
    	var resId = resIdJAVA;
    	var $popupLayer = $("#layer2");
    	
		//2. 회원 아이디와 일치하는 세션 불러오기
		var selectedMenuArr = JSON.parse(sessionStorage.getItem(memberId));
		
		//3. 회원 아이디와 일치하는 세션 있을 경우
		if(selectedMenuArr != null){
			
			//4. 새로 담으려는 가게와 일치할 경우
			if(Number(selectedMenuArr[0]["resId"]) === resId){
				console.log('가게 일치');
				//var selectedMenu = null; //obj init
				var isContained = false;
				$.each(selectedMenuArr, function(i, menu){
					//5. 메뉴가 일치하는 경우 ->
					if(menu["menuId"] === Number($popupLayer.find(".detail-menu-id").text()) ){
						console.log('메뉴 일치');
						//객체의 수량/총금액 속성 수정
						selectedMenuArr[i]['amount'] += Number($popupLayer.find("#popup-amount").text());
						selectedMenuArr[i]['totalPrice'] = Number(selectedMenuArr[i]["price"]) * Number(selectedMenuArr[i]['amount']);
						isContained = true; //다음 조건문이 실행되지 않도록 true처리
						return false;
						//selectedMenu = menu;
					}
					
				});
				//5-1. 메뉴가 일치하지 않는 경우
				if(!isContained){
					console.log('메뉴 불일치');
					//객체를 배열에 추가
					var selectedMenu = createNewObj();
					selectedMenuArr.push(selectedMenu);
				}
				
			}else{
				
				if(confirm('다른 음식점에서 이미 담은 메뉴가 있습니다. 담긴 메뉴를 취소하고 새로운 음식점에서 메뉴를 담을까요?')){
					//기존 가게 세션 삭제
					sessionStorage.removeItem(memberId);
					
					//새로운 객체배열 생성, JSON.stringify
					selectedMenuArr = createNewArr();
				}
			}
		}else{
			//3-1. 회원 아이디와 일치하는 세션이 없을 경우
		
			//배열 초기화
			selectedMenuArr = createNewArr();
		}
		var jsonSelectedMenuArr = JSON.stringify(selectedMenuArr);
		sessionStorage.setItem(memberIdJAVA, jsonSelectedMenuArr);	
		
    	showCart();
    	dim_layer_hide();
    	
    	<% } else { %>
    	alert('로그인이 필요합니다.');
    	
    	<% } %>
    	
    }
    
	
    function createNewArr(){
    	var selectedMenuArr = [];
    	
    	var selectedMenu = createNewObj();
    	
    	selectedMenuArr.push(selectedMenu);
    	
    	return selectedMenuArr;
    	
    }
    
    function createNewObj(){
    	var $popupLayer = $("#layer2");
    	var selectedMenu = {
    			resId : resIdJAVA,
       			menuId : Number($popupLayer.find(".detail-menu-id").text()),
       			menuName : $popupLayer.find(".detail-menu-name").text(),
       			amount : Number($popupLayer.find("#popup-amount").text()),
       			price : Number($popupLayer.find("#popup-price").text()),
       			totalPrice : Number($popupLayer.find("#popup-total-price").text())
        	};
    	return selectedMenu;
    }
	
	function setArrayToSession(selectedMenuArr){
		  //4. selectedMenuArr배열을 JSON으로 변환
		var jsonSelectedMenuArr = JSON.stringify(selectedMenuArr);
		
		//3. sessionStorage에 저장
		sessionStorage.setItem(memberIdJAVA, jsonSelectedMenuArr);
		
		refreshCart();
	}
    
    
    
    $(document).ready(function(){
    
    	//주문표에 담은 채로 다른페이지를 이동했을 때 세션이 비어있지 않다면 주문표를 표시
    	showCart();
    	
    });
    
    
    

    /*
    주문표 추가하기
    */
    function showCart(){
    	//1. selectedMenuArr 객체배열 가져오기
    	var memberId = memberIdJAVA;
//      	var selectedMenuArr = JSON.parse(sessionStorage.getItem("selectedMenuArr"));
     	var selectedMenuArr = JSON.parse(sessionStorage.getItem(memberId));
		console.log(selectedMenuArr);
		
		
		//2. 세션이 비어있지 않다면 
		if(selectedMenuArr != null){ 
			
			console.log("세션 비어있지 않음.");
			//2-1. html로 표시. ul에 기존 li안보이게 하고, 새로운 li 추가하기
	    	
	    	//주문표 html 초기화 : 주문표에 추가할 때마다 삭제하고 다시 배열순회하면서 html추가ㅠㅠ 뭔가 삽질같다만...
	    	var $ul = $("#cart").find("ul");
	    	$("li.li-order").remove();
	    	$(".cart-empty").hide();
	    	
	    	var totalPriceSum = 0;
	    	$.each(selectedMenuArr, function(i, menu){
				$ul.append('<li class="li-order"><div style="display:none;" class="cart-menu-id">' + menu["menuId"] + '</div><div class="cart-menu-name">' + menu["menuName"] + ' / <span class="each-price">'+ menu["price"] +'</span>원</div><div class="left"><input type="button"class="btn-order-del" value="X"><span class="span-order-price">'+menu["totalPrice"]+'</span>원</div><div class="right"><input type="button"value="-"><span class="amnt">'+menu["amount"]+'</span><span>개</span><input type="button"value="+"></div></li>');
				
				totalPriceSum += Number(menu["totalPrice"]);
			});
	    	
	    	//html 합계금액 
	    	$("#total-price").text(totalPriceSum);
	    	
		
			//주문표 X버튼 이벤트핸들러 
			//동적으로 추가한거라 이 함수를 벗어나면 이벤트핸들러가 안먹힘
	        $(".btn-order-del").on('click', function(){
	        	
	        	var $this = $(this);
	        
	        	//객체배열에서 메뉴 삭제
	        	for(var i = 0; i < selectedMenuArr.length; i++){
					
	        		if(Number(selectedMenuArr[i]["menuId"]) == Number($this.parent().parent().find(".cart-menu-id").text())){
	        			selectedMenuArr.splice(i, 1);
	        			i--;
	        			break;
	        		}
				}
	        	
	        	//합계금액에서 삭제한만큼 빼기
	        	var totalPriceSum = Number($("#total-price").text());
	        	totalPriceSum -= Number($this.parent().parent().find(".span-order-price").text());
	        	
	        	$("#total-price").text(totalPriceSum);
	        	
	        	//html 삭제
	        	$this.parent().parent().remove();
	        		
	        	//변경된 객체배열 다시 세션에 담기
	        	setArrayToSession(selectedMenuArr);
    			
    			if(selectedMenuArr.length == 0){
    				$(".cart-empty").show();
    			}
    			
    			if(sessionStorage.getItem(memberIdJAVA) === '[]'){
    				sessionStorage.removeItem(memberIdJAVA);
    			}
    			refreshCart();
	    	});
			
			//주문표의 수량 증가
			$("[value='+'").on('click', function(){
				
			
				//html
				//선택한 버튼에 해당하는 메뉴의 수량 증가
				var $this = $(this);
				var amount = Number($(this).parent().find(".amnt").text());
				amount += 1;
				$this.parent().find(".amnt").text(amount);
				
				changeAmount($this, amount)
				
				
			});
			
			//주문표의 수량 감소
			$("[value='-'").on('click', function(){
				
				//html
				//선택한 버튼에 해당하는 메뉴의 수량 감소. 1 아래로는 떨어지지 않는다
				var $this = $(this);
				var amount = Number($(this).parent().find(".amnt").text());
				if(amount > 1){
					amount -= 1;
					$this.parent().find(".amnt").text(amount);
				}

				changeAmount($this, amount)
				
				
			});
			
			
			function changeAmount($this, amount){
				//html 수량 증가한 메뉴의 가격 증가 표시
				//태그에서 단가 가져오기
				var eachPrice = Number($this.parent().parent().find(".each-price").text());
				eachPrice *= amount;
				$this.parent().parent().find(".span-order-price").text(eachPrice);
				
				
				//html 총 금액 감소
				//총 금액은 주문표 전체를 순회해서 계산
				var $liArr = $(".li-order");
				var sum = 0;
				$.each($liArr, function(i, li){
					//각 li에서 (메뉴가격 x 수량)을 총액 변수에 담기
					sum += Number($(li).find(".span-order-price").text());
					
				});
				$("#total-price").text(sum);
				
				//arr
				//선택한 메뉴의 수량 수정
				var selectedMenuArr = JSON.parse(sessionStorage.getItem(memberIdJAVA));
				$.each(selectedMenuArr, function(i, menu){
					
					if(Number(menu["menuId"]) === Number($this.parent().parent().find(".cart-menu-id").text()) ){
					
					menu["amount"] = amount;
					
					//수량 변경에 따른 totalPrice변경
					menu["totalPrice"] = Number(menu["price"]) * Number(menu["amount"]);
					return false;
					}
				});
				
				//session
				//객체배열 다시 담기
				setArrayToSession(selectedMenuArr);
			}
			
			refreshCart();
			
		} else{
			//세션이 비어있는 경우
			console.log("세션 비어있음 ");
		
			$("li.li-order").remove();
			$(".cart-empty").show();
		}
    	
		
    }
    
    /*
    	주문표 전체삭제
    */
    $("#cart-del-all").click(function(){
    	
    	if(confirm("주문표를 전부 삭제하시겠습니까?")){
    		
			//html
			$("li.li-order").remove();
        	$(".cart-empty").show();
        	$("#total-price").text(0);
			
			//arr
			
			//session
//     		sessionStorage.removeItem("selectedMenuArr");
    		sessionStorage.removeItem(memberIdJAVA);
    	
        	refreshCart();
    	}
    	
    });
    
    //주문표에서 '주문하기' 버튼 클릭 시 
    $(".btn-order").on("click", function(){
    <% if(loginMember == null){ %>
    alert("로그인이 필요합니다.");
    <% } else { %>
    	var selectedMenuArr = JSON.parse(sessionStorage.getItem(memberIdJAVA));
    	
    	if( selectedMenuArr == null){
    		alert("메뉴를 선택해주세요.");
    	}
    	else{
    		//결제페이지로 이동
    		$("#orderFrm").submit();
    	}
    	<% } %>
    });
    
    
    //레이어 팝업에서 '주문하기' 버튼 클릭 시
    function checkout(){
    	
    <% if(loginMember != null){ %>
    	
		//주문표에 추가한 후, 바로 결제페이지로 넘어간다.
//       	add_to_cart();
		addCartById();
		
		$("#orderFrm").submit();
		<% }else {%>
		alert("로그인이 필요합니다.");
		<% } %>
    }

    /*
    카테고리 클릭 시 메뉴 나타남/사라짐
    */
    $(".menu-category").click(function(){
      var $clickedCategoryName = $(this).find("span").text();
      str = "#" + $clickedCategoryName;
      $(str).toggle();
     });
 </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>