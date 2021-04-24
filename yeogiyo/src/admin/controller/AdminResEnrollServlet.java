package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.YeogiyoFileRenamePolicy;
<<<<<<< Updated upstream
import notice.model.sevice.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.NoticeImg;
import restaurant.model.service.RestaurantService;
=======
import restaurant.model.service.RestaurantService;
import restaurant.model.vo.ResImg;
>>>>>>> Stashed changes
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class AdminResEnrollServlet
 */
@WebServlet("/admin/resEnroll")
public class AdminResEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/resEnroll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String saveDirectory = getServletContext().getRealPath("/upload/res");
			int maxPostSize = 10 * 1024 * 1024; 
			String encoding = "utf-8";
	
			FileRenamePolicy policy = new YeogiyoFileRenamePolicy();
								  
			MultipartRequest multipartRequest = 
					new MultipartRequest(
							request, 
							saveDirectory, 
							maxPostSize, 
							encoding, 
							policy);
			
			String resName = multipartRequest.getParameter("resName");
			String category = multipartRequest.getParameter("category");
			String resAddress = 
					multipartRequest.getParameter("address") + " " + 
					multipartRequest.getParameter("addressSub") + " " + 
					multipartRequest.getParameter("extraAddress");
			String originalFileName = multipartRequest.getOriginalFileName("upImgFile");
			String renamedFileName = multipartRequest.getFilesystemName("upImgFile");
			int minPrice = 	Integer.parseInt(multipartRequest.getParameter("minPrice"));
			
			Restaurant res = new Restaurant();
			res.setResName(resName);
			res.setCategory(category);
			res.setResAddress(resAddress);
			res.setMinPrice(minPrice);
			
			if(originalFileName != null) {
				ResImg resImg = new ResImg();
				resImg.setOriginalFilname(originalFileName);
				resImg.setRenamedFilename(renamedFileName);
				res.setResImg(resImg);
			}

			int result = new RestaurantService().insertRes(res);
			String msg = (result > 0) ? "가게 등록 완료." : "가게 등록 실패";
			String location = request.getContextPath() + "/admin/resManage";
			
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(location);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
