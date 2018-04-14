package com.cafe24.bitmall.vo;

import java.util.Date;

public class OrderVo {
	
	private long no;
	private String orderer;
	private String receiver;
	private String phone;
	private String cellphone;
	private String email;
	private String address;
	private String zipcode;
	private String content;
	private Date orderDate;
	private String itemName;
	private int itemCount;
	private int totalPrice;
	private String status;
	private long memberNo;
	private long bankNo;
	private long cardNo;

	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(long memberNo) {
		this.memberNo = memberNo;
	}
	public long getBankNo() {
		return bankNo;
	}
	public void setBankNo(long bankNo) {
		this.bankNo = bankNo;
	}
	public long getCardNo() {
		return cardNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setCardNo(long cardNo) {
		this.cardNo = cardNo;
	}

	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderer=" + orderer + ", receiver=" + receiver + ", phone=" + phone
				+ ", cellphone=" + cellphone + ", email=" + email + ", address=" + address + ", zipcode=" + zipcode
				+ ", content=" + content + ", orderDate=" + orderDate + ", itemName=" + itemName + ", itemCount="
				+ itemCount + ", totalPrice=" + totalPrice + ", status=" + status + ", memberNo=" + memberNo
				+ ", bankNo=" + bankNo + ", cardNo=" + cardNo + "]";
	}

	
}
