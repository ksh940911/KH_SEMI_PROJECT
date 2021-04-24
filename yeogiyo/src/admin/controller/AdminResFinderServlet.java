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
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class AdminResFinderServlet
 */
@WebServlet("/admin/resFinder")
public class AdminResFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RestaurantService resService = new RestaurantService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchResName = request.getParameter("searchResName");
		final int numPerPage = 10;
		int cPage = 1;

		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		}

		Map<String, String> param = new HashMap<>();
		param.put("searchResName", searchResName);
		param.put("start", String.valueOf((cPage - 1) * numPerPage + 1));
		param.put("end", String.valueOf(cPage * numPerPage));

		List<Restaurant> list = resService.searchResName(param);
		int totalContents = resService.searchResNameCount(param);

		String url = request.getRequestURI();
		String pageBar = MvcUtils.getPageBar(cPage, numPerPage, totalContents, url);

		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/admin/resManage.jsp").forward(request, response);
	}

}
