package restaurant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.restaurant.model.service.RestaurantService;
import src.restaurant.model.vo.Menu;

/**
 * Servlet implementation class MenuListServlet
 */
@WebServlet("/restaurant/menuList.do")
public class MenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resId = Integer.parseInt(request.getParameter("resId"));
//		System.out.println("resId@servlet = " + resId);
		List<Menu> list = new RestaurantService().selectMenuList(resId);
		System.out.println("menuList@servlet = " + list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/restaurant/menuList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
