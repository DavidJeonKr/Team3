package com.itwill.dd.domain;

import java.util.Date;

// 작성 ver.2022.02.10 
// Diary (다이어리) - 변수 이름 DB구상과 일치시킴  
public class Diary {
	
	// 멤버 변수 (필드)
	private int dno;	// 일정 인덱스 번호 (검색, 추가, 수정, 삭제 용도)
	private String userid;	// userid - board 테이블과 일치
	private String dname;	// 일정 제목
	private String start_date;	// 일정 시작일
	private String end_date;	// 일정 종료일 - 미 설정 시 자동으로 시작일과 일치 
	
	
	// 생성자 2개 (기본 생성자, 모든 필드 포함 생성자)
	public Diary() {}
	
	public Diary(int dno, String userid, String dname, String start_date, String end_date) {		
		this.dno = dno;
		this.userid = userid;
		this.dname = dname;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	
	// getter & setter
	public int getDno() {
		return dno;
	}


	public void setDno(int dno) {
		this.dno = dno;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getDname() {
		return dname;
	}


	public void setDname(String dname) {
		this.dname = dname;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
	
	// 콘솔 확인용 toString
	@Override
	public String toString() {
		return String.format (
				"Diary{dno=%d, userid=%s, dname=%s, start_date=%s, end_date=%s}", 
				this.dno, this.userid, this.dname, this.start_date, this.end_date);
	}
	
	
}
