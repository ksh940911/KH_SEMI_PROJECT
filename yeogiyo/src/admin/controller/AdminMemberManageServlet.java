package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminMemberManageServlet
 */
@WebServlet("/admin/memberManage")
public class AdminMemberManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 입력값
		final int numPerPage = 10; // 페이지당 회원수
		int cPage = 1;	// 현제페이지
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			
		}
		
		// 2. 업무로직 : 전체회원리스트 조회, 가입일 내림차순
		int start = (cPage -1) * numPerPage + 1;
		int end = cPage * numPerPage;
		
//		List<Member> list = memberService.selectList(start, end);
//		int totalContents = memberService.selectMemberCount();
		
		request.getRequestDispatcher("/WEB-INF/views/admin/memberManage.jsp")
		   .forward(request, response);
	}

}
