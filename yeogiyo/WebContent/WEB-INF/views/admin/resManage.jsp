<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게관리</title>
</head>
<body>
	<h1>가게관리 페이지</h1>
	<input type="button" value="신규등록" />
	<input type="button" value="가게찾기(가게명)" /><!-- 텍스트박스 검색?  -->
	<!-- 
		가
		게
		리
		스
		트
		주
		르
		륵
		가게선택(수정,삭제) -> 페이지 이동
	 -->
	 <input type="button" id="noticeMamage" onclick="location.href='<%= request.getContextPath() %>/notice/noticeManage';">공지관리</button>
	 <input type="button" id="reviewMamage" onclick="location.href='<%= request.getContextPath() %>/notice/reviewManage';">리뷰관리</button>
	 
</body>
</html>