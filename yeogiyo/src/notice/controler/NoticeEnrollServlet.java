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


/**
 * Servlet implementation class NoticeEnrollServlet
 */
@WebServlet("/admin/noticeEnroll")
public class NoticeEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 저장 파일 셋팅
			String saveDirectory = getServletContext().getRealPath("/upload/notice"); // 업로드 파일 저장폴더
			int maxPostSize = 10 * 1024 * 1024; // 파일 최대 허용 크기 10MB?
			String encoding = "utf-8"; // 인코딩
	
			// 파일명 변경정책 객체 : 중복파일인 경우 넘버링처리
			FileRenamePolicy policy = new YeogiyoFileRenamePolicy();
										  
			
			MultipartRequest multipartRequest = 
					new MultipartRequest(
							request, 
							saveDirectory, 
							maxPostSize, 
							encoding, 
							policy);
			
			// 입력값
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			int resId = Integer.parseInt(multipartRequest.getParameter("resId"));
			
			String originalFileName = multipartRequest.getOriginalFileName("upImgFile");
			String renamedFileName = multipartRequest.getFilesystemName("upImgFile");
			
			Notice notice = new Notice();
			notice.setNoticeTitle(title);
			notice.setNoticeContent(content);
			notice.setResId(resId);
			
			// 업무로직
			int result = NoticeService.insertNotice(notice);
			String msg = (result > 0) ? "공지 등록 완료." : "공지 등록 실패";
			
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/admin/noticeView");
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
