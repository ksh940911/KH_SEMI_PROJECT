package restaurant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RestaurantListServlet
 */
@WebServlet("/restaurant/restaurantList.do")
public class RestaurantListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Restaurant> list = new RestaurantService().selectRestaurantList();
		
	
		
		System.out.println("list@servlet = " + list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/restaurant/restaurantList.jsp").forward(request, response);

	}

}
