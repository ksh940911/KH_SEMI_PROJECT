package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/memberlogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//사용자 입력값 처리
		String memberId = request.getParameter("memberId");
//		String password = request.getParameter("password");
		String password = MvcUtils.getSha512(request.getParameter("password")); //암호화처리코드
		System.out.println("memberId@MemberLoginServlet = " + memberId);
		System.out.println("password@MemberLoginServlet = " + password);
		
		Member member = memberService.selectOne(memberId);
		System.out.println("member@MemberLoginServlet = " + member);
		
		HttpSession session = request.getSession();
		String referer = request.getHeader("Referer");	
		String path = "";
		if(member != null && password.equals(member.getPassword())) {
			//로그인 성공
			session.setAttribute("msg", "로그인에 성공하셨습니다");
			session.setAttribute("loginMember", member);
			path = request.getContextPath();
		} else {
			//로그인 실패
			session.setAttribute("msg", "로그인에 실패하셨습니다");
			path = referer;
		}
		//이전페이지로 리다이렉트
		
		//System.out.println("referer@MemberLoginServlet = " + referer);
		
		
		//response.sendRedirect(request.getContextPath());
		response.sendRedirect(path);
	}

}
