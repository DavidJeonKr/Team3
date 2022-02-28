package com.itwill.dd.domain;

import java.util.Date;

public class Photo {
	
	private int ptno;
	private String userid;
	private String content;
	private Date regdate;
	private int view_cnt;
	private int like_cnt;
	private String filename;
	
	public Photo() {}
	
	public Photo(int ptno, String userid, String content, Date regdate, int view_cnt, int like_cnt, String filename) {
		super();
		this.ptno = ptno;
		this.userid = userid;
		this.content = content;
		this.regdate = regdate;
		this.view_cnt = view_cnt;
		this.like_cnt = like_cnt;
		this.filename = filename;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Override
	public String toString() {
		return String.format("Photo{ptno: %d, content: %s, regdate:%s, userid: %s, view_cnt: %d, like_cnt: %d, filename: %s }",
				this.ptno,this.content,this.regdate, this.userid, this.view_cnt,this.like_cnt, this.filename);
	}

	
	
	
}
