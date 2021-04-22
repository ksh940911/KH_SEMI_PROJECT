package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/member/orderList")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * 주문 내역 리스트로 이동하기
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/orderList.jsp")
		.forward(request, response);
	}

}
