package notice.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.sevice.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/admin/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int resId = 0;

		// 공지찾기용 가게번호 참조
		try {
			resId = Integer.parseInt(request.getParameter("res_id"));
		} catch (NumberFormatException e) {
//			throw new NoticeException("가게가 존재하지 않습니다.", e);
		}

		Notice notice = noticeService.selectOne(resId);
		if (notice == null) {
//			throw new NoticeException("공지 없음.");
		}

		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/WEB-INF/views/admin/noticeView/jsp").forward(request, response);

	}

}
