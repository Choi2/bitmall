package com.cafe24.bitmall.vo;

public class CardVo {
	private long no;
	private String sort;
	private String number;
	private String period;
	private String password;
	private long divide;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getDivide() {
		return divide;
	}
	public void setDivide(long divide) {
		this.divide = divide;
	}
	@Override
	public String toString() {
		return "CardVo [no=" + no + ", sort=" + sort + ", number=" + number + ", period=" + period + ", password="
				+ password + ", divide=" + divide + "]";
	}
}
