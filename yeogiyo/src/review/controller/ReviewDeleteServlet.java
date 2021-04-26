package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/review/reviewDelete")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReviewService reviewService = new ReviewService();
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resId = Integer.parseInt(request.getParameter("resId"));
		System.out.println("resId@deleteServlet = " + resId);
		request.setAttribute("resId", resId);
		
		try {
			//1.사용자 입력값
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			
			//2.업무로직
			int result = reviewService.deleteReview(reviewNo);
			String msg = result > 0 ?
							"리뷰 삭제 성공!" :
								"리뷰 삭제 실패!";
			
			//3.리다이렉트 & 사용자피드백
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/review/reviewList?resId=" + resId);
		} catch (Exception e) {
			//예외 로깅
			e.printStackTrace();
			//예외페이지 전환을 위해서 was에 예외던짐.
			throw e;
		}
	}
}
