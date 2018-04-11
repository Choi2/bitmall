package com.cafe24.bitmall.vo;

public class ImageVo {
	private long no;
	private String path;
	private long itemNo;

	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public long getItemNo() {
		return itemNo;
	}
	public void setItemNo(long itemNo) {
		this.itemNo = itemNo;
	}

	@Override
	public String toString() {
		return "ImageVo [no=" + no + ", path=" + path + ", itemNo=" + itemNo + "]";
	}
		
}
