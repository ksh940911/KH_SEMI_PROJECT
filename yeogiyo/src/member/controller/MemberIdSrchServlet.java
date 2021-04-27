package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.SendSMS;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberIdSearchServlet
 */
@WebServlet("/member/searchId")
public class MemberIdSrchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/searchId.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			String phone = request.getParameter("phone");
			//System.out.println("phone@MemberIdSrchServlet = " + phone);
			String chk = request.getParameter("chk");
			//System.out.println("chk@MemberIdSrchServlet = " + chk);
			
			//response.setContentType("text/plain; charset=utf-8");
			response.setContentType("application/json; charset=utf-8");
			
			
			int result = 0;
			String msg = "";
			String jsonStr = "";
			Gson gson = new Gson();
			Random rnd = new Random();
			String num = "";
			if(chk == null) {
				//msg = (result == 1) ? "문자전송성공" : "문자전송실패"; 
				for(int i = 0; i < 4; i ++) {
					String ran = Integer.toString(rnd.nextInt(10));
					if(!num.contains(ran)) {
						num += ran;
					}else {
						i -= 1;
					}
				}
				result = SendSMS.verify(phone,num);
				jsonStr = gson.toJson(result == 1 ? num : "문자전송실패");
				//System.out.println("jsonStr = " + jsonStr);
			}
			
			if("1".equals(chk)) {
				Member member = memberService.selectMemberByPhone(phone);
				//msg = (member != null) ? member.getMemberId() : null;
				jsonStr = gson.toJson(member != null ? member.getMemberId() : null);
				//System.out.println("jsonStr = " + jsonStr);
			}
			
			PrintWriter out = response.getWriter(); //출력스트림을 사용해서 응답메세지작성
			out.print(jsonStr);
			
			//response.getWriter().println(msg);
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
