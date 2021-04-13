package restaurant.model.vo;

public class Restaurant {
	
	private int resId;
	private String resName;
	private String resAddress;
	private String category;
	private int minPrice;
	private String logoImg;
	private double rateAvg;
	private int reviewCnt;
	private Menu menu;
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Restaurant(int resId, String resName, String resAddress, String category, int minPrice, String logoImg,
			double rateAvg, int reviewCnt, Menu menu) {
		super();
		this.resId = resId;
		this.resName = resName;
		this.resAddress = resAddress;
		this.category = category;
		this.minPrice = minPrice;
		this.logoImg = logoImg;
		this.rateAvg = rateAvg;
		this.reviewCnt = reviewCnt;
		this.menu = menu;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResAddress() {
		return resAddress;
	}
	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public String getLogoImg() {
		return logoImg;
	}
	public void setLogoImg(String logoImg) {
		this.logoImg = logoImg;
	}
	public double getRateAvg() {
		return rateAvg;
	}
	public void setRateAvg(double rateAvg) {
		this.rateAvg = rateAvg;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	@Override
	public String toString() {
		return "Restaurant [resId=" + resId + ", resName=" + resName + ", resAddress=" + resAddress + ", category="
				+ category + ", minPrice=" + minPrice + ", logoImg=" + logoImg + ", rateAvg=" + rateAvg + ", reviewCnt="
				+ reviewCnt + ", menu=" + menu + "]";
	}
	
	

}
