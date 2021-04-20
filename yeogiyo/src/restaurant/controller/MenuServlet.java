package restaurant.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Menu;

/**
 * Servlet implementation class MenuServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/restaurant/menu.do" })
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. encoding
		response.setCharacterEncoding("utf-8");
		
		//1. input
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		//System.out.println("menuId@MenuServlet = " + menuId);
		
		//2. business logic: select menu
		Menu menu = new RestaurantService().selectMenu(menuId);
		
		//3. obj -> json, response
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		String jsonMenu = gson.toJson(menu);
		//System.out.println(jsonMenu);
		//request.setAttribute("jsonMenu", jsonMenu);
		//request.getRequestDispatcher("/WEB-INF/views/restaurant/menuList.jsp").forward(request, response);
		
	
		//test
		PrintWriter out = response.getWriter();
		out.print(jsonMenu);
	}

}
