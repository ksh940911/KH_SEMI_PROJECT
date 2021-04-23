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
		
		List<Restaurant> list = null;
		
		//1. parameter
		String category = null;
		category = request.getParameter("category");
		
		
		if(category != null) {
			//카테고리별 보기
			
			switch(category) {
				case "franchise" : category = "프렌차이즈"; break;
				case "chicken" : category = "치킨"; break;
				case "chinese" : category = "중국집"; break;
				case "korean" : category = "한식"; break;
				case "japanese" : category = "일식/돈까스"; break;
				case "pork" : category = "족발/보쌈"; break;
				case "snack" : category = "분식"; break;
				case "cafe" : category = "카페/디저트"; break;
				case "convi" : category = "편의점"; break;
			}
			
			list = new RestaurantService().selectRestaurantListByCategory(category);
			
		}else {
			//전체보기
			list = new RestaurantService().selectRestaurantList();
			
		}
	
		System.out.println("category@restaurantServlet = " + category);
		
		
		System.out.println("list@servlet = " + list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/restaurant/restaurantList.jsp").forward(request, response);

	}

}
