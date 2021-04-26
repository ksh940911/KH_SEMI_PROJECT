package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.YeogiyoFileRenamePolicy;
import member.model.service.MemberService;
import restaurant.model.service.RestaurantService;
import restaurant.model.vo.ResImg;
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

		request.setAttribute("res", res);
		request.getRequestDispatcher("/WEB-INF/views/admin/resUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		
		try {
			String saveDirectory = getServletContext().getRealPath("/upload/res");
			int maxPostSize = 10 * 1024 * 1024;
			String encoding = "utf-8";
			FileRenamePolicy policy = new YeogiyoFileRenamePolicy();
			MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			
			int resId = Integer.parseInt(multipartRequest.getParameter("resId"));
			String resName = multipartRequest.getParameter("resName");
			String resAddress = 
					multipartRequest.getParameter("address") + " " + 
					multipartRequest.getParameter("addressSub") + " " + 
					multipartRequest.getParameter("extraAddress");
			int minPrice = Integer.parseInt(multipartRequest.getParameter("minPrice"));
			String category = multipartRequest.getParameter("category");		
			String originalFileName = multipartRequest.getOriginalFileName("upImgFile");
			String renamedFileName = multipartRequest.getFilesystemName("upImgFile");
					
			String imgResNo = multipartRequest.getParameter("delImgFile");
			
			
			Restaurant res = new Restaurant();
			res.setResId(resId);
			res.setResName(resName);
			res.setResAddress(resAddress);
			res.setCategory(category);
			res.setMinPrice(minPrice);
			
			if(originalFileName != null) {
				ResImg resImg = new ResImg();
				resImg.setImgResId(resId);
				resImg.setOriginalFilname(originalFileName);
				resImg.setRenamedFilename(renamedFileName);
				res.setResImg(resImg);
				
			}
			int result = 0;
			if(imgResNo != null) {
				result = resService.deleteResImg(imgResNo); 
			}
			
			result = resService.updateRes(res);
	
			String msg = result > 0 ? "가게 정보 수정 성공." : "가게 정보 수정 실패.";
	
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/admin/resManage");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
