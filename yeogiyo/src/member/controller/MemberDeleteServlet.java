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
 * Servlet implementation class MemberDelete
 */
@WebServlet("/member/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberService();   
	/**
	 * 회원 삭제 페이지로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberDelete.jsp")
				.forward(request, response);
	}

	/**
	 * 회원 삭제 기능
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String password =  MvcUtils.getSha512(request.getParameter("password"));
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		//System.out.println("memberDelServlet : " + memberId + password);
		
		if(!password.equals(loginMember.getPassword())) {
			session.setAttribute("msg", "입력하신 비밀번호가 맞지 않습니다."); //msg session 전달해야 함
			response.sendRedirect(request.getContextPath() + "/member/memberDelete");
		}
		
		int result = memberService.deleteMember(memberId);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/member/logout");
		} else {
			session.setAttribute("msg", "회원 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath());
		}
	}

}
