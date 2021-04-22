
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체메뉴</title>
<link rel="stylesheet" href="/css/" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/restaurantList.css" /> 
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<div class="recommendList">
		<div class="restaurant-categori-menu" >
					<ul>
						<li class="menu search">
							<a href="" class="search-btn">검색</a>
						</li>
						<li class="menu m0">
							<span class="m0">오늘뭐먹지</span>
						</li>
						<li class="menu m1">
							<span class="m1">전체보기</span>
						</li>
						<li class="menu m2">
							<span class="m2">1인분 주문</span>
						</li>
						<li class="menu m3">
							<span class="m3">프랜차이즈</span>
						</li>
						<li class="menu m4">
							<span class="m4">치킨</span>
						</li>
						<li class="menu m5">
							<span class="m5">피자/양식</span>
						</li>
						<li class="menu m6">
							<span class="m6">중국집</span>
						</li>
						<li class="menu m7">
							<span class="m7">한식</span>
						</li>
						<li class="menu m8">
							<span class="m8">일식/돈까스</span>
						</li>
						<li class="menu m9">
							<span class="m9">족발/보쌈</span>
						</li>
						<li class="menu m10">
							<span class="m10">분식</span>
						</li>
						<li class="menu m11">
							<span class="m11">카페/디저트</span>
						</li>
						<li class="menu m12">
							<span class="m12">편의점</span>
						</li>
					</ul>
		</div>
		</div>
		<style>
@charset "UTF-8";
.recommendList {
	width:100%;
	height: 0px;
	background-color:#fbfbfb;
	
}
.restaurant-categori-menu {
    width: 100%;
    height:60px;
    box-shadow: 2px 2px 3px 0px rgb(0 0 0 / 25%);
    z-index: 900; 
    background-color:#fff;
    
}
.restaurant-categori-menu ul {
	text-align:center;
}
.restaurant-categori-menu li {
	/* float: left; */
	display: inline-block;
    font-size: 12px;
    text-align: center;
    list-style: none;
    /* list-style-type: none; */
    border-right: 0;
    border-bottom: 0;
    /* padding: 22px 0; */
    padding: 22px 10px;
    cursor:pointer;
    /* width:70px; */
}
.restaurant-categori-menu li a {
	/* background: url(../images/sprite-icon2.png) no-repeat 50% 50% / 100% 100%;
	background-size:30px;
	border: 1px solid #d9d9d9; */
	
}
/* li.menu:not(:last-of-type)::after {
      content: "|";
   	  color: #d9d9d9;
} */

.restaurant-categori-menu li:not(:first-child):hover {
	background-color:black;
	color:#fff;
}
.recommend-title {
	margin-top:20px;
}
.recommend-title p {
	width:100px;
	padding: 15px 5px 7px 5px;
	margin: 0 auto;
	font-size:12px;
	text-align:center;
}
.recommend-one {
	height:250px;
	/* border-bottom: 1px solid #E5E5E5; */
}

.recommend-restaurant {	
	width:920px;
	height: 200px;
	margin: 0 auto;
}

.recommend-restaurant .recommend-item{
	width:700px;
	position: relative;
    border: 1px solid #d9d9d9;
    background: #fff;
    padding: 0 8px;
    /* margin-bottom: 10px; */
    height: 150px;
    margin: 0 auto;
}
.recommend-item table {
	width:50%;
	height: 150px;
	border-spacing: 0;
    border-collapse: collapse;
}

.recommend-item table tbody {
	display: table-row-group;
    vertical-align: middle;
}
.recommend-item table tr {
	display: table-row;
    vertical-align: inherit;
}
.recommend-item table td {
	display: table-cell;
    vertical-align: inherit;
    padding: 0;
}
table td#td1 {
	width: 80px;
}
table td#td1 .logo {
	width: 90px;
    height: 90px;
    border: 1px solid #d9d9d9;
}


table td#td2 {
	width: 200px;
	height:110px;
	/* padding-left: 10px; */
}
table td#td2 .restaurant-name {
	font-size: 100%;
    width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
table td#td2 .stars {
	font-size: 12px;
}
.stars span.ico-star {
	color: #ffa800;
}
.stars span.review::before {
    content: "|";
    color: #d9d9d9;
}
.stars span.review-user {
	
}
.stars span.review-ceo {
	
}
table td#td2 .info {
	font-size: 12px;
}
.info span.payment-method {
	color: #fa0050;
}
.info span.min-price {
	color: #808080;
}
.info span.min-price::before {
	content: "|";
    color: #d9d9d9;
}
.recommend-item span.delivery-time {
	position: absolute;
	right:10px;
	bottom:12px;
	color: #999 !important;
	font-size: 12px !important;
}

.recommendList .recommendlogo {
	height:100px;
	margin-top:10px;
}
.recommendlogo .logo {
	width:920px;
	height: 100px;
	margin: 0 auto;
	text-align:center;
}
.recommendlogo .logo img{
	width:18%;
	height:100%;
}
</style>
		

 <!-- 가게 리스트 -->
   <div ng-repeat="(key, list) in section_list" class="ng-scope">
    <div ng-show="list.length &gt; 0" class="">
      <div class="restaurant-list">
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
        </div>
        <!-- end ngRepeat: restaurant in list -->
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