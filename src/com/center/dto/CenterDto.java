package com.center.dto;

import java.util.Date;

public class CenterDto {
	private int centerno;
	private String centername;
	private String centeraddr;
	private String centerprice;
	private String centercategory;
	private int centergrade;
	private String centerpic;
	private String centercontent;
	private Date centerreg;
	
	public CenterDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CenterDto(int centerno, String centername, String centeraddr, String centerprice, String centercategory,
			int centergrade, String centerpic, String centercontent, Date centerreg) {
		super();
		this.centerno = centerno;
		this.centername = centername;
		this.centeraddr = centeraddr;
		this.centerprice = centerprice;
		this.centercategory = centercategory;
		this.centergrade = centergrade;
		this.centerpic = centerpic;
		this.centercontent = centercontent;
		this.centerreg = centerreg;
	}
	
	public int getCenterno() {
		return centerno;
	}
	public void setCenterno(int centerno) {
		this.centerno = centerno;
	}
	public String getCentername() {
		return centername;
	}
	public void setCentername(String centername) {
		this.centername = centername;
	}
	public String getCenteraddr() {
		return centeraddr;
	}
	public void setCenteraddr(String centeraddr) {
		this.centeraddr = centeraddr;
	}
	public String getCenterprice() {
		return centerprice;
	}
	public void setCenterprice(String centerprice) {
		this.centerprice = centerprice;
	}
	public String getCentercategory() {
		return centercategory;
	}
	public void setCentercategory(String centercategory) {
		this.centercategory = centercategory;
	}
	public int getCentergrade() {
		return centergrade;
	}
	public void setCentergrade(int centergrade) {
		this.centergrade = centergrade;
	}
	public String getCenterpic() {
		return centerpic;
	}
	public void setCenterpic(String centerpic) {
		this.centerpic = centerpic;
	}
	public String getCentercontent() {
		return centercontent;
	}
	public void setCentercontent(String centercontent) {
		this.centercontent = centercontent;
	}
	public Date getCenterreg() {
		return centerreg;
	}
	public void setCenterreg(Date centerreg) {
		this.centerreg = centerreg;
	}
	
}


