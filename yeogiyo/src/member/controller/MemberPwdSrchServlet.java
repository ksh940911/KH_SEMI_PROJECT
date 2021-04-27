package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdSrchServlet
 */
@WebServlet("/member/searchPwd")
public class MemberPwdSrchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/searchPwd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String email = request.getParameter("email");
			//System.out.println("email@MemberPwdSrchServlet = " + email);
			
			Member member = memberService.selectMemberByEmail(email);
			//System.out.println("member@MemberPwdSrchServlet = " + member);
			
			response.setContentType("application/json; charset=utf-8");
			

			String jsonStr = "";
			String TemporaryPassword = "";
			Gson gson = new Gson();
			int updateResult = 0;
			int mailResult = 0;
			
			if(member == null) {
				jsonStr = gson.toJson(null);
				System.out.println("jsonStr = " + jsonStr);
			}else {
				//메일 서버 설정
				String host = "smtp.naver.com";  //이메일발송을 처리해줄 SMTP 서버
				String user = "yeogiyo6@naver.com";
				String password = "matzip2jo!";
				//보낼 메일주소
				String to_email = member.getEmail();
				//SMTP 서버 정보 설정
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				
				//임시비밀번호 생성
				StringBuffer temp =new StringBuffer();
				Random rnd = new Random();
				for(int i=0;i<10;i++)
				{
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				//String AuthenticationKey = temp.toString();
				TemporaryPassword = temp.toString();
				//System.out.println("임시비밀번호 : " + TemporaryPassword);
				
				//javax.mail.Session클래스 사용.  prop에 저장된 설정값을 저장하여 세션을 생성
				//SMTP서버 정보와 사용자 정보를 기반으로 Session클래스의 인스턴스를 생성
				Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user,password);
					}
				});
				
				//javax.mail.internet.MimeMessage 클래스 사용. message클래스 객체를 사용
				try {
					MimeMessage msg = new MimeMessage(mailSession);
					msg.setFrom(new InternetAddress(user, "Yeogiyo")); //발신자
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email)); //수신자
					
					//메일 제목
					msg.setSubject("안녕하세요 여기요입니다.");
					//메일 내용
					//msg.setText("임시비밀번호는 :" + temp);
					msg.setText("임시비밀번호 : " + TemporaryPassword);
					
					Transport.send(msg); //메일전송
					System.out.println("이메일 전송 성공");
					mailResult = 1;
					
				}catch (Exception e) {
					System.out.println("이메일 전송 실패");
					e.printStackTrace();
				}
			}
			
			
			if(mailResult == 1) {
				TemporaryPassword = MvcUtils.getSha512(TemporaryPassword);
				member.setPassword(TemporaryPassword);
				updateResult = memberService.updateMemberPassword(member);
				jsonStr = gson.toJson((updateResult > 0) ? "성공" : "실패");
				//System.out.println("jsonStr = " + jsonStr);		
			}
			
			
			
			PrintWriter out = response.getWriter(); //출력스트림을 사용해서 응답메세지작성
			out.print(jsonStr);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		
	}

}
