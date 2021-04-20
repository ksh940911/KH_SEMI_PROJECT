package review.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String memberId;
	private int orderNo;
	private Date reviewTime;
	private int reviewStar;
	private String reviewOrder;
	private String reviewContent;
	private ReviewPhoto reviewphoto;
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, String memberId, int orderNo, Date reviewTime, int reviewStar, String reviewOrder,
			String reviewContent, ReviewPhoto reviewphoto) {
		super();
		this.reviewNo = reviewNo;
		this.memberId = memberId;
		this.orderNo = orderNo;
		this.reviewTime = reviewTime;
		this.reviewStar = reviewStar;
		this.reviewOrder = reviewOrder;
		this.reviewContent = reviewContent;
		this.reviewphoto = reviewphoto;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewOrder() {
		return reviewOrder;
	}

	public void setReviewOrder(String reviewOrder) {
		this.reviewOrder = reviewOrder;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public ReviewPhoto getReviewphoto() {
		return reviewphoto;
	}

	public void setReviewphoto(ReviewPhoto reviewphoto) {
		this.reviewphoto = reviewphoto;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memberId=" + memberId + ", orderNo=" + orderNo + ", reviewTime="
				+ reviewTime + ", reviewStar=" + reviewStar + ", reviewOrder=" + reviewOrder + ", reviewContent="
				+ reviewContent + ", reviewphoto=" + reviewphoto + "]";
	}
}
