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
import restaurant.model.service.RestaurantService;
import restaurant.model.vo.Menu;


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
			int resId = Integer.parseInt(multipartRequest.getParameter("resId"));
			String noticeTitle = multipartRequest.getParameter("noticeTitle");
			String noticeContent = multipartRequest.getParameter("noticeContent");
			String originalFileName = multipartRequest.getOriginalFileName("upImgFile");
			String renamedFileName = multipartRequest.getFilesystemName("upImgFile");

			Notice notice = new Notice();
			notice.setNoticeTitle(noticeTitle);
			notice.setNoticeContent(noticeContent);
			notice.setResId(resId);
			
			// 첨부이미지 있는경우
			if(originalFileName != null) {
				NoticeImg noticeImg = new NoticeImg();
				noticeImg.setOriginalFilname(originalFileName);
				noticeImg.setRenamedFilename(renamedFileName);
				notice.setNoticeImg(noticeImg);
			}
			
			// 업무로직
			int result = new NoticeService().insertNotice(notice);
			String msg = (result > 0) ? "공지 등록 완료." : "공지 등록 실패";
			String location = request.getContextPath() + "/notice/noticeView?resId=" + notice.getResId();
			
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			request.setAttribute("resId", resId);
			response.sendRedirect(location);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
