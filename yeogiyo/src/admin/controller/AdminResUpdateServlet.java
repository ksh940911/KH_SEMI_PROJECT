package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class AdminResUpdateServlet
 */
@WebServlet("/admin/resUpdate")
public class AdminResUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RestaurantService resService = new RestaurantService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int resId = Integer.parseInt(request.getParameter("resId"));

		Restaurant res = resService.selectRestaurant(resId);
		System.out.println("res@resUpdate = " + res);
		request.setAttribute("res", res);
		request.getRequestDispatcher("/WEB-INF/views/admin/resUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // 수정 회원 기존 정보 조회 String
		
		int resId = Integer.parseInt(request.getParameter("resId"));
		
		Restaurant res = new Restaurant();
		res.setResId(resId);
		res.setResName(request.getParameter("resName"));
		res.setResAddress(request.getParameter("resAddress"));
		res.setCategory(request.getParameter("category"));
		res.setMinPrice(Integer.parseInt(request.getParameter("minPrice")));
		res.setLogoImg(request.getParameter("logoImg"));
		
//		int result = new MemberService().adminUpdateRes(res);

//		String msg = result > 0 ? "가게 정보 수정 성공." : "가게 정보 수정 실패.";

//		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/admin/resManage");
	}

}
