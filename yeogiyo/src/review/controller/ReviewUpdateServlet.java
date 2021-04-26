package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import common.YeogiyoFileRenamePolicy;

import order.model.service.OrderService;
import order.model.vo.Order;
import order.model.vo.SelectedMenu;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewPhoto;


/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/review/reviewUpdate")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService = new ReviewService();
	private OrderService orderService = new OrderService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resId = Integer.parseInt(request.getParameter("resId"));
		System.out.println("resId@formService = " + resId);
		request.setAttribute("resId", resId);
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		System.out.println("reviewNo@listServlet = " + request.getParameter("reviewNo"));
		Review review = reviewService.selectOne(reviewNo);
		System.out.println("review= " + review);
		request.setAttribute("review", review);
		
		request.getRequestDispatcher("/WEB-INF/views/review/reviewUpdateForm.jsp")
			   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//1. MultipartRequest객체 생성
			// /WebContent/upload/board/업로드파일명.jpg 
			// web rool dir를 절대경로로 반환
			String saveDirectory = getServletContext().getRealPath("/upload/review");
			System.out.println("saveDirectory@servlet = " + saveDirectory);
			
			//최대파일허용크기 10mb = 10 * 1kb * 1kb
			int maxPostSize = 10 * 1024 * 1024;
			
			//인코딩
			String encoding = "utf-8";
			
			//파일명 변경정책 객체
			//중복파일인 경우, numbering처리
			//filerename : 20210406191919_123.jpg
	//		FileRenamePolicy policy = new DefaultFileRenamePolicy();
			YeogiyoFileRenamePolicy policy = new YeogiyoFileRenamePolicy();
			
			MultipartRequest multipartRequest = 
					new MultipartRequest(
									request, 
									saveDirectory, 
									maxPostSize, 
									encoding, 
									policy
								);
			
			//2. db에 게시글/첨부파일 정보 저장
			//2-1. 사용자 입력값처리
			int reviewNo = Integer.parseInt(multipartRequest.getParameter("reviewNo"));
			String reviewstar = multipartRequest.getParameter("star");
			String content = multipartRequest.getParameter("content");
			String memberId = multipartRequest.getParameter("writer");
			int resId = Integer.parseInt(multipartRequest.getParameter("resId"));
			System.out.println("resID@reviewEnroll=" + resId);
			Order order = orderService.selectLastOrderById(memberId);
			int orderId = order.getOrderId();
			System.out.println(orderId);
			String reviewOrder = multipartRequest.getParameter("writer");
			
			//업로드한 파일명
			String originalFileName = multipartRequest.getOriginalFileName("reviewphoto");
			String renamedFileName = multipartRequest.getFilesystemName("reviewphoto");
			
	//		Board board = new Board(0, title, writer, content, null, 0, null);
			Review review = new Review();
			review.setReviewNo(reviewNo);
			review.setMemberId(memberId);
			review.setReviewStar(Integer.parseInt(reviewstar));
			review.setReviewContent(content);
			review.setOrderId(orderId);
			
			
			String jsonOrderMenu = order.getOrderMenu();
			System.out.println("jsonOrderMenu@ReviewEnrollServlet = " + jsonOrderMenu);
			
			//JSON -> Object
			Gson gson = new Gson();
			SelectedMenu[] pResult = gson.fromJson(jsonOrderMenu, SelectedMenu[].class);
			
			StringBuilder sb = new StringBuilder();
			String menuSum = "";
			for(SelectedMenu sm : pResult) { 
				sb.append(sm.getMenuName() + ",");
			}
			sb.substring(0, sb.length()-2);
			menuSum = sb.toString();
			System.out.println(menuSum);
			review.setReviewOrder(menuSum);
			
			System.out.println("filename@" + originalFileName);
			//첨부파일이 있는 경우
			//multipartRequest.getFile("upFile"):File != null
			if(originalFileName != null) {
				ReviewPhoto reviewphoto = new ReviewPhoto();
				reviewphoto.setReviewNo(reviewNo);
				reviewphoto.setPhotoOriginalFilename(originalFileName);
				reviewphoto.setPhotoRenamedFilename(renamedFileName);
				
				review.setReviewphoto(reviewphoto);
			}
			
			//2-2. 업무로직 : db에 insert
			int result = reviewService.updateReview(review);
			String msg = (result > 0) ? 
							"리뷰 수정 성공!" :
								"리뷰 수정 실패!";
			String location = request.getContextPath()+ "/review/reviewList?resId=" + resId;
			//http://localhost:9090/yeogiyo/review/reviewList?resId=1
			
			
								
			System.out.println("review.getReviewNo" + review.getReviewNo());
			//3. DML요청 : 리다이렉트 & 사용자피드백
			// /mvc/review/reviewList로 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			request.setAttribute("resId", resId);
			System.out.println("resId@EnrollServlet = " + resId);
			response.sendRedirect(location);
		} catch (Exception e) {
			e.printStackTrace();
			throw e; // was한테 다시 던져서 에러페이지로 전환함.
		}
	}
}
