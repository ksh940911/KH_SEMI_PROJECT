<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	    
    <div class="category-list" ng-hide="$location.path() != &quot;/&quot;">
        <div class="row">
            <!-- ngRepeat: banner in banner_list -->
            <div class="col-xs-6 col-sm-4 col-md-3 category-banner ng-scope" ng-repeat="banner in banner_list"
                on-finish-render="completeBannerListRender()"><a href="" class="thumbnail"
                    ng-click="setEvent($index, banner)" ng-style="{'background': banner.background_color}"
                    style="background: rgb(255, 255, 255);">
                    <div class="category-title">RANDOM</div>
                    <img ng-src="images/category-00.png" alt="202104_ohal" src="images/category-00.png"><i
                        class="icon-move"></i>
                </a>
            </div><!-- end ngRepeat: banner in banner_list -->
            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('all')">
                    <div class="category-title">전체보기</div><img src="images/category-01.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('프랜차이즈')">
                    <div class="category-title">프랜차이즈</div><img src="images/category-10.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('치킨')">
                    <div class="category-title">치킨</div><img src="images/category-02.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('피자양식')">
                    <div class="category-title">피자/양식</div><img src="images/category-03.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('중식')">
                    <div class="category-title">중국집</div><img src="images/category-04.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('한식')">
                    <div class="category-title">한식</div><img src="images/category-05.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('일식돈까스')">
                    <div class="category-title">일식/돈까스</div><img src="images/category-06.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('족발보쌈')">
                    <div class="category-title">족발/보쌈</div><img src="images/category-07.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('분식')">
                    <div class="category-title">분식</div><img src="images/category-09.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('카페디저트')">
                    <div class="category-title">카페/디저트</div><img src="images/category-11.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('편의점')">
                    <div class="category-title">편의점</div><img src="images/category-convenience-store.png">
                </a>
            </div>
        </div>
    </div>
	    
	    
        
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
