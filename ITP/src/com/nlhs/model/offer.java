package com.nlhs.model;



public class offer {

	private  String offerId;
	private  String supId;
	private  String start;
	private  String expire;
	private String company;
	private String product;
	private String discount;
	private String description;
	
	
	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}
	
	public String getOfferId() {
		return offerId;
	}	
	
	public void setSupId(String supId) {
		this.supId = supId;
	}
	
	public String getSupId() {
		return supId;
	}
		
	public void setStart(String start) {
		this.start = start;
	}
	
	public String getStart() {
		return start;
	}
		
	public void setExpire(String expire) {
		this.expire = expire;
	}
	
	public String getExpire()
	{
		return expire;
	}
	
	
	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getCompany() {
		return company;
	}
	
	
	public void setProduct(String product) {
		this.product = product;
	}
	
	public String getProduct() {
		return product;
	}
	
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	
	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getDiscount() {
		return discount;
	}

	

	@Override
	public String toString() {
		return "offer [offerId=" + offerId + ", supId=" + supId + ", start=" + start + ", expire=" + expire
				+ ", company=" + company + ", product=" + product + ", discount=" + discount + ", description="
				+ description + "]";
	}

	
	
	
}
