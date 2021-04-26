package notice.model.sevice;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticeImg;

public class NoticeService {

	private NoticeDao noticeDao = new NoticeDao();

	public Notice selectOne(int resId) {
		Connection conn = getConnection();
		Notice notice = noticeDao.selectOne(conn, resId);
		if(notice != null) {
			NoticeImg noticeImg = noticeDao.selectOneNoticeImg(conn, notice);
			notice.setNoticeImg(noticeImg);
		}
		close(conn);
		return notice;
	}

	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = noticeDao.insertNotice(conn, notice);
			if (notice.getNoticeImg() != null) {
				int noticeNo = noticeDao.selectLastNoticeNo(conn);				
				notice.getNoticeImg().setNoticeNo(noticeNo);
				result = noticeDao.insertNoticeImg(conn, notice.getNoticeImg());
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateNotice(Notice notice) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = noticeDao.updateNotice(conn, notice);
			if (notice.getNoticeImg() != null) {
				result = noticeDao.insertNoticeImg(conn, notice.getNoticeImg());
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = noticeDao.deleteNotice(conn, noticeNo);
			if (result == 0)
				throw new IllegalArgumentException("해당 공지가 존재하지 않습니다. : " + noticeNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteNoticeImg(String imgNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = noticeDao.deleteNoticeImg(conn, imgNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

}
