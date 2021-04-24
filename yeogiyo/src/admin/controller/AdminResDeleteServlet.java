package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import restaurant.model.service.RestaurantService;

/**
 * Servlet implementation class AdminResDeleteServlet
 */
@WebServlet("/admin/resDelete")
public class AdminResDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int resId = Integer.parseInt(request.getParameter("resId"));
		
		int result = new RestaurantService().deleteRes(resId);
		
		String msg = result > 0 ? "가게 삭제 완료" : "가게 삭제 실패";
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/admin/resManage");
	}

}
