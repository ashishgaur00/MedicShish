package com.medic.LoginPojo;

import java.io.Serializable;

public class SearchVO implements Serializable {
	private long id ;
	private String  name;
	private int  quantity;
	private int  ttlQuantityPresent;
	private long  prize;
	private long  CGST;
	
	
	public int getTtlQuantityPresent() {
		return ttlQuantityPresent;
	}


	public void setTtlQuantityPresent(int ttlQuantityPresent) {
		this.ttlQuantityPresent = ttlQuantityPresent;
	}
	public long getCGST() {
		return CGST;
	}


	public void setCGST(long cGST) {
		CGST = cGST;
	}
	private long  IGST;
	private long   discount;
	private long   total;
    public SearchVO() {
    }

	
	@Override
	public String toString() {
		return "SearchVO [id=" + id + ", name=" + name + ", quantity=" + quantity + ", prize=" + prize + ", CGST="
				+ CGST + ", IGST=" + IGST + ", discount=" + discount + ", total=" + total + "]";
	}


	public SearchVO(long id, String name, int quantity, long prize, long cGST, long iGST, long discount, long total) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.prize = prize;
		CGST = cGST;
		IGST = iGST;
		this.discount = discount;
		this.total = total;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public long getPrize() {
		return prize;
	}
	public void setPrize(long prize) {
		this.prize = prize;
	}
	public long getIGST() {
		return IGST;
	}
	public void setIGST(long iGST) {
		IGST = iGST;
	}
	public long getDiscount() {
		return discount;
	}
	public void setDiscount(long discount) {
		this.discount = discount;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	
	

	
	

}
