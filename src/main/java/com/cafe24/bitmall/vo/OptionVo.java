package com.cafe24.bitmall.vo;

public class OptionVo {
	
	private long no;
	private String name;
	
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
	
	@Override
	public String toString() {
		return "OptionVo [no=" + no + ", name=" + name + "]";
	}
}
