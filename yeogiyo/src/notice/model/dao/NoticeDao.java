package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import notice.model.exception.NoticeException;
import notice.model.vo.Notice;
import notice.model.vo.NoticeImg;

public class NoticeDao {

	private Properties prop = new Properties();

	public NoticeDao() {
		String fileName = "/sql/notice/notice-query.properties";
		String absPath = NoticeDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(absPath));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Notice selectOne(Connection conn, int resId) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOne");
//			select * from notice where res_id = ? 
// 			조건 : 가게아이디로 조회 + 가장 최근에 작성 된 공지글 하나만 필요 <쿼리짜야됨
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				notice = new Notice();
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setResId(rset.getInt("res_id"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setNoticeDate(rset.getDate("notice_date"));
			}
		} catch (Exception e) {
			throw new NoticeException("공지 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}

	public int selectLastNoticeNo(Connection conn) {
		int noticeNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastNoticeNo");
//			select seq_tb_notice_no.currval notice_no from dual
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				noticeNo = rset.getInt("notice_no");
			}
		} catch (SQLException e) {
			throw new NoticeException("공지등록 번호 조회 오류");
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeNo;
	}

	public NoticeImg selectOneNoticeImg(Connection conn, int noticeNo) {
		NoticeImg noticeImg = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOneNoticeImg");
//			select * from noticeImg where notice_no = ? 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				noticeImg = new NoticeImg();
				noticeImg.setImgNo(rset.getInt("img_no"));
				noticeImg.setNoticeNo(rset.getInt("notice_no"));
				noticeImg.setOriginalFilname(rset.getString("original_filename"));
				noticeImg.setRenamedFilename(rset.getString("renamed_filename"));
				noticeImg.setStatus("Y".equals(rset.getNString("img_status")) ? true : false);
			}
		} catch (Exception e) {
			throw new NoticeException("이미지 첨부파일 조회오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeImg;
	}

	public int insertNotice(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
//			insert into notice(notice_no, res_id, notice_title, notice_content) values(seq_tb_notice_no.nextval, ?, ?, ?)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice.getResId());
			pstmt.setString(2, notice.getNoticeTitle());
			pstmt.setString(3, notice.getNoticeContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new NoticeException("공지 등록 오류", e);
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateNotice(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
//		update notice set notice_title = ?, notice_content = ? where notice_no = ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, notice.getNoticeNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new NoticeException("공지 수정 오류", e);
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
//		delete from notice where notice_no = ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new NoticeException("공지 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertNoticeImg(Connection conn, NoticeImg noticeImg) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoticeImg");
//			insert into notice_img(img_no, notice_no, img_originalfile, img_renamed_file) values(seq_tb_notice_img_no.nextval, ?, ?, ?)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeImg.getNoticeNo());
			pstmt.setString(2, noticeImg.getOriginalFilname());
			pstmt.setString(3, noticeImg.getRenamedFilename());
		} catch (SQLException e) {
			throw new NoticeException("공지 이미지파일 등록 오류");
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNoticeImg(Connection conn, String imgNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNoticeImg");
//		update noticeImg set img_status = 'N' where img_no = ? 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imgNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new NoticeException("이미지 첨부파일 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

}
