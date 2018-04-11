package com.cafe24.bitmall.vo;

public class CategoryVo {
	
	private long no;
	private String groupName;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	@Override
	public String toString() {
		return "CategoryVo [no=" + no + ", groupName=" + groupName + "]";
	}

	
}
