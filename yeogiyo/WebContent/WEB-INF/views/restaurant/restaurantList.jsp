<%@page import="restaurant.model.vo.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Restaurant> list = (List<Restaurant>)request.getAttribute("list"); %>
    
<%@ include file="/WEB-INF/views/common/menu_header.jsp" %>
<link rel="stylesheet" href="/css/restaurantList.css" />
<body>
	<div ng-repeat="(key, list) in section_list" class="ng-scope">
        <div ng-show="list.length &gt; 0" class="">
          <!-- ngIf: key === 'superlist' -->
          <!-- ngIf: key === 'hotdeal' -->
          <!-- ngIf: key === 'contract' -->
          <div class="restaurant-list">
            <!-- ngRepeat: restaurant in list -->
            <div class="col-sm-6 contract" ng-repeat="restaurant in list">
              <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <div ng-show="restaurant|restaurant_is_available" class="logo"
                          ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                          style="background-image: url(&quot;/media/franchise_logos/닥엔돈스쪽갈비_20200406_Franchise_crop_200x200.jpg&quot;), url(&quot;image/default_restaurant_logo.png&quot;);">
                        </div>
                      </td>
                      <td>
                        <div class="restaurants-info">
                          <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="닥엔돈스쪽갈비-강남역삼점">
                            보슬보슬</div>
                          <div class="stars">
                            <span ng-show="restaurant.review_count &lt; 1">
                              서울 강남구 테헤란로8길 22 1층 102호
                            </span>
                          </div>
                          <ul>
                            <li class="min-price ng-binding">5,000원 이상 배달</li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div><!-- end ngRepeat: restaurant in list -->
            <div class="col-sm-6 contract" ng-repeat="restaurant in list">
              <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <div ng-show="restaurant|restaurant_is_available" class="logo"
                          ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                          style="background-image: url(&quot;/media/restaurant_logos/스탁_20190801_DHK촬영_돼지김치찌개_Top01_300x300_vvdqWkY.jpg&quot;), url(&quot;image/default_restaurant_logo.png&quot;);">
                        </div>
                      </td>
                      <td>
                        <div class="restaurants-info">
                          <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="1인밥줘">진씨화로</div>
                          <ul>
                            <li class="payment-methods ng-binding yogiseo-payment"
                              ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">서울 강남구 테헤란로10길 21 2층
                            </li>
                            <li class="min-price ng-binding">7,000원 이상 배달</li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div><!-- end ngRepeat: restaurant in list -->
            <div class="col-sm-6 contract" ng-repeat="restaurant in list">
              <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <div ng-show="restaurant|restaurant_is_available" class="logo"
                          ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                          style="background-image: url(&quot;/media/restaurant_logos/업체자체_20190820_352170_한사바리해장국-강남점_대표사진_200x200.jpg&quot;), url(&quot;image/default_restaurant_logo.png&quot;);">
                        </div>
                        <div ng-show="! (restaurant|restaurant_is_available)"
                          class="logo not-available ng-binding ng-hide">현재 요기요<br>서비스가<br>제공되지<br>않습니다.</div>
                      </td>
                      <td>
                        <div class="restaurants-info">
                          <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="한사바리해장국-강남점">
                            롸벤돈까스</div>
                          <ul>
                            <li class="payment-methods ng-binding yogiseo-payment"
                              ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">요기서결제
                            </li>
                            <li class="min-price ng-binding">5,000원 이상 배달</li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div><!-- end ngRepeat: restaurant in list -->
            <div class="col-sm-6 contract" ng-repeat="restaurant in list">
              <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
                <table>
                  <tbody>
                    <tr>
                      <td>
                        <div ng-show="restaurant|restaurant_is_available" class="logo"
                          ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                          style="background-image: url(&quot;/media/restaurant_logos/업체자체_20210402_556416_무교동유정낙지본점-논현배달점_대표사진_300x300.jpg&quot;), url(&quot;image/default_restaurant_logo.png&quot;);">
                        </div>
                        <div ng-show="! (restaurant|restaurant_is_available)"
                          class="logo not-available ng-binding ng-hide">현재 요기요<br>서비스가<br>제공되지<br>않습니다.</div>
                      </td>
                      <td>
                        <div class="restaurants-info">
                          <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="무교동유정낙지본점-논현직영점">
                            수원왕갈비통닭</div>
                          <ul>
                            <li class="payment-methods ng-binding yogiseo-payment"
                              ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">요기서결제
                            </li>
                            <li class="min-price ng-binding">10,000원 이상 배달</li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div><!-- end ngRepeat: restaurant in list -->
          </div>
        </div>
      </div>
      </body>
     
<%@ include file="/WEB-INF/views/common/footer.jsp" %>