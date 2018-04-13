package com.cafe24.bitmall.vo;

public class OptionVo {
	
	private long no;
	private String name;
	private String basicValue;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBasicValue() {
		return basicValue;
	}
	public void setBasicValue(String basicValue) {
		this.basicValue = basicValue;
	}
	@Override
	public String toString() {
		return "OptionVo [no=" + no + ", name=" + name + ", basicValue=" + basicValue + "]";
	}
	
	
	
	
}
