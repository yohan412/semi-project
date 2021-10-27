package com.main.dto;

public class MainDto {

	private int userno;
	private String userid;
	private String userpw;
	private String username;
	private String useremail;
	private String userphone;
	private String useraddr;
	private String userrole;
	private String userenabled;
	private String userwish;

	public MainDto() {
		super();
	}

	public MainDto(int userno, String userid, String userpw, String username, String useremail, String userphone,
			String useraddr, String userrole, String userenabled, String userwish) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useremail = useremail;
		this.userphone = userphone;
		this.useraddr = useraddr;
		this.userrole = userrole;
		this.userenabled = userenabled;
		this.userwish = userwish;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUsereamil(String useremail) {
		this.useremail = useremail;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUseraddr() {
		return useraddr;
	}

	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public String getUserenabled() {
		return userenabled;
	}

	public void setUserenabled(String userenabled) {
		this.userenabled = userenabled;
	}

	public String getUserwish() {
		return userwish;
	}

	public void setUserwish(String userwish) {
		this.userwish = userwish;
	}
	
	
}
