package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private int resId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private NoticeImg noticeImg;

	public Notice() {
		super();
	}

	public Notice(int noticeNo, int resId, String noticeTitle, String noticeContent, Date noticeDate,
			NoticeImg noticeImg) {
		super();
		this.noticeNo = noticeNo;
		this.resId = resId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeImg = noticeImg;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public NoticeImg getNoticeImg() {
		return noticeImg;
	}

	public void setNoticeImg(NoticeImg noticeImg) {
		this.noticeImg = noticeImg;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", resId=" + resId + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", noticeDate=" + noticeDate + ", noticeImg=" + noticeImg + "]";
	}

}
