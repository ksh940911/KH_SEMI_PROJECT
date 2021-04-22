package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
	/**
	 * 회원 정보 변경 페이지 제공
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberUpdate.jsp")
				.forward(request, response);
	}

	/**
	 * 회원 정보 변경 form 제출
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String _birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String addressSub = request.getParameter("addressSub");
		String email = request.getParameter("email");
		
		//생일 날짜 타입으로 변경
		Date birthday = null;
		if(_birthday != null && !"".equals(_birthday)) {
			birthday = Date.valueOf(_birthday);
		}
		
		Member member = new Member(memberId, memberName, null, birthday, gender, address, addressSub, null, email, null, MemberService.MEMBER_ROLE);
		
		//업무 로직
		int result = memberService.updateMember(member);
		
		//사용자 피드백 및 리다이렉트 처리
		HttpSession session = request.getSession();
		String msg = "";
		
		if(result > 0) {
			msg = "성공적으로 회원 정보를 수정했습니다.";
			//세션 정보도 같이 갱신
			session.setAttribute("loginMember", memberService.selectMemberById(memberId));
		}
		
		else {
			msg = "회원정보 수정에 실패했습니다.";
		}
		session.setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/member/memberView");
		
	}

}
