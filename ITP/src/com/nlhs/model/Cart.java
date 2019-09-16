package com.nlhs.model;

public class Cart {
//	   cusEmail varChar(30) ,
//       itemId char(10) ,
//       quatity int,
//       pValue int,
//       pImage char(50),
	private String cusEmail;
	private String pName;

	private String itemId;
	private int quantity;
	private float unitPrice;
	private float pValue;
	private String pImage;

	public String getCusEmail() {
		return cusEmail;
	}

	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getpValue() {
		return pValue;
	}

	public void setpValue(float pValue) {
		this.pValue = pValue;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}

}
