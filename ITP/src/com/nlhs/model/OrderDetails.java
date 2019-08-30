package com.nlhs.model;

import java.sql.Date;

public class OrderDetails {
	
	private String orderId;
	private Date dDate;
	private float total;
	private float GrandTotal;
	private String customerId;

	/**
	 * @return the orderId
	 */
	public String getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	/**
	 * @return the dDate
	 */
	public Date getdDate() {
		return dDate;
	}
	/**
	 * @param dDate the dDate to set
	 */
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	/**
	 * @return the total
	 */
	public float getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(float total) {
		this.total = total;
	}
	/**
	 * @return the grandTotal
	 */
	public float getGrandTotal() {
		return GrandTotal;
	}
	/**
	 * @param grandTotal the grandTotal to set
	 */
	public void setGrandTotal(float grandTotal) {
		GrandTotal = grandTotal;
	}
	
	
	

}
