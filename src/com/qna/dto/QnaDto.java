package com.qna.dto;

import java.util.Date;


public class QnaDto {
	private int qano;
	private int qagpno;
	private int qagpsq;
	private String userid;
	private int userno;
	private String qatype;
	private String qatitle;	
	private String qacontent;
	private String qafaq;
	private Date qareg;
	private String qastatus;
		
	public QnaDto() {
		super();
	}

	public QnaDto(int qano, int qagpno, int qagpsq, String userid, int userno, String qatype, String qatitle,
			String qacontent, String qafaq, Date qareg, String qastatus) {
		super();
		this.qano = qano;
		this.qagpno = qagpno;
		this.qagpsq = qagpsq;
		this.userid = userid;
		this.userno = userno;
		this.qatype = qatype;
		this.qatitle = qatitle;
		this.qacontent = qacontent;
		this.qafaq = qafaq;
		this.qareg = qareg;
		this.qastatus = qastatus;
	}

	public int getQano() {
		return qano;
	}

	public void setQano(int qano) {
		this.qano = qano;
	}

	public int getQagpno() {
		return qagpno;
	}

	public void setQagpno(int qagpno) {
		this.qagpno = qagpno;
	}

	public int getQagpsq() {
		return qagpsq;
	}

	public void setQagpsq(int qagpsq) {
		this.qagpsq = qagpsq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getQatype() {
		return qatype;
	}

	public void setQatype(String qatype) {
		this.qatype = qatype;
	}

	public String getQatitle() {
		return qatitle;
	}

	public void setQatitle(String qatitle) {
		this.qatitle = qatitle;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
	}

	public String getQafaq() {
		return qafaq;
	}

	public void setQafaq(String qafaq) {
		this.qafaq = qafaq;
	}

	public Date getQareg() {
		return qareg;
	}

	public void setQareg(Date qareg) {
		this.qareg = qareg;
	}

	public String getQastatus() {
		return qastatus;
	}

	public void setQastatus(String qastatus) {
		this.qastatus = qastatus;
	}

}	