package com.woong.wuction.mypage.model.dto;

public class MyBid {
	private int bidPrice;
	private String bidTime;
	private String productName;
	public MyBid() {
		super();
	}
	public MyBid(int bidPrice, String bidTime, String productName) {
		super();
		this.bidPrice = bidPrice;
		this.bidTime = bidTime;
		this.productName = productName;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public String getBidTime() {
		return bidTime;
	}
	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Override
	public String toString() {
		return "MyBid [bidPrice=" + bidPrice + ", bidTime=" + bidTime + ", productName=" + productName + "]";
	}
	
	
}
