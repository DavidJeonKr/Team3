package com.itwill.dd.domain;

public class CartListVO {

	
	private int cartNum;
	private String userId;
	private int productId;
	private int cartStock;
	
	private int num;
	private String productName;
	private int productPrice;
	private String ProductThumbImg;
	
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
		return ProductThumbImg;
	}
	public void setProductThumbImg(String productThumbImg) {
		ProductThumbImg = productThumbImg;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
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
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	@Override
	public String toString() {
		return "CartListVO [cartNum=" + cartNum + ", userId=" + userId + ", productId=" + productId + ", cartStock="
				+ cartStock + ", num=" + num + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", ProductThumbImg=" + ProductThumbImg + "]";
	}

	
	
	
}
