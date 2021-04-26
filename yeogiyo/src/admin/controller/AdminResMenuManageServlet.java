package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;
import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Menu;

/**
 * Servlet implementation class AdminResMenuManage
 */
@WebServlet("/admin/menuManage")
public class AdminResMenuManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RestaurantService resService = new RestaurantService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final int numPerPage = 10;
		int cPage = 1;
		String resId = request.getParameter("resId");
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
		}
		
		Map<String, String> param = new HashMap<>();
		param.put("resId", resId);
		param.put("start", String.valueOf((cPage - 1) * numPerPage + 1));
		param.put("end", String.valueOf(cPage * numPerPage));
				
		List<Menu> list = resService.selectMenuList(param);
		int totalContents = resService.selectMenuCount(resId);
		
		String url = request.getRequestURI();
		String pageBar = MvcUtils.getPageBar(cPage, numPerPage, totalContents, url); 
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/admin/menuManage.jsp").forward(request, response);
	}
}
