package notice.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.YeogiyoFileRenamePolicy;
import notice.model.sevice.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.NoticeImg;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/admin/noticeUpdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력값 
		int resId = Integer.parseInt(request.getParameter("resId"));
		
		// 로직
		Notice notice = noticeService.selectOne(resId);
		
		// jsp forwarding
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/WEB-INF/views/admin/noticeUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 저장 파일 셋팅
			String saveDirectory = getServletContext().getRealPath("/upload/notice");
			int maxPostSize = 10 * 1024 * 1024;
			String encoding = "utf-8";
			
			// 파일명 변경정책 객체 : 중복파일인 경우 넘버링처리
			FileRenamePolicy policy = new YeogiyoFileRenamePolicy();
			MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			
			// 입력값
			int noticeNo = Integer.parseInt(multipartRequest.getParameter("noticeNo"));
			int resId = Integer.parseInt(multipartRequest.getParameter("resId"));
			String noticeTitle = multipartRequest.getParameter("noticeTitle");
			String noticeContent = multipartRequest.getParameter("noticeContent");
			String originalFileName = multipartRequest.getOriginalFileName("upImgFile");
			String renamedFileName = multipartRequest.getFilesystemName("upImgFile");

			String imgNo = multipartRequest.getParameter("delImgFile");
			
			Notice notice = new Notice();
			notice.setResId(resId);
			notice.setNoticeNo(noticeNo);
			notice.setNoticeTitle(noticeTitle);
			notice.setNoticeContent(noticeContent);

			// 첨부이미지 있는경우
			if(originalFileName != null) {
				NoticeImg noticeImg = new NoticeImg();
				noticeImg.setNoticeNo(noticeNo);
				noticeImg.setOriginalFilname(originalFileName);
				noticeImg.setRenamedFilename(renamedFileName);
				notice.setNoticeImg(noticeImg);
			}
			
			// 로직
			int result = 0;
			
			// 이미지 삭제시
			if(imgNo != null) {
				result = noticeService.deleteNoticeImg(imgNo);
			}

			result = noticeService.updateNotice(notice);
			String msg = (result > 0) ? "공지  수정 완료" : "공지 수정 실패";
			String location = request.getContextPath() + "/admin/noticeView?resId=" + notice.getResId();

			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(location);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}

}
