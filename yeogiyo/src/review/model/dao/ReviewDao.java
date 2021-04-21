package review.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import review.model.exception.ReviewException;
import review.model.vo.ReviewPhoto;
import review.model.exception.ReviewException;
import review.model.vo.ReviewPhoto;
import review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		//board-query.properties의 내용읽어와서 prop에 저장
		//resources/sql/board-query.properties가 아니라
		//WEB-INF/classes/sql/board/board-query.properties에 접근해야함.
		String fileName = "/sql/review/review-query.properties";
		String absPath = ReviewDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(absPath));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Review> selectList(Connection conn, int start, int end) {
		List<Review> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				Review review = new Review();
				review.setReviewNo(rset.getInt("review_no"));
				review.setMemberId(rset.getString("member_id"));
				review.setOrderId(rset.getInt("order_id"));
				review.setReviewTime(rset.getDate("review_time"));
				review.setReviewStar(rset.getInt("review_star"));
				review.setReviewOrder(rset.getString("review_order"));
				review.setReviewContent(rset.getString("review_content"));
				
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectReviewCount(Connection conn) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				totalContents = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}

	public int insertReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReview");
		try {
			
		//	insertReview = insert into review (review_no, member_id, order_id, review_time, 
		//			review_star, review_order, review_content) values(seq_review_review_no, ?, ?, sysdate, ?, ?, ?)
			
			/**
			 * 
				member_id varchar2(100) not null, 
				order_id number not null,
				
				review_star number default 5, 
				review_order varchar2(100),
				review_content varchar2(200) not null,
			 */
			
			System.out.println("review@reviewDao = " + review);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  review.getMemberId());
			pstmt.setInt(2, review.getOrderId());
			pstmt.setInt(3, review.getReviewStar());
			pstmt.setString(4, review.getReviewOrder());
			pstmt.setString(5, review.getReviewContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			//throw new ReviewException("리뷰 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectLastReviewNo(Connection conn, String memberId) {
		int reviewNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastReviewNo");
		//selectLastReviewNo = select seq_review_review_no.currval review_no from dual
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				reviewNo = rset.getInt("review_no");
			}
		} catch (SQLException e) {
			throw new ReviewException("리뷰 등록번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return reviewNo;
	}
	
	public int insertReviewPhoto(Connection conn, ReviewPhoto reviewphoto) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReviewPhoto");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewphoto.getReviewNo());
			pstmt.setString(2, reviewphoto.getPhotoOriginalFilename());
			pstmt.setString(3, reviewphoto.getPhotoRenamedFilename());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReviewException("리뷰 첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
}





