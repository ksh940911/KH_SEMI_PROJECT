package notice.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFormServlet
 */
@WebServlet("/admin/noticeForm")
public class NoticeFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int resId = Integer.parseInt(request.getParameter("resId"));
		request.setAttribute("resId", resId);
		request.getRequestDispatcher("/WEB-INF/views/admin/noticeForm.jsp").forward(request, response);
		
	}

}
