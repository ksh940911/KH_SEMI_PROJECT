package review.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReviewFormServlet
 */
@WebServlet("/review/reviewForm")
public class ReviewFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resId = Integer.parseInt(request.getParameter("resId"));
		System.out.println("resId@formService = " + resId);
		request.setAttribute("resId", resId);
		
		String orderMenu = request.getParameter("orderMenu");
		request.setAttribute("orderMenu", orderMenu);
		System.out.println("orderMenu@formService = " + orderMenu);
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		System.out.println("orderId@formServlet = " + orderId);
		request.setAttribute("orderId", orderId);
		
		System.out.println("----------------------------");
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		System.out.println("----------------------------");
		request.getRequestDispatcher("/WEB-INF/views/review/reviewForm.jsp")
			   .forward(request, response);
	}

}
