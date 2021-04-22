package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePhone
 */
@WebServlet("/member/updatePhone")
public class UpdatePhone extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * 페이지 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/updatePhone.jsp")
		.forward(request, response);		
	}

	/**
	 * 휴대폰 번호 업데이트
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getContextPath();
		String msg = null;
		int result = 0;
		
		//로그인 중인 멤버 가져오기
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		
		String phone = request.getParameter("phone");
		String memberId = member.getMemberId();
		
		result = memberService.updatePhone(phone, memberId);
		if(result > 0) {
			msg = "성공적으로 전화번호를 수정했습니다.";
			//세션 정보도 같이 갱신
			session.setAttribute("loginMember", memberService.selectMemberById(member.getMemberId()));
		}
		
		else {
			msg = "전화번호 수정에 실패했습니다.";
		}
		
		session.setAttribute("msg", msg);
		response.sendRedirect(location + "/member/memberView");
		
	}
	

}
