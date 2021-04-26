<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<Restaurant> list = (List<Restaurant>)request.getAttribute("list"); 
	/* String category = (String)request.getAttribute("category"); */
%>
    
<%@ include file="/WEB-INF/views/common/headerCategory.jsp" %>

      <div class="restaurant-list">
      <input class="cliked-category" type="hidden" value="<%= category %>"></input>
     
      <% if(list.isEmpty() == true){ %>
     	<p style="text-align: center;">조회된 가게가 없습니다.</p>
      <% }  else {%>
      
      <div class="align">
	      <form id="alingFrm">
	     	<select name="alignSelect" id="alignSelect" onchange="alignChange()">
	     		<option value="default" selected>기본 정렬순</option>
	     		<option value="star">별점순</option>
	     		<option value="review">리뷰 많은순</option>
	     		<option value="min">최소 주문 금액순</option>
	     	</select>
	     </form> 
      </div>
	
	  
   <%   for(Restaurant r : list){ %>
   
        <!-- ngRepeat: restaurant in list -->
        <div class="col-sm-6 contract" >
          <div class="item-clearfix">
            <table>
              <tbody>
                <tr>
                  <td id="atd1">
                  	<div class="logo">
	                <% if(r.getResImg() != null && r.getResImg().getImgResStatus()) { %>
						<img src="<%= request.getContextPath() %>/upload/res/<%= r.getResImg().getRenamedFilename() %>" class="resList-img"/>	
					<% } else { %>
						<img src="<%= request.getContextPath() %>/images/defaultMenu.png" class="resList-img" />	
					<% } %> 
                  	</div>
                  </td>
                  <td id="atd2">
                    
                      <div class="restaurant-name"><%= r.getResName() %></div>
                      <input type="hidden" name="resId" value="<%= r.getResId() %>" />
                      <div class="stars">
						 <span class="ico-star">★ 4.8</span>
						 <span class="review" id="user-review"> 리뷰 <%= r.getReviewCnt() %></span>										
					  </div>
					  <div class="info">
						 <span class="payment-method">요기서 결제</span>
						 <span class="min-price"> <%= r.getMinPrice() %>원 이상 배달</span>
					  </div>
              
                  </td>
                </tr>
              </tbody>
            </table>
            <span class="delivery-time">45~55분</span>
          </div>
        </div>
<% 		} 
      
  }
%>
        
      </div>








<script>

$(document).ready(function(){
	$("#alignSelect")
});

function alignChange() {
	$("#alingFrm")
		.attr("action",	
			  "<%= request.getContextPath() %>/restaurant/restaurantList.do?category=<%= category %>").submit();
};


$(".item-clearfix").click(function(){
	var resId = $(this).find("[name=resId]").val();
	//console.log(resId);
	location.href = '<%= request.getContextPath() %>/restaurant/menuList.do?res_id=' + resId;
});

console.log($(".cliked-category").val());


$(".search-category-btn").click(function(){
	$(".main-search").css("display","block");
});


$("body").on("click",function(e){
	
	var $target = $(e.target);
	console.log($target);
	
	
	var $srchAreaOne = $target.hasClass("search-category-btn");
	var $srchAreaTwo = $target.hasClass("main-search");
	 
	var $srchAreaThree = $target.hasClass("main-search");
	var $srchAreaFour = $target.hasClass("category_input");
	var $srchAreaFive = $target.hasClass("category_search_button");
	
	if(!$srchAreaOne && !$srchAreaTwo){
		if($srchAreaThree || $srchAreaFour || $srchAreaFive){
			
		}else {
			$(".main-search").css("display","none");
			$("[name=category_keyword]").val("");
		}
	}
});


</script>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>