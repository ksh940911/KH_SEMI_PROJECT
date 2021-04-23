package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberRoleUpdateServlet
 */
@WebServlet("/admin/memberRoleUpdate")
public class AdminMemberRoleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberRole = request.getParameter("memberRole");

		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberRole(memberRole);

		int result = new MemberService().updateMemberRole(member);

		String msg = result > 0 ? "권한변경 성공." : "권한변경 실패.";

		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/admin/memberManage");
	}

}
