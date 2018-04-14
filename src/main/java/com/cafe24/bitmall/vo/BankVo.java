package com.cafe24.bitmall.vo;

public class BankVo {

	private long no;
	private String bankName;
	private String sender;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	
	@Override
	public String toString() {
		return "BankVo [no=" + no + ", bankName=" + bankName + ", sender=" + sender + "]";
	}
	
	
}
