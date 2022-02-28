package com.itwill.dd.domain;

import java.util.Date;

public class Preply {
	
	
	int rptno;
	int ptno;
	String userid;
	Date regdate;
	String rpcontent;
	
	public Preply() {}
	
	public Preply(int rptno, int ptno, String userid, Date regdate, String rpcontent) {
		super();
		this.rptno = rptno;
		this.ptno = ptno;
		this.userid = userid;
		this.regdate = regdate;
		this.rpcontent = rpcontent;
	}

	public int getRptno() {
		return rptno;
	}

	public void setRptno(int rptno) {
		this.rptno = rptno;
	}

	public int getPtno() {
		return ptno;
	}

	public void setPtno(int ptno) {
		this.ptno = ptno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getRpcontent() {
		return rpcontent;
	}

	public void setRpcontent(String rpcontent) {
		this.rpcontent = rpcontent;
	}
	
	@Override
	public String toString() {
		return String.format("Preplies{rptno: %d, ptno: %d, userid: %s, regdate: %s, rpcontent: %s}" ,
										this.rptno, this.ptno, this.userid, this.regdate, this.rpcontent);
	}
	
	
	
}
