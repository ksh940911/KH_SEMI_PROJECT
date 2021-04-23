package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import review.model.dao.ReviewDao;
import review.model.vo.ReviewPhoto;
import review.model.vo.Review;

public class ReviewService {

	private ReviewDao reviewDao = new ReviewDao();

	public List<Review> selectList(int start, int end) {
		Connection conn = getConnection();
		List<Review> list = reviewDao.selectList(conn, start, end);
		close(conn);
		return list;
	}

	public int selectReviewCount() {
		Connection conn = getConnection();
		int totalContents = reviewDao.selectReviewCount(conn);
		close(conn);
		return totalContents;
	}
	
	/**
	 * 첨부파일 있는 경우, attach객체를 attachment테이블에 등록한다. 
	 * - board등록, attachment등록은 하나의 트랜잭션으로 처리되어야한다.
	 * - 하나의 Connection에 의해 처리되어야한다.
	 * 
	 * @param review
	 * @return
	 */
	public int insertReview(Review review) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = reviewDao.insertReview(conn, review);
			
			//생성된 review_no를 가져오기
			int reviewNo = reviewDao.selectLastReviewNo(conn);
			//redirect location설정
			review.setReviewNo(reviewNo);
			
			if(review.getReviewphoto() != null) {
				//참조할 reviewNo세팅
				review.getReviewphoto().setReviewNo(reviewNo);
				result = reviewDao.insertReviewPhoto(conn, review.getReviewphoto());
				System.out.println("insertReviewPhoto? @insertReview Service = " + result);
			}
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {			
			close(conn);
		}
		return result;
	}
}
