package common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class MvcUtils {

	
	public static String getSha512(String password) {
		String encryptedPassword = null;
		
		//1. 암호화
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes = null;
		try {
			bytes = password.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		md.update(bytes);
		byte[] encryptedBytes = md.digest(); //암호화 처리
		//System.out.println("암호화 처리후 : " + new String(encryptedBytes));
		
		//2. 문자 인코딩 처리
		encryptedPassword = Base64.getEncoder().encodeToString(encryptedBytes);
		System.out.println("인코딩 처리후 : " + encryptedPassword);
		
		return encryptedPassword;
	}

	
	
	public static String getPageBar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pageBar = new StringBuilder();
		
		int totalPage = (int)Math.ceil((double)totalContents / numPerPage);
		int pageBarSize = 5;
		//cPage속성 추가전 키워드 작업
		//cPage이외의 다른 사용자입력값이 있는 경우 대비
		// /mvc/admin/memberFinder?type=id&kw=abc&cPage=
		url = (url.indexOf("?") > -1) ? url + "&" : url + "?";
		
		/**
		 * 1 2 3 4 5  		---> 1
		 * 6 7 8 9 10 		---> 6
		 * 11 12 13 14 15 	---> 11
		 * ...
		 * 공식
		 */
		int pageStart = (cPage - 1) / pageBarSize * pageBarSize + 1;
		int pageEnd = pageStart + pageBarSize - 1;
		
		//증감변수는 pageStart부터 시작
		int pageNo = pageStart;
		
		//1. 이전
		if(pageNo == 1) {
			
		}
		else {
			pageBar.append("<a href='" + url + "cPage=" + (pageNo - 1) + "'/>prev</a>\n");
		}
		
		//2. pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				pageBar.append("<span class='cPage'>" + pageNo + "</span>\n");
			}
			else {
				pageBar.append("<a href='" + url + "cPage=" + pageNo + "'/>" + pageNo +"</a>\n");
			}
			pageNo++;
		}
		
		//3. 다음
		// 마지막페이지가 포함된 페이지바인 경우
		if(pageNo > totalPage) {
			
		}
		else {
			pageBar.append("<a href='" + url + "cPage=" + (pageNo) + "'/>next</a>\n");
		}
		/*
			<a href='/mvc/admin/memberList?cPage=5'/>prev</a>
			
			<a href='/mvc/admin/memberList?cPage=6'/>6</a>
			<a href='/mvc/admin/memberList?cPage=7'/>7</a>
			<a href='/mvc/admin/memberList?cPage=8'/>8</a>
			<a href='/mvc/admin/memberList?cPage=9'/>9</a>
			<span class='cPage'>10</span>
			
			<a href='/mvc/admin/memberList?cPage=11'/>next</a>
		*/
		return pageBar.toString();
	}


	public static String convertLineFeedToBr(String content) {
		return content.replaceAll("\\n", "<br/>");
	}


	public static String escapeHtml(String str) {
		return str.replaceAll("<", "&lt;")
				  .replaceAll(">", "&gt;");
	}

}
