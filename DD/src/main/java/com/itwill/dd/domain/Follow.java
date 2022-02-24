package com.itwill.dd.domain;

public class Follow {
	private int fno;
	private String followid;
	private String followerid;
	
	public Follow() {}

	public Follow(int fno, String followid, String followerid) {
		super();
		this.fno = fno;
		this.followid = followid;
		this.followerid = followerid;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFollowid() {
		return followid;
	}

	public void setFollowid(String followid) {
		this.followid = followid;
	}

	public String getFollowerid() {
		return followerid;
	}

	public void setFollowerid(String followerid) {
		this.followerid = followerid;
	}
	
}
