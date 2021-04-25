package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import review.model.service.ReviewService;
import review.model.vo.ReviewPhoto;
import review.model.vo.Review;
import common.YeogiyoFileRenamePolicy;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/review/reviewUpdate")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService = new ReviewService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resId = Integer.parseInt(request.getParameter("resId"));
		System.out.println("resId@formService = " + resId);
		request.setAttribute("resId", resId);
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		Review review = reviewService.selectOne(reviewNo);
		request.setAttribute("review", review);
		
		request.getRequestDispatcher("/WEB-INF/views/review/reviewUpdateForm.jsp")
			   .forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
