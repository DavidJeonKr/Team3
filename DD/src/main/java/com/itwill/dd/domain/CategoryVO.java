package com.itwill.dd.domain;

public class CategoryVO {
	 
	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	private int cateNum;
	
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
		
	}
	
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [cateName=" + cateName + ", cateCode=" + cateCode + ", cateCodeRef=" + cateCodeRef
				+ ", cateNum=" + cateNum + "]";
	}
	
	
	
	

}
