package com.itwill.dd.domain;

public class ProductVO {
	
	private int productId;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String productImg;
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
	
	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDesc=" + productDesc + ", productImg=" + productImg + "]";
	}
	
}
