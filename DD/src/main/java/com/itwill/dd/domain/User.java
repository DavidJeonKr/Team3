package com.itwill.dd.domain;

import java.util.Date;

public class User {
	private String userid;
	private String password;
	private String realname;
	private Date birthday;
	private String phone;
	private Date regdate;
	private String nickname;
	private int biscuit;
	private int followcnt;
	private int followercnt;
	
	
	public User() {}
	
	public User(String userid, String password, String realname, String nickname, Date birthday, String phone, Date regdate,
			 int biscuit, int followcnt, int followercnt) {
		super();
		this.userid = userid;
		this.password = password;
		this.realname = realname;
		this.birthday = birthday;
		this.phone = phone;
		this.regdate = regdate;
		this.nickname = nickname;
		this.biscuit = biscuit;
		this.followcnt = followcnt;
		this.followercnt = followercnt;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getBiscuit() {
		return biscuit;
	}
	public void setBiscuit(int biscuit) {
		this.biscuit = biscuit;
	}
	public int getFollowcnt() {
		return followcnt;
	}
	public void setFollowcnt(int followcnt) {
		this.followcnt = followcnt;
	}
	public int getFollowercnt() {
		return followercnt;
	}

	public void setFollowercnt(int followercnt) {
		this.followercnt = followercnt;
	}

	@Override
	public String toString() {
		
		return String.format("USER{userid=%s, pwd=%s, realname=%s, birthday=%s, nickname=%s, phone=%s, biscuit=%d, followcnt=%d, followercnt=%d}",
				this.userid, this.password, this.realname, this.birthday, this.nickname, this.phone, this.biscuit, this.followcnt, this.followercnt);
	}
}
