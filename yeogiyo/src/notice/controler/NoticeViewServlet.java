package notice.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;
import notice.model.exception.NoticeException;
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

		try {
			int resId = 0;
			System.out.println(request.getParameter("resId"));
			// 공지찾기용 가게번호 참조
			try {
				resId = Integer.parseInt(request.getParameter("resId"));
			} catch (NumberFormatException e) {
				throw new NoticeException("가게가 존재하지 않습니다.", e);
			}

			// 가게 공지 불러오기
			Notice notice = noticeService.selectOne(resId);

			if (notice != null) {
				// xss공격방지
				notice.setNoticeTitle(MvcUtils.escapeHtml(notice.getNoticeTitle()));
				notice.setNoticeContent(MvcUtils.escapeHtml(notice.getNoticeContent()));

				// \n 개행문자를 <br/>태그로 변경
				notice.setNoticeContent(MvcUtils.convertLineFeedToBr(notice.getNoticeContent()));
			}
			
			request.setAttribute("notice", notice);
			System.out.println("notice@ViewServlet = "+notice);
			request.setAttribute("resId", resId);
			System.out.println("resId@ViewServlet = "+resId);
			request.getRequestDispatcher("/WEB-INF/views/admin/noticeView.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

}
