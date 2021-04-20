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
				review.setOrderNo(rset.getInt("order_no"));
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
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getReviewStar());
			pstmt.setString(2, review.getReviewContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReviewException("게시물 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}





