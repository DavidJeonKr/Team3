package com.itwill.dd.domain;

public class CartVO {

	 
	private int cartNum;
	private String userId;
	private int productId;
	private int cartStock;
	
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
		return "CartVO [cartNum=" + cartNum + ", userId=" + userId + ", productId=" + productId + ", cartStock="
				+ cartStock + "]";
	}
	
	
}
