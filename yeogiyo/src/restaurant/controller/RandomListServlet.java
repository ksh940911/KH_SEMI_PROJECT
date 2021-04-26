package restaurant.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RandomListServlet
 */
@WebServlet("/restaurant/randomList")
public class RandomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Restaurant> list = new RestaurantService().selectRestaurantList();
		
		Random rnd = new Random();
		int rnum = rnd.nextInt(list.size()) + 1; //중복처리안함
		//int rnum = (int)(Math.random()*3)+1;
		//System.out.println(rnum);
        
        
		Restaurant choiceRes = new Restaurant();
		for(Restaurant r : list) {
			if(r.getResId() == rnum) {
				choiceRes = r;
			}
			
		}
		String category = "오늘뭐먹지";
		request.setAttribute("category", category);
		request.setAttribute("restaurant", choiceRes);
		request.getRequestDispatcher("/WEB-INF/views/restaurant/randomList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
