package notice.model.vo;

public class NoticeImg {

	private int imgNo;
	private int noticeNo;
	private String originalFilname;
	private String renamedFilename;
	private Boolean status;

	public NoticeImg() {
		super();
	}

	public NoticeImg(int imgNo, int noticeNo, String originalFilname, String renamedFilename, Boolean status) {
		super();
		this.imgNo = imgNo;
		this.noticeNo = noticeNo;
		this.originalFilname = originalFilname;
		this.renamedFilename = renamedFilename;
		this.status = status;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getOriginalFilname() {
		return originalFilname;
	}

	public void setOriginalFilname(String originalFilname) {
		this.originalFilname = originalFilname;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NoticeImg [imgNo=" + imgNo + ", noticeNo=" + noticeNo + ", originalFilname=" + originalFilname
				+ ", renamedFilename=" + renamedFilename + ", status=" + status + "]";
	}

}
