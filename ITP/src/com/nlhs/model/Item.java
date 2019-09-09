package com.nlhs.model;

public class Item {

	private String pid;
	private String pName;
	private String pImage;
	private String category;
	private int unitSize;

	private int costPrice;
	private int sellingPrice;
	private int bufferStock;
	private String supplierName;
	private String supplierContact;
	private String pDesc;

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public int getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(int costPrice) {
		this.costPrice = costPrice;
	}

	public int getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public int getBufferStock() {
		return bufferStock;
	}

	public void setBufferStock(int bufferStock) {
		this.bufferStock = bufferStock;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierContact() {
		return supplierContact;
	}

	public void setSupplierContact(String supplierContact) {
		this.supplierContact = supplierContact;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUnitSize() {
		return unitSize;
	}

	public void setUnitSize(int unitSize) {
		this.unitSize = unitSize;
	}

	@Override
	public String toString() {
		return "Item [pid=" + pid + ", pName=" + pName + ", pImage=" + pImage + ", category=" + category + ", unitSize="
				+ unitSize + ", costPrice=" + costPrice + ", sellingPrice=" + sellingPrice + ", bufferStock="
				+ bufferStock + ", supplierName=" + supplierName + ", supplierContact=" + supplierContact + ", pDesc="
				+ pDesc + "]";
	}

}
