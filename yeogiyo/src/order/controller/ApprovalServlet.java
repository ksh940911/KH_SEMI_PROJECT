package order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class KakaoApprovalServlet
 */
@WebServlet("/order/approval.do")
public class ApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//결제 성공 시 doGet()메소드 호출됨
		System.out.println("ApprovalServlet doGet!");
		
		//OrderServlet에서 가져온 사용자입력값.
		Order order = (Order)request.getSession().getAttribute("order");
		System.out.println("order@approvalServlet = " + order);
		//String paymentWay = (String)request.getSession().getAttribute("paymentWay");
		
		
		//if(OrderService.CREDIT_CARD.equals(paymentWay)) {
		
		//아임포트 결제 완료로 넘어왔을 시
//		if(OrderService.CREDIT_CARD.equals(paymentWay)) {
//			System.out.println("아임포트로 결제하고 넘어왔어요.");
//			
//		} 
//		//카카오 결제 완료로 넘어왔을 시,
//		else if(OrderService.KAKAO_PAY.equals(paymentWay)) {
//		
//		}
//		else {
//			System.out.println("현금이요 @ApprovalServlet");
//		}
		
		
		//1. 사용자입력정보 처리
		
		//2. 비즈니스 로직
		//사용자 입력정보 주문테이블에 담기
		int result = orderService.insertOrder(order);
		System.out.println("insert result @approvalServlet = " + result);
		
		//주문테이블에 받은 주문정보 객체 가져오기
		//order by order_date desc로 정렬하고 rownum으로 맨위에꺼만 가져오기? 
		//->동시에 다른 유저가 주문해버리면 안되자너...memberId로 조회
		String memberId = order.getMemberId();
		order = orderService.selectLastOrderById(memberId);
		System.out.println("inserted order@approvalServlet =" + order);
		
		//주문테이블에 입력한 정보 가져와서 다시 세션에 담기
		request.getSession().setAttribute("order", order);
		
		
		request.getRequestDispatcher("/WEB-INF/views/order/approval.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//아임포트 결제 완료 시
		
		request.getRequestDispatcher("/WEB-INF/views/order/approval.jsp").forward(request, response);
	}

}
