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
import restaurant.model.service.RestaurantService;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewPhoto;


/**
 * Servlet implementation class BoardEnrollServlet
 */
@WebServlet("/review/reviewEnroll")
public class ReviewEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService = new ReviewService();
	private OrderService orderService = new OrderService();
	private RestaurantService restaurantService = new RestaurantService();
	
	/**
	 * 0. form의 속성 enctype="multipart/form-data" 추가
	 * 1. MultipartRequest객체 생성 : 서버컴퓨터 파일 저장 
	 * 		- request
	 * 		- 저장경로
	 * 		- encoding
	 * 		- 최대허용크기
	 * 		- 파일명 변경정책 객체
	 * 2. db에 파일정보를 저장 
	 * 		- 사용자가 저장한 파일명 original_filename
	 * 		- 실제 저장된 파일명 renamed_filename
	 * 
	 * MultipartRequest객체를 사용하면, 
	 * 기존 HttpServletRequest에서는 사용자입력값에 접근할 수 없다.
	 * 
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
			String reviewstar = multipartRequest.getParameter("star");
			String content = multipartRequest.getParameter("content");
			String memberId = multipartRequest.getParameter("writer");
			int resId = Integer.parseInt(multipartRequest.getParameter("resId"));
			System.out.println("resID@reviewEnroll=" + resId);
			Order order = orderService.selectLastOrderById(memberId);
			int orderId = order.getOrderId();
			System.out.println("orderId@reviewEnroll=" + orderId);
			String reviewOrder = multipartRequest.getParameter("writer");
			
			//업로드한 파일명
			String originalFileName = multipartRequest.getOriginalFileName("reviewphoto");
			String renamedFileName = multipartRequest.getFilesystemName("reviewphoto");
			System.out.println("filename@reviewEnroll=" + originalFileName);
			
	//		Board board = new Board(0, title, writer, content, null, 0, null);
			Review review = new Review();
			review.setMemberId(memberId);
			review.setReviewStar(Integer.parseInt(reviewstar));
			review.setReviewContent(content);
			review.setOrderId(orderId);
			review.setResId(resId);
			
			//order테이블에 있는 주문내역 가져와서 세팅
			String orderMenu = multipartRequest.getParameter("orderMenu");
			System.out.println("orderMenu@reviewEnroll=" + orderMenu);
			review.setReviewOrder(orderMenu);
			
//			int menuCnt = Integer.parseInt(multipartRequest.getParameter("menuCnt"));
//			System.out.println("menuCnt@reviewEnroll=" + menuCnt);
			
			/*
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
			*/
			
			System.out.println("filename@" + originalFileName);
			//첨부파일이 있는 경우
			//multipartRequest.getFile("upFile"):File != null
			if(originalFileName != null) {
				ReviewPhoto reviewphoto = new ReviewPhoto();
				reviewphoto.setPhotoOriginalFilename(originalFileName);
				reviewphoto.setPhotoRenamedFilename(renamedFileName);
				
				review.setReviewphoto(reviewphoto);
			}
			
			//2-2. 업무로직 : db에 insert
			int result = reviewService.insertReview(review);
			String msg = (result > 0) ? 
							"리뷰 등록 성공!" :
								"리뷰 등록 실패!";
			String location = request.getContextPath()+ "/review/reviewList?resId=" + resId;
			//http://localhost:9090/yeogiyo/review/reviewList?resId=1
			
			//가게테이블에 리뷰 갯수 추가
			int reviewCount = reviewService.selectReviewCount(resId);
			int updateReviewCntResult = restaurantService.updateReviewCountByResId(resId, reviewCount);
			
			//가게 테이블에 별점 평균 추가
			int avgReviewStar = reviewService.selectAvgReviewStarByResId(resId);
			int updateAvgReviewStarResult = restaurantService.updateAvgReviewStarByResId(resId, avgReviewStar);
			
			//tb_order테이블 review_yn 컬럼 'Y'로 변경
			int updateReviewYN = orderService.updateReviewYNByOrderId(orderId);
								
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
