package restaurant.model.vo;

public class Menu {
	private int menuId;
	private int resId;
	private String menuName;
	private String description;
	private String menuCategory;
	private int price;
	private String menuImg;
	
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Menu(int menuId, int resId, String menuName, String description, String menuCategory, int price,
			String menuImg) {
		super();
		this.menuId = menuId;
		this.resId = resId;
		this.menuName = menuName;
		this.description = description;
		this.menuCategory = menuCategory;
		this.price = price;
		this.menuImg = menuImg;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMenuCategory() {
		return menuCategory;
	}
	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMenuImg() {
		return menuImg;
	}
	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", resId=" + resId + ", menuName=" + menuName + ", description=" + description
				+ ", menuCategory=" + menuCategory + ", price=" + price + ", menuImg=" + menuImg + "]";
	}
	
	

}
