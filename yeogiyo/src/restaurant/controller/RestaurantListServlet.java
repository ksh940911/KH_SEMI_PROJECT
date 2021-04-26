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
		
		String srchKeyword = request.getParameter("category_keyword");
		String srchCategory = request.getParameter("search_category");
		
		if(srchKeyword != null) {
			//System.out.println("srchKeyword : " + srchKeyword);
			//System.out.println("srchCategory : " + srchCategory);
			//category = srchCategory;
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
				
				//System.out.println("카테고리 : " + category);
				list = new RestaurantService().selectRestaurantListByCategory(category);
					
			}else {
				//전체보기
				list = new RestaurantService().selectRestaurantList();
				category = "전체보기";
			}
		}
		
		
		
		
		//System.out.println("category : " + category);
	
		
		
		
		
		
		
		
		//System.out.println("category@restaurantListServlet = " + category);
		
		// 정렬이 기본이 아닌경우 정렬선택에 따라 리스트조회 order by 설정 값으로 변경
		
		String align = request.getParameter("alignSelect");
		//System.out.println("align@resList = "+ align);
//		if(!(align.equals("default"))) {
//			list = new RestaurantService().alignResList(align);
//		}
		
		//System.out.println("list@servlet = " + list);
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/restaurant/restaurantList.jsp").forward(request, response);

	}

	
	

}
