package restaurant.controller;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;

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
	
		// 정렬 
		String align = null;
		if(request.getParameter("alignSelect") == null)
			align = "all";
		else
			align = request.getParameter("alignSelect");

		String srchKeyword = request.getParameter("category_keyword");
		String srchCategory = request.getParameter("search_category");
		
		if(srchKeyword != null) {
//			System.out.println("srchKeyword : " + srchKeyword);
//			System.out.println("srchCategory : " + srchCategory);
//			category = srchCategory;
			if(!srchCategory.equals("전체보기")) {
				category = srchCategory;
				list = new RestaurantService().selectRestaurantListByKeyword(srchKeyword,category);
			}else {
				list = new RestaurantService().selectRestaurantListByKeyword(srchKeyword);
				category = "전체보기";
			}
		}else {
			//System.out.println("srchKeyword : " + srchKeyword);
			if(category != null) {
				//카테고리별 보기
				switch(category) {
					case "franchise" : category = "프랜차이즈"; break;
					case "chicken" : category = "치킨"; break;
					case "pizza" : category = "피자/양식"; break;
					case "chinese" : category = "중국집"; break;
					case "korean" : category = "한식"; break;
					case "japanese" : category = "일식/돈까스"; break;
					case "pork" : category = "족발/보쌈"; break;
					case "snack" : category = "분식"; break;
					case "cafe" : category = "카페/디저트"; break;
					case "convi" : category = "편의점"; break;
				}
				// 전체보기에서 정렬사용시 분기처리로 적용
				if(category.equals("전체보기"))
					list = new RestaurantService().selectRestaurantList(align);
				else
					list = new RestaurantService().selectRestaurantListByCategory(category, align);
			}else {
				//전체보기
				list = new RestaurantService().selectRestaurantList(align);
				category = "전체보기";
			}
		}
//		System.out.println("category : " + category);
//		System.out.println("category@restaurantListServlet = " + category);
//		System.out.println("align@restaurantListServlet = " + align);
//		System.out.println("list@servlet = " + list);
		request.setAttribute("align", align);
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/restaurant/restaurantList.jsp").forward(request, response);
	}
}
