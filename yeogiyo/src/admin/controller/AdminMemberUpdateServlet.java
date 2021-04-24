package admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdateServlet
 */
@WebServlet("/admin/memberUpdate")
public class AdminMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		System.out.println("memberId@servlet = " + memberId);
		
		Member member = memberService.selectMemberById(memberId);
		System.out.println("member@get = " + member);
		
		request.setAttribute("member", member);
		request.getRequestDispatcher("/WEB-INF/views/admin/memberUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수정 회원 기존 정보 조회
		String memberId = request.getParameter("memberId");
		Member oriMember = memberService.selectMemberById(memberId);
		System.out.println("oriMember = " + oriMember);
		
		// 비밀번호변경여부 확인 및 설정
		String password = request.getParameter("password");
	
		if(password.equals("****")) // 비밀번수 수정안할 경우
			password = oriMember.getPassword();
		else	//비밀번호 수정할 경우
			password = MvcUtils.getSha512(password);
		
		// 생일 날짜 타입으로 변경
		String _birthday = request.getParameter("birthday");
		Date birthday = null;
		if(_birthday != null && !"".equals(_birthday))
			birthday = Date.valueOf(_birthday);
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberName(request.getParameter("memberName"));
		member.setPassword(password);
		member.setBirthday(birthday);
		member.setGender(request.getParameter("gender"));
		member.setAddress(request.getParameter("address"));
		member.setAddressSub(request.getParameter("addressSub"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setMemberRole(request.getParameter("memberRole"));
		
		System.out.println("upMember= " + member);
		
		int result = memberService.adminUpdateMember(member);
		
		String msg = result > 0 ? "회원 정보 수정 성공." : "회원 정보 수정 실패.";
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/admin/memberManage");
	}

}
