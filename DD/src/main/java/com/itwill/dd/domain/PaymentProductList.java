package com.itwill.dd.domain;

public class PaymentProductList {
	
	private int userPrnum;
	private String userId;
	private int productId;
	
	private int num;
	private String productName;
	private int productPrice;
	private String productSong;
	private String productThumbImg;
	
	
	public String getProductSong() {
		return productSong;
	}
	public void setProductSong(String productSong) {
		this.productSong = productSong;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductThumbImg() {
		return productThumbImg;
	}
	public void setProductThumbImg(String productThumbImg) {
		this.productThumbImg = productThumbImg;
	}
	public int getUserPrnum() {
		return userPrnum;
	}
	public void setUserPrnum(int userPrnum) {
		this.userPrnum = userPrnum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "PaymentProductList [userPrnum=" + userPrnum + ", userId=" + userId + ", productId=" + productId
				+ ", num=" + num + ", productName=" + productName + ", productPrice=" + productPrice + ", productSong="
				+ productSong + ", productThumbImg=" + productThumbImg + "]";
	}

	

	
	
}
