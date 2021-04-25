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

	public List<Review> selectList(Connection conn, int resId, int start, int end) {
		List<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			System.out.println("여기"+rset);
			while(rset.next()) {
				System.out.println("여기123"+rset.getInt("review_no"));
				Review review = new Review();
				review.setReviewNo(rset.getInt("review_no"));
				review.setMemberId(rset.getString("member_id"));
				review.setOrderId(rset.getInt("order_id"));
				review.setReviewTime(rset.getDate("review_time"));
				review.setReviewStar(rset.getInt("review_star"));
				review.setReviewOrder(rset.getString("review_order"));
				review.setReviewContent(rset.getString("review_content"));
				
				//첨부파일이 있는 경우
				if(rset.getInt("reviewphoto_no") != 0) {
					ReviewPhoto reviewphoto = new ReviewPhoto();
					reviewphoto.setPhotoNo(rset.getInt("reviewphoto_no"));
					reviewphoto.setReviewNo(rset.getInt("review_no"));
					reviewphoto.setPhotoOriginalFilename(rset.getString("photo_originalfilename"));
					reviewphoto.setPhotoRenamedFilename(rset.getString("photo_renamedfilename"));
					reviewphoto.setPhotoStatus("Y".equals(rset.getString("photo_status")) ? true : false);
					review.setReviewphoto(reviewphoto);
				}
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

	public int selectReviewCount(Connection conn, int resId) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resId);
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
			pstmt.setString(1,  review.getMemberId());
			pstmt.setInt(2, review.getOrderId());
			pstmt.setInt(3, review.getReviewStar());
			pstmt.setString(4, review.getReviewOrder());
			pstmt.setString(5, review.getReviewContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ReviewException("리뷰 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectLastReviewNo(Connection conn) {
		int reviewNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastReviewNo");
		//selectLastReviewNo = select seq_review_review_no.currval review_no from dual
		try {
			pstmt = conn.prepareStatement(sql);
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
			System.out.println(result);
		} catch (SQLException e) {
			throw new ReviewException("리뷰 첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteReview(Connection conn, int review_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReviewException("리뷰 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateReview");
		//updateReview = update review set review_star = ?, review_content = ? where review_no = ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getReviewStar());
			pstmt.setString(2, review.getReviewContent());
			pstmt.setInt(3, review.getReviewNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReviewException("리뷰 수정 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteReviewPhoto(Connection conn, String photo_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteReviewPhoto");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, photo_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReviewException("리뷰사진 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
}
