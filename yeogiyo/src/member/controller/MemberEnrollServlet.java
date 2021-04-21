package member.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 회원가입 페이지로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp")
		       .forward(request, response);
	}

	/**
	 * 회원가입 처리 - DB 저장
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값에 한글이 있기 때문에 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		//2.전송값 꺼내서 변수에 기록
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String password = MvcUtils.getSha512(request.getParameter("password"));
		String _birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String addressSub = request.getParameter("addressSub");
		String addresExt = request.getParameter("extraAddress");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		

		//상세주소 + 참고항목 합치기
		if(addresExt != null)
			addressSub += addresExt;
		
		//Date type으로 변환
		Date birthday = null;
		if(_birthday != null && !"".equals(_birthday)) 
			birthday = Date.valueOf(_birthday);
		
		Member member = new Member(memberId, memberName, password, birthday, gender, address, addressSub, phone, email, null, MemberService.MEMBER_ROLE);
		//System.out.println(member);
		
		//3. 서비스 로직 호출
		int result = new MemberService().insertMember(member);
		
		//4. 사용자 피드백 및 페이지 리다이렉트
		HttpSession session = request.getSession();
		String msg = null;
		if(result > 0) {
			session.setAttribute("msg", "회원 가입에 성공했습니다.");
			System.out.println("회원가입 성공하셨습니다.");
		}
		else {
			session.setAttribute("msg", "회원 가입에 실패했습니다.");
			System.out.println("회원가입 실패하셨습니다.");
		}
		
		//일단 회원가입에 성공하든 실패하든 index 페이지로 이동
		response.sendRedirect(request.getContextPath());
		return;
		
	}

}
