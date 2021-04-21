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
		System.out.println("kakaoApprovalServlet doGet!");
		
		//1. 사용자입력정보 처리
		Order order = (Order)request.getSession().getAttribute("order");
		
		//2. 비즈니스 로직
		//사용자 입력정보 주문테이블에 담기
		int result = orderService.insertOrder(order);
//		int orderId = 
//		System.out.println("result@approvalServlet = " + result);
		
		
		request.getRequestDispatcher("/WEB-INF/views/order/approval.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
