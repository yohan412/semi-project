package com.biz.dto;

public class BizDto {
	private int bizno;
	private int userno;
	private String usernm;
	private String biznm;
	private String bizaddr;
	private String bizcategory;
	private String bizprice;
	private String bizcontent;
	private String bizpic;
	public BizDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BizDto(int bizno, int userno, String usernm, String biznm, String bizaddr, String bizcategory,
			String bizprice, String bizcontent, String bizpic) {
		super();
		this.bizno = bizno;
		this.userno = userno;
		this.usernm = usernm;
		this.biznm = biznm;
		this.bizaddr = bizaddr;
		this.bizcategory = bizcategory;
		this.bizprice = bizprice;
		this.bizcontent = bizcontent;
		this.bizpic = bizpic;
	}
	
	public BizDto(int userno,String usernm, String biznm, String bizaddr, String bizcategory,
			String bizprice, String bizcontent, String bizpic) {
		super();
		this.userno = userno;
		this.usernm = usernm;
		this.biznm = biznm;
		this.bizaddr = bizaddr;
		this.bizcategory = bizcategory;
		this.bizprice = bizprice;
		this.bizcontent = bizcontent;
		this.bizpic = bizpic;
	}
	
	public int getBizno() {
		return bizno;
	}
	public void setBizno(int bizno) {
		this.bizno = bizno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getBiznm() {
		return biznm;
	}
	public void setBiznm(String biznm) {
		this.biznm = biznm;
	}
	public String getBizaddr() {
		return bizaddr;
	}
	public void setBizaddr(String bizaddr) {
		this.bizaddr = bizaddr;
	}
	public String getBizcategory() {
		return bizcategory;
	}
	public void setBizcategory(String bizcategory) {
		this.bizcategory = bizcategory;
	}
	public String getBizprice() {
		return bizprice;
	}
	public void setBizprice(String bizprice) {
		this.bizprice = bizprice;
	}
	public String getBizcontent() {
		return bizcontent;
	}
	public void setBizcontent(String bizcontent) {
		this.bizcontent = bizcontent;
	}
	public String getBizpic() {
		return bizpic;
	}
	public void setBizpic(String bizpic) {
		this.bizpic = bizpic;
	}
	
	
}
