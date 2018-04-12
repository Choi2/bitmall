package com.cafe24.bitmall.vo;

import java.util.List;

public class OptionValueVo {
	
	private long itemNo;
	private long optionNo;
	private String optValues;
	
	private List<OptionValueVo> optionValues;
	
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
	public String getOptValues() {
		return optValues;
	}
	public void setOptValues(String optValues) {
		this.optValues = optValues;
	}
	
	public List<OptionValueVo> getOptionValues() {
		return optionValues;
	}
	public void setOptionValues(List<OptionValueVo> optionValues) {
		this.optionValues = optionValues;
	}
	@Override
	public String toString() {
		return "OptionValueVo [itemNo=" + itemNo + ", optionNo=" + optionNo + ", optValues=" + optValues + "]";
	}
}
