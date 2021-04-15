<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

</section>

	<footer>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer_style.css" />
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
	
</div>
</body>
</html>