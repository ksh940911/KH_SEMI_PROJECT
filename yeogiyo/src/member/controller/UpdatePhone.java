package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePhone
 */
@WebServlet("/member/updatePhone")
public class UpdatePhone extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String phone = request.getParameter("phone");

		Member member = new MemberService().selectMemberByPhone(phone);

		// 휴대폰 번호 사용 가능 true, 이미 등록 중인 휴대폰번호 false
		boolean available = member == null;

		if (available == true) {
			out.print(1);
		} else if (available == false) {
			out.print(0);
		}

	}

}
