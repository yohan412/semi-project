package com.wish.dto;

public class WishDto {

	private String loginid;
	private String usedtitle;
	private String userid;
	private String usercenternm;
	private String usedno;
	
	public WishDto() {
		super();
	}

	public WishDto(String loginid, String usedtitle, String userid, String usercenternm, String usedno) {
		super();
		this.loginid = loginid;
		this.usedtitle = usedtitle;
		this.userid = userid;
		this.usercenternm = usercenternm;
		this.usedno = usedno;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getUsedtitle() {
		return usedtitle;
	}

	public void setUsedtitle(String usedtitle) {
		this.usedtitle = usedtitle;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsercenternm() {
		return usercenternm;
	}

	public void setUsercenternm(String usercenternm) {
		this.usercenternm = usercenternm;
	}

	public String getUsedno() {
		return usedno;
	}

	public void setUsedno(String usedno) {
		this.usedno = usedno;
	}

	
	
}
