package com.cafe24.bitmall.vo;

public class CartVo {
	
	private long no;
	private long itemNo;
	private long memberNo;
	private int itemCount;
	private int price;
	
	public long getItemNo() {
		return itemNo;
	}
	public void setItemNo(long itemNo) {
		this.itemNo = itemNo;
	}
	public long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(long memberNo) {
		this.memberNo = memberNo;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return "CartVo [no=" + no + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", itemCount=" + itemCount
				+ ", price=" + price + "]";
	}
}
