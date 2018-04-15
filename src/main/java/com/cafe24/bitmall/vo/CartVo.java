package com.cafe24.bitmall.vo;

import java.util.List;

public class CartVo {
	
	private long no;
	private long itemNo;
	private long memberNo;
	private int itemCount;
	private int price;
	private long orderNo;
	private boolean isOrder;
	
	private List<CartVo> cartList;
	
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
	public long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	public List<CartVo> getCartList() {
		return cartList;
	}
	public void setCartList(List<CartVo> cartList) {
		this.cartList = cartList;
	}
	
	public boolean getIsOrder() {
		return isOrder;
	}
	public void setIsOrder(boolean isOrder) {
		this.isOrder = isOrder;
	}
	@Override
	public String toString() {
		return "CartVo [no=" + no + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", itemCount=" + itemCount
				+ ", price=" + price + ", orderNo=" + orderNo + ", cartList=" + cartList + "]";
	}
}
