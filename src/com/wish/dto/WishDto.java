package com.wish.dto;

public class WishDto {

	private String login_id;
	private int title_no;
	private String use_yn;
	private String type;
	private String used_title;
	
	public WishDto() {
		super();
	}

	public WishDto(String login_id, int title_no, String use_yn, String type, String used_title) {
		super();
		this.login_id = login_id;
		this.title_no = title_no;
		this.use_yn = use_yn;
		this.type = type;
		this.used_title = used_title;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public int getTitle_no() {
		return title_no;
	}

	public void setTitle_no(int title_no) {
		this.title_no = title_no;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUsed_title() {
		return used_title;
	}

	public void setUsed_title(String used_title) {
		this.used_title = used_title;
	}

	

	

	

	
}
