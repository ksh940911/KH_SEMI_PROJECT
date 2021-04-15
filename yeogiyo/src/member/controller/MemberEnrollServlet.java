package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 회원가입 페이지로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp")
		       .forward(request, response);
	}

	/**
	 * 회원가입 처리 - DB 저장
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값에 한글이 있기 때문에 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		//2.전송값 꺼내서 변수에 기록
	}

}
