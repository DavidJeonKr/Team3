package com.itwill.dd.domain;

public class ProductViewVO {
	
	private int productId;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String productImg;
	private String productThumbImg;
	private String cateCode;
	private String productSong;
	private String productSong2;
	private String productSong3;
	
	private String cateCodeRef;
	private String CateName;
	
	
	
	
	public String getProductSong2() {
		return productSong2;
	}
	public void setProductSong2(String productSong2) {
		this.productSong2 = productSong2;
	}
	public String getProductSong3() {
		return productSong3;
	}
	public void setProductSong3(String productSong3) {
		this.productSong3 = productSong3;
	}
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
	public String getCateName() {
		return CateName;
	}
	public void setCateName(String cateName) {
		CateName = cateName;
	}
	
	public String getProductThumbImg() {
		return productThumbImg;
	}
	public void setProductThumbImg(String productThumbImg) {
		this.productThumbImg = productThumbImg;
	}

	public String getProductSong() {
		return productSong;
	}
	public void setProductSong(String productSong) {
		this.productSong = productSong;
	}
	@Override
	public String toString() {
		return "ProductViewVO [productId=" + productId + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productDesc=" + productDesc + ", productImg=" + productImg + ", productThumbImg="
				+ productThumbImg + ", cateCode=" + cateCode + ", productSong=" + productSong + ", productSong2="
				+ productSong2 + ", productSong3=" + productSong3 + ", cateCodeRef=" + cateCodeRef + ", CateName="
				+ CateName + "]";
	}


}
