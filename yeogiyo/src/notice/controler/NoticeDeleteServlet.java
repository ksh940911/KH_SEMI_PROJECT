package notice.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.sevice.NoticeService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/admin/noticeDelete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
			int resId = Integer.parseInt(request.getParameter("resId"));
			
			int result = new NoticeService().deleteNotice(noticeNo);
			System.out.println("noticeNo@delServlet = " + noticeNo);
			String msg = result > 0 ? "공지 삭제 완료" : "공지 삭제 실패";

			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/admin/noticeView?resId=" + resId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
