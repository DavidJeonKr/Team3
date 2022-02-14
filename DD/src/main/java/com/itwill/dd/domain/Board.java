package com.itwill.dd.domain;

import java.util.Date;

public class Board {
	private int bno;
	private String title;
	private String content;
	private Date regdate;
	private int view_cnt;
	private int like_cnt;
	private String filename;
	private String userid;
	
	public Board() {}
	
	public Board(int bno, String title, String content, Date regdate, int view_cnt, int like_cnt, String filename,
			String userid) {
		
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.view_cnt = view_cnt;
		this.like_cnt = like_cnt;
		this.filename = filename;
		this.userid = userid;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Override
	public String toString() {
		return String.format(
				"Board{bno:%d, title:%s, content:%s, regdate:%s, view_cnt:%d, like_cnt:%d, filename:%s, userid:%s}", 
				this.bno, this.title, this.content, this.regdate, this.view_cnt, this.like_cnt, this.filename, this.userid);
	}
}
