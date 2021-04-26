package order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import order.model.service.KakaoPay;
import order.model.service.OrderService;
import order.model.vo.KakaoResult;
import order.model.vo.Order;
import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order/order.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 입력값 처리 (가게아이디)
		int resId = Integer.parseInt(request.getParameter("resId"));
		//System.out.println("resId@Orderservlet = " + resId);
		
		//2. 비즈니스로직 : 가게 아이디로 가게객체 가져오기
		Restaurant restaurant = new RestaurantService().selectRestaurant(resId);
		//System.out.println("restaurant @orderServlet = " + restaurant);
		
		//3. 결제페이지 보여주기
		request.setAttribute("restaurant", restaurant);
		request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("path@OrderServlet = " + request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//1. 사용자 입력값 처리
		String memberId = request.getParameter("member_id");
		int resId = Integer.parseInt(request.getParameter("res_id"));
		String address = request.getParameter("address");
		String addressSub = request.getParameter("address-sub");
		String phone = request.getParameter("phone");
		String orderComment = request.getParameter("order-comment");
		String paymentWay = request.getParameter("payment_way");
		String paymentPlace = request.getParameter("payment_place");
		String orderMenu = (String)request.getParameter("order_menu");
		int totalPrice = Integer.parseInt(request.getParameter("total_price"));
		
		
		Order order = new Order();
		order.setMemberId(memberId);
		order.setResId(resId);
		order.setAddress(address);
		order.setAddressSub(addressSub);
		order.setPhone(phone);
		order.setOrderComment(orderComment);
		order.setPaymentWay(paymentWay);
		order.setPaymentPlace(paymentPlace);
		order.setTotalPrice(totalPrice);
		order.setOrderMenu(orderMenu);
		System.out.println("order@OrderServlet = " + order);
		
		//세션에 사용자입력값과 결제방식 담기 
		request.getSession().setAttribute("order", order);
		request.getSession().setAttribute("paymentWay", paymentWay);

		
		//결제방식 분기처리
		
		if(OrderService.ONLINE.equals(paymentPlace)) {
			System.out.println("온라인");
			//온라인 결제
			if(OrderService.CREDIT_CARD.equals(paymentWay)) {
				System.out.println("신카 OrderServlet");
				//신용카드. 아임포트 api...를 하려고 했떠니 제이쿼리 라이브러리네..?
				
				//approvalServlet으로 redirect
				response.sendRedirect(request.getContextPath() + "/order/approval.do");
				
			}
			else if(OrderService.KAKAO_PAY.equals(paymentWay)) {
				System.out.println("카카오");
				//카카오페이 api
				String kakaoJSON = new KakaoPay().requestKakaoPay(memberId, orderMenu);
				System.out.println("kakaoJSON @OrderServlet = " + kakaoJSON);
				
				Gson gson = new Gson();
				KakaoResult kakao = gson.fromJson(kakaoJSON, KakaoResult.class);
				System.out.println("tid = " + kakao.getTid());
				System.out.println("next_redirect_pc_url = " + kakao.getNextRedirectPcUrl()); //사용자가 볼 결제화면
				System.out.println("created_at = " + kakao.getCreatedAt());
				
				response.sendRedirect(kakao.getNextRedirectPcUrl());
				
			}
		}else if(OrderService.OFFLINE.equals(paymentPlace)) {
			System.out.println("오프라인.현장결제");
			//현장결제
			
			//approvalServlet으로 redirect
			response.sendRedirect(request.getContextPath() + "/order/approval.do");
		}
		
		
	}

}
