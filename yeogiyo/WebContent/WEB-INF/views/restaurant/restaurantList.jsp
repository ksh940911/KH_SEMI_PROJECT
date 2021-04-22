<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% List<Restaurant> list = (List<Restaurant>)request.getAttribute("list"); %>
    
<%@ include file="/WEB-INF/views/common/headerCategory.jsp" %>

  <div ng-repeat="(key, list) in section_list" class="ng-scope">
    <div ng-show="list.length &gt; 0" class="">
      <!-- ngIf: key === 'superlist' -->
      <!-- ngIf: key === 'hotdeal' -->
      <!-- ngIf: key === 'contract' -->
      <div class="restaurant-list">
      
      <% if(list.isEmpty() == true){ %>
      
      <% }  else {%>
      
      
   <%   for(Restaurant r : list){ %>
        <!-- ngRepeat: restaurant in list -->
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(<%= r.getLogoImg() %>">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="닥엔돈스쪽갈비-강남역삼점">
                        <%= r.getResName() %></div>
                      <ul>
                      <input type="hidden" name="resId" value="<%= r.getResId() %>" />
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;"><%= r.getResAddress() %></li>
                        <li >리뷰 : <%= r.getReviewCnt() %> </li>
                      </ul>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div><!-- end ngRepeat: restaurant in list -->
  	      <% } %>
        <% } %>
        
      </div>
    </div>
  </div><!-- end ngRepeat: (key, list) in section_list -->
</html>

<script>
$(".restaurants-info").click(function(){
	console.log("click");
	var resId = $(this).find("[name=resId]").val();
	console.log(resId);
	location.href = '<%= request.getContextPath() %>/restaurant/menuList.do?res_id=' + resId;
});


</script>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>