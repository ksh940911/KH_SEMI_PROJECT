<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Restaurant> list = (List<Restaurant>)request.getAttribute("list"); %>
    
<%@ include file="/WEB-INF/views/common/headerCategory.jsp" %>

      <div class="restaurant-list">
      
      <% if(list.isEmpty() == true){ %>
      
     	<p style="text-align: center;">조회된 가게가 없습니다.</p>
      
      
      <% }  else {%>
      
      
   <%   for(Restaurant r : list){ %>
        <!-- ngRepeat: restaurant in list -->
        <div class="col-sm-6 contract" >
          <div class="item-clearfix">
            <table>
              <tbody>
                <tr>
                  <td id="atd1">
                    <img src="<%= r.getLogoImg() %>" alt="가게사진" />
                  </td>
                  <td id="atd2">
                    <div class="restaurants-info">
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
$(".restaurants-info").click(function(){
	console.log("click");
	var resId = $(this).find("[name=resId]").val();
	console.log(resId);
	location.href = '<%= request.getContextPath() %>/restaurant/menuList.do?res_id=' + resId;
});


</script>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>