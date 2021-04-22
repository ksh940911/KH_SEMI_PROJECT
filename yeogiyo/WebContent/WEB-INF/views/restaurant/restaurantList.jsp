
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/menu_header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체메뉴</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurantList.css" /> 
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
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
                      style="background-image: url(https://img.siksinhot.com/article/1599115903549794.jpeg">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="닥엔돈스쪽갈비-강남역삼점">
                        보슬보슬</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">서울 강남구
                          테헤란로10길 21 2층</li>
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
                      style="background-image: url(https://lh3.googleusercontent.com/proxy/2-jRTAY1VLmG5RPdjU2mnIdaD0lHMNZZX3qxUZsCjOYw6D8ANPCeS4JkvnO5FFRP0NXnvL1TbA3AX0xbF3MNEONceGn9Y3sSKkHBOktzpFzswSXVpLaDywyJpt3_40AUFtw2vsbyvizRRwbv_7IskH7UfioJyvVeNrRKDIF7agUweevpK5fs6dfa5p5VAFGS-e0YYAVKhndROcJ8nGFaSoxXfCCMiX7errjD8VUvwKE8bEvkGfAlz_SmrN_DraNta2Thq-6DOrL82P_PKO9RostCsuE7ifrTjak9CT7aYeMxVBV0btpmcA);">
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
                      style="background-image: url(https://t1.daumcdn.net/thumb/R720x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/6xaf/image/G2lxLZzeIq2QNNn03tYjgLUNH7g.jpg);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="한사바리해장국-강남점">
                        뢰벤돈까스</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">어딘지 잘모름
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
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
        <div class="col-sm-6 contract" ng-repeat="restaurant in list">
          <div class="item clearfix" ng-click="select_restaurant(restaurant, $index)" style="cursor: pointer;">
            <table>
              <tbody>
                <tr>
                  <td>
                    <div ng-show="restaurant|restaurant_is_available" class="logo"
                      ng-style="{&#39;background-image&#39;:&#39;url(&#39; + get_logo_url(restaurant.logo_url) + &#39;), url(\&#39;image/default_restaurant_logo.png\&#39;)&#39;}"
                      style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1H5gX6oWmvub958mRuz2KOnYPJ20p7ouKXw&usqp=CAU);">
                    </div>
                  </td>
                  <td>
                    <div class="restaurants-info">
                      <div class="restaurant-name ng-binding" ng-bind="restaurant.name" title="수원왕갈비통닭">
                        수원왕갈비통닭</div>
                      <ul>
                        <li class="payment-methods ng-binding yogiseo-payment"
                          ng-class="is_online_payment(restaurant) ? &#39;yogiseo-payment&#39; : &#39;&#39;">영화임
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
  </div><!-- end ngRepeat: (key, list) in section_list -->
</html>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>