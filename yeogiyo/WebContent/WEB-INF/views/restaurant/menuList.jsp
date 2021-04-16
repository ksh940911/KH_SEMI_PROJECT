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
    StringBuilder categoryStr = new StringBuilder();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MenuList</title>
    <!-- jsp에서 css, jquery경로 request.contextPath()로 변경 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/menuList.css">
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
    <div class="wrapper">
    <table id="restaurant-info">
        <tr>
            <td colspan="2" id="res_name"><b><%= r.getResName() %></b></td>
        </tr>
        <tr>
            <td id="logo-img"><img src="<%= r.getLogoImg() %>" alt=""></td>
            <td id="res-info-sub">
                <span class="star-fill" id="star1">★</span>
                <span class="star-fill" id="star2">★</span>
                <span class="star-fill" id="star3">★</span>
                <span class="star-fill" id="star4">★</span>
                <span class="star-empty" id="star5">★</span>
                <input type="button" id="btn-review" value="리뷰 보기">
                <input type="button" id="btn-notice" value="사장님 공지">
                
                <form id="frm-review" action="">
                    <input type="hidden" name="res_id">
                </form>
                <form id="frm-notice" action="">
                    <input type="hidden" name="res_id">
                </form>
                <br><br>
                <span style="color: #999">결제</span> 신용카드, 현금<br>
                배달시간 00분<br>
            </td>
        </tr>
    </table>

    <div>
        <table id="cart">
            <tr>
                <td id="cart-title" style="padding: 0 10px">주문표  <input type="button" value="전체삭제" style="float:right"></td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li class="cart-empty">
                            주문표에 담긴 메뉴가 없습니다.
                        </li>
                        <!--주문표에 추가한 경우//-->
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
                        <!--//주문표에 추가한 경우-->
                    </ul>
                </td>
            </tr>
            <tr>
                <td id="td-total">합계 금액 : <span id="total-price">1000</span>원</td>
            </tr>
            <tr>
                <td><input type="button" id="btn-order" value="주문하기" onclick="checkout()"></td>
            </tr>
        </table>
    </div>
<br>
    <br>
    <h3>메뉴 (<span id="menu_cnt"><%=list.size() %></span>) </h3>
    <div class="container">
        <!-- 포토메뉴. 6개 노출. 사진 없으면 div 아예 안보이게 분기처리 -->
        <div id="menu-horizontal">
            <div id="slide">
            <% for(int i = 0; i < list.size(); i++){ %>
                <div class="hori-menu btn-layer-popup">
                <% if(list.get(i).getMenuImg()!= null){ %>
                	<div class="menu-id" style="display : none;"><%= list.get(i).getMenuId() %></div>
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
                    <table>
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
   
   
     /*
     btn-review클릭 시 가게 번호 담아서 리뷰 페이지로 이동
     */
     $("#btn-review").click(function(){
    	 
    	 console.log("review!");
    	 
	     var servletUrl = ""; //<-여기에 이동할 서블릿 url작성
	     var $frm = $("#frm-review");
	     //폼에 hidden input으로 가게아이디 담아놨어요. 서블릿에서 파라미터명 "res_id"로 꺼내세요 
	    	 
     	$frm.attr("action", servletUrl).submit();
     

     });
     
     /*
     btn-notice클릭 시 가게 번호 담아서 사장님 공지 페이지로 이동
     */
     $("#btn-notice").click(function(){
    	 
     
		 console.log("notice!");
    	 
	     var servletUrl = "<%= request.getContextPath() %>/admin/noticeView"; //<-여기에 이동할 서블릿 url작성
	     var $frm = $("#frm-notice");
	     //폼에 hidden input으로 가게아이디 담아놨어요. 서블릿에서 파라미터명 "res_id"로 꺼내세요 
	    	 
     	$frm.attr("action", servletUrl).submit();



         
     });
    
     
     
	/*
	메뉴 선택 시 레이어 팝업창 띄우기---------------------------------
	*/
     $('.btn-layer-popup').click(function(){
    	
    	var $clickedMenuId = $(this).find(".menu-id").text();
    	//console.log($clickedMenuId);
    	
    	//ajax로 menu id 보내고 메뉴객체 json받기 
    	$.ajax({
    		url: "<%= request.getContextPath() %>/restaurant/menu.do",
    		data : {
    			menuId : $clickedMenuId	
    		},
    		success : function(data){
    			//console.log(data);
    			
    			//json data반영한 팝업레이어 html 삽입
    			var $popupHtml = $('<div class="dimBg"></div><div id="layer2"class="pop-layer"><div class="detail-header"><div class="title">메뉴상세</div><input type="button"class="btn-layerClose"value="X"></div><div class="pop-container"><div class="pop-conts"><div class="detail-image"><img src="' + data.menuImg + '"alt=""></div><div class="detail-menu-id" style="display:none;">' + data.menuId + '</div><div class="detail-text"><div class="detail-menu-name">' + data.menuName + '</div><div class="menu-description">' + data.description + '</div></div><div class="detail-price"><strong>가격</strong><div class="detail-price-price"><span class="price" id="popup-price">' + data.price + '</span>원</div></div><div class="quantity-control"><strong>수량</strong><div><input type="button" id="popup-btn-minus" value="-"><span id="popup-amount">1</span><input type="button" id="popup-btn-plus" value="+"></div></div><div class="detail-total-wrap"><strong>총주문금액</strong><div class="total"><strong><span id="popup-total-price">4500</span>원</strong></div></div></div><div class="detail-btn-wrap"><button class="btn-add-cart"onclick="add_to_cart();">주문표에추가</button><button class="btn-order"onclick="checkout()">주문하기</button><div class="message ng-binding"></div></div></div></div>');
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
    
    //메뉴 상세 레이어 팝업에서 '주문표에 추가' 버튼 클릭 시
    function add_to_cart(){
    	//session storage로 주문내용을 js object로 만들어서 json에 담기 
    	
    	//1. selectedMenuArr 초기화
    	//sessionStorage에 selectedMenuArr배열이 없는 경우 : 생성
    	//sessionStorage에 selectedMenuArr배열이 있는 경우 : getItem 후 parsing	
    	var selectedMenuArr = JSON.parse(sessionStorage.getItem('selectedMenuArr')) || [];
    	 //짧은조건식. A || B
        //A가 true일 경우 A값을 대입. 아니면 B대입.
    	
		//2. selectedMenuArr 배열에 selectedMenu 객체 추가
		/*
		if(배열이 비어있으면){
			바로 추가
		}else{
			배열이 있으면
			아이디 일치하는 객체에 수량만 추가
		}
		for(var i = 0; i < selectedMenuArr; i++){

			 //이미 같은 메뉴가 있으면 수량만 추가
			if(selectedMenuArr[i]["menuId"] === Number($popupLayer.find(".detail-menu-id").text())){
				console.log("이미 메뉴가 있지");
				selectedMenuArr[i]['amount'] += Number($popupLayer.find("#popup-amount").text());
				break;
			
			}else{
				console.log("메뉴 없어서 새로 추가 ");
	    	
		    	var $popupLayer = $("#layer2");
		    	var selectedMenu = {
		    			menuId : Number($popupLayer.find(".detail-menu-id").text()),
		    			menuName : $popupLayer.find(".detail-menu-name").text(),
		    			amount : Number($popupLayer.find("#popup-amount").text()),
		    			totalPrice : Number($popupLayer.find("#popup-total-price").text())
		    			
		    	};
	    	
		    	selectedMenuArr.push(selectedMenu);
		    	break;
		    }
			
		}
		*/
        
    	
    	//4. selectedMenuArr배열을 JSON으로 변환
    	var jsonSelectedMenuArr = JSON.stringify(selectedMenuArr);
    	
    	//3. sessionStorage에 저장
    	sessionStorage.setItem("selectedMenuArr", jsonSelectedMenuArr);
    	
    	//주문표 최신화
    	showCart();
    	
       dim_layer_hide();
    }

    /*
    주문표 보여주기
    */
    function showCart(){

    	console.log("showCart()");
    	//1. selectedMenuArr 객체배열 가져오기
     	var selectedMenuArr = JSON.parse(sessionStorage.getItem("selectedMenuArr")) || [];
    	console.log(selectedMenuArr);
    	
    	//2. html로 표시. ul에 기존 li안보이게 하고, 새로운 li 추가하기
    	$(".cart-empty").hide();
    	
    	var $ul = $("#cart").find("ul");
    	
    	//selectedMenu가 있는 경우
    	if(selectedMenuArr.length){
    		
			$.each(selectedMenuArr, function(i, menu){
				
				$ul.append('<li class="li-order"><div stype="display:none;">' + menu["menuId"] + '</div><div>' + menu["menuName"] + '</div><div class="left"><input type="button"class="btn-order-del"value="X"><span class="span-order-price">'+menu["totalPrice"]+'</span>원</div><div class="right"><input type="button"value="-"><span class="amnt">'+menu["amount"]+'</span><input type="button"value="+"></div></li>')
				//menu["menuId"], menu["menuName"], menu["amount"],menu["totalPrice"]
			
			});
			
    		
    		
    	}else{
    		//$ul.append(' <li class="cart-empty">주문표에 담긴 메뉴가 없습니다.</li>');
    	}
    	
    	
    }
    
    
    //메뉴 상세 레이어 팝업에서 '주문하기' 버튼 클릭 시
    function checkout(){
       //메뉴 번호, 이름, 수량 담아 제출




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
</body>
</html>