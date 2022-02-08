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
	
	public User() {}
	
	public User(String userid, String password, String realname, Date birthday, String phone, Date regdate,
			String nickname, int biscuit) {
		super();
		this.userid = userid;
		this.password = password;
		this.realname = realname;
		this.birthday = birthday;
		this.phone = phone;
		this.regdate = regdate;
		this.nickname = nickname;
		this.biscuit = biscuit;
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
}
