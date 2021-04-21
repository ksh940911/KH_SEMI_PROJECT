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
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/member/memberIdCheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String memberId = request.getParameter("id");
        
        
        Member member = new MemberService().selectMemberById(memberId);
        
        //아이디 사용 가능 true, 아이디 사용 불가 false
        boolean available = member == null;
        
        if (available == true) {
        	out.print(1);
        } else if(available == false) {
        	out.print(0);
        }
        
        
	}

}
