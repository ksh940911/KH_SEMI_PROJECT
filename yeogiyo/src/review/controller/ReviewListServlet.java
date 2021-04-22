package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;
import notice.model.exception.NoticeException;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * - 기본으로 보여주는 댓글수 numPerPage 10개 
 */
@WebServlet("/review/reviewList")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService = new ReviewService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 인코딩처리는 EncodingFilter가 선처리 
		//1. 사용자 입력값
		final int numPerPage = 10;
		System.out.println("resId@listServlet=" + request.getParameter("resId"));
		int cPage = 1;
		
		int resId = Integer.parseInt(request.getParameter("resId"));
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));			
		} catch(NumberFormatException e) {
			
		}
		
		//2. 업무로직
		//a. contents영역 : start ~ end
		int start = (cPage - 1) * numPerPage + 1;
 		int end = cPage * numPerPage;
		List<Review> list = reviewService.selectList(start, end);
		System.out.println("list= " + list);
		
		//b. pageBar영역 
		int totalContents = reviewService.selectReviewCount();
		String url = request.getRequestURI();
		String pageBar = MvcUtils.getPageBar(cPage, numPerPage, totalContents, url);
		
		
		//3. 응답 html처리 jsp에 위임.
		request.setAttribute("list", list);
		request.setAttribute("resId", resId);
		System.out.println("resId@ViewServlet = "+resId);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/review/reviewList.jsp")
			   .forward(request, response);
	}
}
