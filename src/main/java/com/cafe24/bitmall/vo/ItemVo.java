package com.cafe24.bitmall.vo;

import java.util.Date;

public class ItemVo {
	private long no;
	private String code;
	private String name;
	private String company;
	private int sellingPrice;
	private int retailPrice;
	private int item_count;
	private String status;
	private String icon;
	private int discount;
	private String content;
	private Date regDate;
	private String imagePath;
	private long categoryNo;
	private String groupName;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	public int getRetailPrice() {
		return retailPrice;
	}
	public void setRetailPrice(int retailPrice) {
		this.retailPrice = retailPrice;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getIcon() {
		return icon;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public long getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(long categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	@Override
	public String toString() {
		return "ItemVo [no=" + no + ", code=" + code + ", name=" + name + ", company=" + company + ", sellingPrice="
				+ sellingPrice + ", retailPrice=" + retailPrice + ", item_count=" + item_count + ", status=" + status
				+ ", icon=" + icon + ", discount=" + discount + ", content=" + content + ", regDate=" + regDate
				+ ", imagePath=" + imagePath + ", categoryNo=" + categoryNo + ", groupName=" + groupName + "]";
	}
}
