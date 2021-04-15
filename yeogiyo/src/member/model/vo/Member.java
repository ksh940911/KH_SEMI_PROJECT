package member.model.vo;

import java.sql.Date;
import javax.servlet.http.HttpSessionBindingListener;

public class Member implements HttpSessionBindingListener {
	
	private String memberId;
	private String memberName;
	private String password;
	private Date birthday;
	private String gender;
	private String address;
	private String addressSub;
	private String phone;
	private String email;
	private Date memberEnroll;
	private String memberRole;
	
	public Member() {
		super();
	}

	public Member(String memberId, String memberName, String password, Date birthday, String gender, String address,
			String addressSub, String phone, String email, Date memberEnroll, String memberRole) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.password = password;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.addressSub = addressSub;
		this.phone = phone;
		this.email = email;
		this.memberEnroll = memberEnroll;
		this.memberRole = memberRole;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getMemberEnroll() {
		return memberEnroll;
	}

	public void setMemberEnroll(Date memberEnroll) {
		this.memberEnroll = memberEnroll;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", password=" + password + ", birthday="
				+ birthday + ", gender=" + gender + ", address=" + address + ", addressSub=" + addressSub + ", phone="
				+ phone + ", email=" + email + ", memberEnroll=" + memberEnroll + ", memberRole=" + memberRole + "]";
	}
	

}
