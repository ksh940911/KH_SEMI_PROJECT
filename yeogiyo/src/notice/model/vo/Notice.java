package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeId;
	private int resId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeImg;
	private Date noticeEnrollDate;

	public Notice() {
		super();
	}

	public Notice(int noticeId, int resId, String noticeTitle, String noticeContent, String noticeImg,
			Date noticeEnrollDate) {
		super();
		this.noticeId = noticeId;
		this.resId = resId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeImg = noticeImg;
		this.noticeEnrollDate = noticeEnrollDate;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeImg() {
		return noticeImg;
	}

	public void setNoticeImg(String noticeImg) {
		this.noticeImg = noticeImg;
	}

	public Date getNoticeEnrollDate() {
		return noticeEnrollDate;
	}

	public void setNoticeEnrollDate(Date noticeEnrollDate) {
		this.noticeEnrollDate = noticeEnrollDate;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", resId=" + resId + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", noticeImg=" + noticeImg + ", noticeEnrollDate=" + noticeEnrollDate + "]";
	}

}
