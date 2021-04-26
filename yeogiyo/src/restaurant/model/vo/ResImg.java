package restaurant.model.vo;

public class ResImg {

	private int imgResNo;
	private int imgResId;
	private String originalFilname;
	private String renamedFilename;
	private Boolean imgResStatus;

	public ResImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResImg(int imgResNo, int imgResId, String originalFilname, String renamedFilename, Boolean imgResStatus) {
		super();
		this.imgResNo = imgResNo;
		this.imgResId = imgResId;
		this.originalFilname = originalFilname;
		this.renamedFilename = renamedFilename;
		this.imgResStatus = imgResStatus;
	}

	public int getImgResNo() {
		return imgResNo;
	}

	public void setImgResNo(int imgResNo) {
		this.imgResNo = imgResNo;
	}

	public int getImgResId() {
		return imgResId;
	}

	public void setImgResId(int imgResId) {
		this.imgResId = imgResId;
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

	public Boolean getImgResStatus() {
		return imgResStatus;
	}

	public void setImgResStatus(Boolean imgResStatus) {
		this.imgResStatus = imgResStatus;
	}

	@Override
	public String toString() {
		return "ResImg [imgResNo=" + imgResNo + ", imgResId=" + imgResId + ", originalFilname=" + originalFilname
				+ ", renamedFilename=" + renamedFilename + ", imgResStatus=" + imgResStatus + "]";
	}

}
