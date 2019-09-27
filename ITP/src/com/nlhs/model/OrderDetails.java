package com.nlhs.model;

import java.sql.Date;

public class OrderDetails {

	private String orderId;
	private String email;
	private float amount;
	private float deliveryCharges;
	private float grandTotal;
	private String paymentStatus;
	private String orderStatus;
	private Date orderDate;
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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**
	 * @return the paymentStatus
	 */
	public String getPaymentStatus() {
		return paymentStatus;
	}
	/**
	 * @param paymentStatus the paymentStatus to set
	 */
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	/**
	 * @return the orderStatus
	 */
	public String getOrderStatus() {
		return orderStatus;
	}
	/**
	 * @param orderStatus the orderStatus to set
	 */
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	/**
	 * @return the orderDate
	 */
	public Date getOrderDate() {
		return orderDate;
	}
	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	/**
	 * @return the amount
	 */
	public float getAmount() {
		return amount;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(float amount) {
		this.amount = amount;
	}
	
	/**
	 * @return the deliveryCharges
	 */
	public float getDeliveryCharges() {
		return deliveryCharges;
	}
	/**
	 * @param deliveryCharges the deliveryCharges to set
	 */
	public void setDeliveryCharges(float deliveryCharges) {
		this.deliveryCharges = deliveryCharges;
	}
	/**
	 * @return the grandTotal
	 */
	public float getGrandTotal() {
		return grandTotal;
	}
	/**
	 * @param grandTotal the grandTotal to set
	 */
	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	
	
	
	
	
}
