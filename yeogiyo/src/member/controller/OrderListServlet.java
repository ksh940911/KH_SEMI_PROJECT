package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.MemberOrderList;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/member/orderList")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * 주문 내역 리스트
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		List<MemberOrderList> orderList = null;
		String memberId = member.getMemberId();
		
		//MemberId로 tb_order불러오기
		orderList = memberService.selectRestaurantListByMeberId(memberId);
		
		request.setAttribute("orderList", orderList);
		
		request.getRequestDispatcher("/WEB-INF/views/member/orderList.jsp")
		.forward(request, response);
	}
	
	

}
