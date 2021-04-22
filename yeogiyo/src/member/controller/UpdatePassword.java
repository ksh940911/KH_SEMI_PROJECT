package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/member/updatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * 비밀번호 변경 페이지로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/updatePwd.jsp")
		.forward(request, response);
	}

	/**
	 * 비밀번호 변경 폼 제출
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getContextPath();
		String msg = null;
		int result = 0;
		
		//사용자 입력값 처리 : 기존비밀번호/신규비밀번호 암호화처리 필수
		String oldPassword = MvcUtils.getSha512(request.getParameter("password"));
		String newPassword = MvcUtils.getSha512(request.getParameter("newPassword"));
		
		//기존비밀번호 비교 : session의 loginMember객체 이용할 것
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(oldPassword.equals(loginMember.getPassword())) {
			//3. 업무로직 : 기존비밀번호가 일치한 경우만 신규비밀번호로 업데이트한다.
			loginMember.setPassword(newPassword);
			result = memberService.updateMemberPassword(loginMember);
			msg = (result > 0) ?
					"비밀번호를 성공적으로 변경했습니다." :
						"비밀번호 변경을 실패했습니다.";
			location += "/member/memberView";
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			location += "/member/updatePassword";
		}
		
		
		//사용자경고창 및 리다이렉트 처리
		session.setAttribute("msg", msg);
		response.sendRedirect(location);
	}

}
