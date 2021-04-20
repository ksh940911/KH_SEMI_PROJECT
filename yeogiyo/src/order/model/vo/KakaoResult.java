package order.model.vo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class KakaoResult {

	@SerializedName("tid")
	@Expose
	private String tid;
	@SerializedName("next_redirect_app_url")
	@Expose
	private String nextRedirectAppUrl;
	@SerializedName("next_redirect_mobile_url")
	@Expose
	private String nextRedirectMobileUrl;
	@SerializedName("next_redirect_pc_url")
	@Expose
	private String nextRedirectPcUrl;
	@SerializedName("android_app_scheme")
	@Expose
	private String androidAppScheme;
	@SerializedName("ios_app_scheme")
	@Expose
	private String iosAppScheme;
	@SerializedName("created_at")
	@Expose
	private String createdAt;

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getNextRedirectAppUrl() {
		return nextRedirectAppUrl;
	}

	public void setNextRedirectAppUrl(String nextRedirectAppUrl) {
		this.nextRedirectAppUrl = nextRedirectAppUrl;
	}

	public String getNextRedirectMobileUrl() {
		return nextRedirectMobileUrl;
	}

	public void setNextRedirectMobileUrl(String nextRedirectMobileUrl) {
		this.nextRedirectMobileUrl = nextRedirectMobileUrl;
	}

	public String getNextRedirectPcUrl() {
		return nextRedirectPcUrl;
	}

	public void setNextRedirectPcUrl(String nextRedirectPcUrl) {
		this.nextRedirectPcUrl = nextRedirectPcUrl;
	}

	public String getAndroidAppScheme() {
		return androidAppScheme;
	}

	public void setAndroidAppScheme(String androidAppScheme) {
		this.androidAppScheme = androidAppScheme;
	}

	public String getIosAppScheme() {
		return iosAppScheme;
	}

	public void setIosAppScheme(String iosAppScheme) {
		this.iosAppScheme = iosAppScheme;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

}