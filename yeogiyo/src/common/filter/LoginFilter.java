package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = {
		"/member/memberView",
		"/member/memberUpdate",
		"/member/orderList",
		"/member/updatePhone",
		"/member/updatePassword",
		"/member/memberPhoneCheck"
		})
public class LoginFilter implements Filter {


	/**
	 * loginMember가 null일 경우 메인 페이지로 리다이렉트
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpServletResponse httpRes = (HttpServletResponse)response;
		
		HttpSession session = httpReq.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			session.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			//servlet에 가기 전에 메인 페이지로 이동.
			httpRes.sendRedirect(httpReq.getContextPath());
			return;
		}
		
		chain.doFilter(request, response);
	}
}
