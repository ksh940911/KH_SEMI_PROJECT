package order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order/order.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 입력값 처리 (가게아이디)
		int resId = Integer.parseInt(request.getParameter("resId"));
		System.out.println("resId@servlet = " + resId);
		
		//2. 비즈니스로직 : 가게 아이디로 가게객체 가져오기
		Restaurant restaurant = new RestaurantService().selectRestaurant(resId);
		System.out.println("restaurant @orderServlet = " + restaurant);
		
		//3. 결제페이지 보여주기
		request.setAttribute("restaurant", restaurant);
		request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
