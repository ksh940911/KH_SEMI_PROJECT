package review.model.vo;

public class ReviewPhoto {
	
	private int photoNo;
	private int reviewNo;
	private String photoOriginalFilename;
	private String photoRenamedFilename;
	private boolean photoStatus;
	
	public ReviewPhoto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewPhoto(int photoNo, int reviewNo, String photoOriginalFilename, String photoRenamedFilename,
			boolean photoStatus) {
		super();
		this.photoNo = photoNo;
		this.reviewNo = reviewNo;
		this.photoOriginalFilename = photoOriginalFilename;
		this.photoRenamedFilename = photoRenamedFilename;
		this.photoStatus = photoStatus;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getPhotoOriginalFilename() {
		return photoOriginalFilename;
	}

	public void setPhotoOriginalFilename(String photoOriginalFilename) {
		this.photoOriginalFilename = photoOriginalFilename;
	}

	public String getPhotoRenamedFilename() {
		return photoRenamedFilename;
	}

	public void setPhotoRenamedFilename(String photoRenamedFilename) {
		this.photoRenamedFilename = photoRenamedFilename;
	}

	public boolean isPhotoStatus() {
		return photoStatus;
	}

	public void setPhotoStatus(boolean photoStatus) {
		this.photoStatus = photoStatus;
	}

	@Override
	public String toString() {
		return "ReviewPhoto [photoNo=" + photoNo + ", reviewNo=" + reviewNo + ", photoOriginalFilename="
				+ photoOriginalFilename + ", photoRenamedFilename=" + photoRenamedFilename + ", photoStatus="
				+ photoStatus + "]";
	}
}
