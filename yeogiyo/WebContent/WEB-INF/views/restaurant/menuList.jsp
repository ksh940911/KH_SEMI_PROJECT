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
                <!-- js로 top고정 -->
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
                	<div class="hori-menu-id" style="display : none;"><%= list.get(i).getMenuId() %></div>
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
 <!-- 레이어 팝업... 메뉴번호를 어떻게 받아오지? -->
 <% 
 boolean isPopupOn = false;
 
 %>
 <div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="detail-header">
            <div class="title">메뉴상세</div>
            <input type="button" class="btn-layerClose" value="X">
        </div>
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
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
                
                
                <!--// content-->
            </div>
            <div class="detail-btn-wrap">
                <button class="btn-add-cart" onclick="add_to_cart();">주문표에 추가</button>
                <button class="btn-order" onclick="checkout()">주문하기</button>
                <div class="message ng-binding"></div>
              </div>
        </div>
    </div>
</div>
<!-- 레이어 팝업 끝 -->

 <script>
     //메뉴 상세 레이어 팝업에서 '주문표에 추가' 버튼 클릭 시
     function add_to_cart(){

        $(".cart-empty").hide();

        //.li-order에 메뉴명+수량 반영하기

        $(".li-order").show();
        dim_layer_hide();

        



     }

     //메뉴 상세 레이어 팝업에서 '주문하기' 버튼 클릭 시
     function checkout(){
        //메뉴 번호, 이름, 수량 담아 제출




     }

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
    	
    	var $clickedMenuId = $(this).find(".hori-menu-id").text();
    	//db
    	
    	
    	
    	
    	
    	 
    	  //this로 메뉴번호 받아서 layer_popup()에 같이 보내는게 좋을..까?
        layer_popup($("#layer2"));
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

    function dim_layer_hide(){
        
        //팝업창 숨기기
        $(".dim-layer").hide();
        
    }
    //---------------------------------------

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