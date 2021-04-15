
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- meta 선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- link 선언 -->
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/style_index.css">
<!-- script 선언 -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="./js/script.js"></script>
<title>여기요</title>
</head>
<body>
	<header>
		<div class="header_container">
			<div class="logo_container">
				<h1>
					<a href="./index.jsp">여기요</a>
				</h1>
			</div>
			<div class="nav_container" id="nav_menu">
				<div class="login_container">
					<ul class="login">
						<button type="button" id="loginBtn"
							onclick="location.href='<%= request.getContextPath() %>/member/memberlogin';">로그인</button>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div class="category-list" ng-hide="$location.path() != &quot;/&quot;">
        <div class="row">
            <!-- ngRepeat: banner in banner_list -->
            <div class="col-xs-6 col-sm-4 col-md-3 category-banner ng-scope" ng-repeat="banner in banner_list"
                on-finish-render="completeBannerListRender()"><a href="" class="thumbnail"
                    ng-click="setEvent($index, banner)" ng-style="{'background': banner.background_color}"
                    style="background: rgb(248, 248, 248);">
                    <div class="category-title">RANDOM</div>
                    <img ng-src="image/category-00.png" alt="202104_ohal" src="img/category-00.png"><i
                        class="icon-move"></i>
                </a>
            </div><!-- end ngRepeat: banner in banner_list -->
            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('all')">
                    <div class="category-title">전체보기</div><img src="img/category-01.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('프랜차이즈')">
                    <div class="category-title">프랜차이즈</div><img src="img/category-10.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('치킨')">
                    <div class="category-title">치킨</div><img src="img/category-02.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('피자양식')">
                    <div class="category-title">피자/양식</div><img src="img/category-03.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('중식')">
                    <div class="category-title">중국집</div><img src="img/category-04.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('한식')">
                    <div class="category-title">한식</div><img src="img/category-05.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('일식돈까스')">
                    <div class="category-title">일식/돈까스</div><img src="img/category-06.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('족발보쌈')">
                    <div class="category-title">족발/보쌈</div><img src="img/category-07.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('분식')">
                    <div class="category-title">분식</div><img src="img/category-09.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail"
                    ng-click="select_home_category('카페디저트')">
                    <div class="category-title">카페/디저트</div><img src="img/category-11.png">
                </a></div>
            <div class="col-xs-6 col-sm-4 col-md-3"><a href="" class="thumbnail" ng-click="select_home_category('편의점')">
                    <div class="category-title">편의점</div><img src="img/category-convenience-store.png">
                </a>
            </div>
        </div>
    </div>
	<footer>
		<div class="footer"
			ng-show="is_yogiyo &amp;&amp; !session_storage.oauth_next">
			<div class="footer-menu">
				<ul>
					<li class="mb ng-hide" ng-show="is_mobile_device"><a
						ng-bind="check_login() ? '로그아웃' : '로그인'" ng-click="login()"
						class="ng-binding">로그인</a></li>
					<li class="mb cscenter ng-hide" ng-show="is_mobile_device"><a
						href="#/contact/">고객만족센터</a></li>
					<li class="mb notice"><a href="#/notice/">공지사항</a></li>
					<li class="sns-link"><a
						href="https://www.facebook.com/Yogiyokorea/" class="facebook"
						target="_blank"><span></span>KH_정보교육원</a></li>
				</ul>
			</div>
			<div class="service-info">
				<div class="bpg">
					<a href="#/trust/"><span class="img"></span><span class="text">여기요<br>안심센터
					</span></a>
				</div>
				<div class="cleanreview">
					<a href="#/cleanreview/"><span class="img"></span><span
						class="text">여기요 100%<br>클린리뷰
					</span></a>
				</div>
				<div class="csc">
					<em>고객만족센터</em> <strong>1588-응애응애</strong> <span>아마도 24시간,
						연중유휴</span>
				</div>
			</div>
			<div class="guide">
				<p>
					맛집이조는 그냥 SemiProject로 이 페이지를 만들었으며 재미로 봐주셨으면 좋겠습니다. <br> 고소나
					신고를 할시 불안하니 피해주시면 감사하겠고 KH_정보교육원의 학생이시라면 이런거 하지않았으면 좋겠습니다. <br>
					레이디 젠틀맨 어쩌구저쩌구 오케이 땡큐
				</p>
			</div>
		</div>
	</footer>
</body>
</html>

