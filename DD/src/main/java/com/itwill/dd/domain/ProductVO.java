package com.itwill.dd.domain;

public class ProductVO {
	
	private int productId;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String productImg;
	private String cateCode;
	private String productSong;
	
	
	// 썸네일 저장할 필드
	private String productThumbImg;
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
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
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	
	public String getProductThumbImg() {
		return productThumbImg;
	}
	public void setProductThumbImg(String productThumbImg) {
		this.productThumbImg = productThumbImg;
	}
	
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	
	public String getProductSong() {
		return productSong;
	}
	public void setProductSong(String productSong) {
		this.productSong = productSong;
	}
	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDesc=" + productDesc + ", productImg=" + productImg + ", cateCode=" + cateCode
				+ ", productSong=" + productSong + ", productThumbImg=" + productThumbImg + "]";
	}

}
