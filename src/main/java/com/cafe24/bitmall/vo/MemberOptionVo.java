package com.cafe24.bitmall.vo;

import java.util.List;

public class MemberOptionVo {
	
	private long cartNo;
	private long itemOptionNo;
	private String optionName;
	private String memberOptionValue;
	
	private List<MemberOptionVo> memberOptionList;
	
	public long getCartNo() {
		return cartNo;
	}
	public void setCartNo(long cartNo) {
		this.cartNo = cartNo;
	}
	public long getItemOptionNo() {
		return itemOptionNo;
	}
	public void setItemOptionNo(long itemOptionNo) {
		this.itemOptionNo = itemOptionNo;
	}
	public String getMemberOptionValue() {
		return memberOptionValue;
	}
	public void setMemberOptionValue(String memberOptionValue) {
		this.memberOptionValue = memberOptionValue;
	}
	public List<MemberOptionVo> getMemberOptionList() {
		return memberOptionList;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public void setMemberOptionList(List<MemberOptionVo> memberOptionList) {
		this.memberOptionList = memberOptionList;
	}
	@Override
	public String toString() {
		return "MemberOptionVo [cartNo=" + cartNo + ", itemOptionNo=" + itemOptionNo + ", memberOptionValue="
				+ memberOptionValue + ", memberOptionList=" + memberOptionList + "]";
	}
}
