package com.itwill.dd.domain;

import java.util.Date;

public class Reply {
	private int cno; 
	private String rcontent; 
	private String userid;
	private Date regdate; 
	private int bno; 
	
	public Reply() {}

	public Reply(int cno, String rcontent, String userid, Date regdate, int bno) {
		this.cno = cno;
		this.rcontent = rcontent;
		this.userid = userid;
		this.regdate = regdate;
		this.bno = bno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
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

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}
	
	@Override
	public String toString() {
		return String.format(
				"Reply{cno:%d, rcontent:%s, userid:%s, regdate:%s, bno:%d}", 
				this.cno, this.rcontent, this.userid, this.regdate, this.bno);
	}
}
