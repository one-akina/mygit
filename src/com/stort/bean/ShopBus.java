package com.stort.bean;

public class ShopBus {
	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Commodit getCommodit() {
		return commodit;
	}

	public void setCommodit(Commodit commodit) {
		this.commodit = commodit;
	}

	private Integer ID;
	
	private Integer number;
	
	private Integer total;
	
	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	private Commodit commodit;
}
