package order.model.vo;

import java.sql.Date;

public class Order {
	
	private int orderId;
	private String memberId;
	private int resId;
	private Date orderDate;
	private String address;
	private String addressSub;
	private String phone;
	private String orderComment;
	private String paymentWay;
	private String paymentPlace;
	private String orderMenu; //json
	private int totalPrice;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Order(int orderId, String memberId, int resId, Date orderDate, String address, String addressSub,
			String phone, String comment, String paymentWay, String paymentPlace, String orderMenu, int totalPrice) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.resId = resId;
		this.orderDate = orderDate;
		this.address = address;
		this.addressSub = addressSub;
		this.phone = phone;
		this.orderComment = comment;
		this.paymentWay = paymentWay;
		this.paymentPlace = paymentPlace;
		this.orderMenu = orderMenu;
		this.totalPrice = totalPrice;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressSub() {
		return addressSub;
	}
	public void setAddressSub(String addressSub) {
		this.addressSub = addressSub;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getComment() {
		return orderComment;
	}
	public void setComment(String comment) {
		this.orderComment = comment;
	}
	public String getPaymentWay() {
		return paymentWay;
	}
	public void setPaymentWay(String paymentWay) {
		this.paymentWay = paymentWay;
	}
	public String getPaymentPlace() {
		return paymentPlace;
	}
	public void setPaymentPlace(String paymentPlace) {
		this.paymentPlace = paymentPlace;
	}
	public String getOrderMenu() {
		return orderMenu;
	}
	public void setOrderMenu(String orderMenu) {
		this.orderMenu = orderMenu;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", memberId=" + memberId + ", resId=" + resId + ", orderDate=" + orderDate
				+ ", address=" + address + ", addressSub=" + addressSub + ", phone=" + phone + ", comment=" + orderComment
				+ ", paymentWay=" + paymentWay + ", paymentPlace=" + paymentPlace + ", orderMenu=" + orderMenu
				+ ", totalPrice=" + totalPrice + "]";
	}

}
