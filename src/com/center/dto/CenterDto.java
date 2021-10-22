package com.center.dto;

public class CenterDto {
	private String centername;
	private String centerloc;
	public CenterDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CenterDto(String centername, String centerloc) {
		super();
		this.centername = centername;
		this.centerloc = centerloc;
	}
	public String getCentername() {
		return centername;
	}
	public void setCentername(String centername) {
		this.centername = centername;
	}
	public String getCenterloc() {
		return centerloc;
	}
	public void setCenterloc(String centerloc) {
		this.centerloc = centerloc;
	}
	
	
}
