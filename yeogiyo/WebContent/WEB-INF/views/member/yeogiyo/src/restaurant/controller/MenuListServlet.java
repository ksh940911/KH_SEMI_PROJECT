package restaurant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Menu;
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class MenuListServlet
 */
@WebServlet("/restaurant/menuList.do")
public class MenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RestaurantService restaurantService = new RestaurantService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resId = Integer.parseInt(request.getParameter("res_id"));
//		System.out.println("resId@servlet = " + resId);
		
		//메뉴리스트 가져오기
		List<Menu> list = restaurantService.selectMenuList(resId);
//		System.out.println("menuList@servlet = " + list);
		
		//res_id에 대한 가게정보 가져오기
		Restaurant restaurant = restaurantService.selectRestaurant(resId);
		
		
		request.setAttribute("list", list);
		request.setAttribute("restaurant", restaurant);
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
