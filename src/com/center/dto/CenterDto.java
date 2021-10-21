package com.center.dto;

import java.util.Date;

public class CenterDto {
	private int centerno;
	private String centertitle;
	private String centeraddr;
	private String centerprice;
	private String centercategory;
	private String centerpic;
	private String centername;
	private String centercontent;
	private Date centerreg;
	
	
	public CenterDto() {
		super();
	}


	public CenterDto(int centerno, String centertitle, String centeraddr, String centerprice, String centercategory,
			String centerpic, String centername, String centercontent, Date centerreg) {
		super();
		this.centerno = centerno;
		this.centertitle = centertitle;
		this.centeraddr = centeraddr;
		this.centerprice = centerprice;
		this.centercategory = centercategory;
		this.centerpic = centerpic;
		this.centername = centername;
		this.centercontent = centercontent;
		this.centerreg = centerreg;
	}


	public int getCenterno() {
		return centerno;
	}


	public void setCenterno(int centerno) {
		this.centerno = centerno;
	}


	public String getCentertitle() {
		return centertitle;
	}


	public void setCentertitle(String centertitle) {
		this.centertitle = centertitle;
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


	public String getCenterpic() {
		return centerpic;
	}


	public void setCenterpic(String centerpic) {
		this.centerpic = centerpic;
	}


	public String getCentername() {
		return centername;
	}


	public void setCentername(String centername) {
		this.centername = centername;
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


