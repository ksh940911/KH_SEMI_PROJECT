package notice.model.sevice;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticeImg;

public class NoticeService {

	private NoticeDao noticeDao = new NoticeDao();

	public Notice selectOne(int resId) {
		Connection conn = getConnection();
		Notice notice = noticeDao.selectOne(conn, resId);
		NoticeImg noticeImg = noticeDao.selectOneNoticeImg(conn, notice.getNoticeNo());
		
		close(conn);
		return notice;
	}

	public static int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = 0;
		try {
		
			
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}
	

	
	
}
