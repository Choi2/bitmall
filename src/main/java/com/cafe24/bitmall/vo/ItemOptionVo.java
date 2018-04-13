package com.cafe24.bitmall.vo;

import java.util.List;

public class ItemOptionVo {
	
	private long no;
	private long itemNo;
	private long optionNo;
	private String optionName;
	private String itemOptionValues;
	
	private List<ItemOptionVo> itemOptionList;

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public long getItemNo() {
		return itemNo;
	}

	public void setItemNo(long itemNo) {
		this.itemNo = itemNo;
	}

	public long getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(long optionNo) {
		this.optionNo = optionNo;
	}

	public String getItemOptionValues() {
		return itemOptionValues;
	}

	public void setItemOptionValues(String itemOptionValues) {
		this.itemOptionValues = itemOptionValues;
	}

	public List<ItemOptionVo> getItemOptionList() {
		return itemOptionList;
	}

	public void setItemOptionList(List<ItemOptionVo> itemOptionList) {
		this.itemOptionList = itemOptionList;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	@Override
	public String toString() {
		return "ItemOptionVo [no=" + no + ", itemNo=" + itemNo + ", optionNo=" + optionNo + ", optionName=" + optionName
				+ ", itemOptionValues=" + itemOptionValues + ", itemOptionList=" + itemOptionList + "]";
	}

	
}
