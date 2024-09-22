package com.woong.wuction.posting.model.dto;

public class MainPagePosting {
	
	private int postingNo;
	private String productName;
	private long maxPrice;
	private int bidCount;
	private String endTime;
	private String imgFile;
	
	
	public MainPagePosting() {
		
	}
	
	public MainPagePosting(int postingNo, String productName, long maxPrice, int bidCount, String endTime,
			String imgFile) {
		super();
		this.postingNo = postingNo;
		this.productName = productName;
		this.maxPrice = maxPrice;
		this.bidCount = bidCount;
		this.endTime = endTime;
		this.imgFile = imgFile;
	}

	public int getPostingNo() {
		return postingNo;
	}

	public void setPostingNo(int postingNo) {
		this.postingNo = postingNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public long getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(long maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getBidCount() {
		return bidCount;
	}

	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getImgFile() {
		return imgFile;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}

	@Override
	public String toString() {
		return "MainPagePosting [postingNo=" + postingNo + ", productName=" + productName + ", maxPrice=" + maxPrice
				+ ", bidCount=" + bidCount + ", endTime=" + endTime + ", imgFile=" + imgFile + "]";
	}
	
	
	

}
