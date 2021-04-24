package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberDeleteServlet
 */
@WebServlet("/admin/memberDelete")
public class AdminMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
				
		int result = new MemberService().adminMemberDelete(memberId);
		
		String msg = result > 0 ? "회원 삭제 완료" : "회원 삭제 실패";
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/admin/memberManage");
	}

}
