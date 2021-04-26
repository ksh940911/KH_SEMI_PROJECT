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
	     	<select name="alignSelect" onchange="alignChange()">
	     		<option value="default" selected>기본 정렬순</option>
	     		<option value="star">별점순</option>
	     		<option value="review">리뷰 많은순</option>
	     		<option value="min">최소 주문 금액순</option>
	     	</select>
	     </form> 
      </div>
	  <hr />
	  
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
function alignChange() {
	$("#alingFrm")
		.attr("action",	
				<% if(category.equals("전체보기")) { %>
	 				"<%= request.getContextPath() %>/restaurant/restaurantList.do").submit();
				<% } else { %>
					"<%= request.getContextPath() %>/restaurant/restaurantList.do?category=<%= category %>").submit();
				<% } %>
};

$(".item-clearfix").click(function(){
	var resId = $(this).find("[name=resId]").val();
	//console.log(resId);
	location.href = '<%= request.getContextPath() %>/restaurant/menuList.do?res_id=' + resId;
});

//console.log($(".cliked-category").val());
//console.log($(".category-name"));

$(".search-category-btn").click(function(){
	$(".main-search").css("display","block");
});

</script>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>