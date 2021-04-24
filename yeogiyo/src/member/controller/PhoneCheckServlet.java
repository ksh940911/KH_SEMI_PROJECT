package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class phoneCheckServlet
 */
@WebServlet("/member/memberPhoneCheck")
public class PhoneCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	PrintWriter out = response.getWriter();
        	
        	//ajax data로 받아온 값
        	String memberId = request.getParameter("id");
        	String newPhone = request.getParameter("newPhone");
        	String oldPhone = request.getParameter("oldPhone");
        	
        	//전화번호 중복 여부 판단
        	Member member = memberService.selectMemberByPhone(newPhone);
        	boolean available = member == null;
        	
        	if(newPhone == oldPhone || newPhone.equals(oldPhone)) {
        		available = true;
        		out.print(1);
        	} else if (available == true) {
        		out.print(1);
        	} else if (available == false) {
        		out.print(0);
        	}
        	
        	System.out.println("새 휴대폰 번호 : " + newPhone + ", 예전 휴대폰 번호 : " + oldPhone + "사용 가능 여부 : " + available);
        	
        }catch(Exception e) {
        	e.printStackTrace();
        	throw e;
        }
		
        
	}

}
