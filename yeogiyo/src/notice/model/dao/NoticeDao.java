package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import notice.model.vo.Notice;
import notice.model.vo.NoticeImg;

public class NoticeDao {

		private Properties prop = new Properties();
		
		public NoticeDao() {
			String fileName = "sql/notice/notice-query.properties";
			String absPath = NoticeDao.class.getResource(fileName).getPath();
		
			try {
				prop.load(new FileReader(absPath));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		
		public Notice selectOne(Connection conn, int resId) {
			Notice notice = null;
			PreparedStatement pstmt = null;
			ResultSet rset =null;
			
			String sql = prop.getProperty("selectOne");
//			select * from notice where res_id = ?
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, resId);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					notice = new Notice();
					notice.setNoticeNo(rset.getInt("notice_no"));
					notice.setResId(rset.getInt("res_id"));
					notice.setNoticeTitle(rset.getString("notice_title"));
					notice.setNoticeContent(rset.getString("notice_content"));
					notice.setNoticeDate(rset.getDate("notice_date"));
				}
			} catch (Exception e) {
//				throw new NoticeException("공지 조회 오류", e);
			}finally {
				close(rset);
				close(pstmt);
			}
			return notice;
		}


		public NoticeImg selectOneNoticeImg(Connection conn, int noticeNo) {
			NoticeImg noticeImg = null;
			PreparedStatement pstmt =null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectOneNoticeImg");
//			select * from noticeImg where notice_no = ? 
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, noticeNo);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					noticeImg = new NoticeImg();
					noticeImg.setImgNo(rset.getInt("img_no"));
					noticeImg.setNoticeNo(rset.getInt("notice_no"));
					noticeImg.setOriginalFilname(rset.getString("original_filename"));
					noticeImg.setRenamedFilename(rset.getString("renamed_filename"));
					noticeImg.setStatus("Y".equals(rset.getNString("status")) ? true : false);
				}
			} catch (Exception e) {
//				throw new NoticeException("이미지 첨부파일 조회오류", e);
			} finally {
				close(rset);
				close(pstmt);
			}
			return noticeImg;
		}
		
		
}
