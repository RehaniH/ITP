package com.nlhs.model;

public class SupPro {

	private String supProId;
	private String sid;
	private String sname;
	private String phone;
	private String company;
	private String type;
	private String product;
	private String quantity;
	private String totalPri;
	
	public void setSupProId(String supProId) {
		this.supProId = supProId;
	}
	
	public String getSupProId() {
		return supProId;
	}
		
	public void setSid(String sid) {
		this.sid = sid;
	}
	
	public String getSid() {
		return sid;
	}
	
	
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	public String getSname() {
		return sname;
	}
	
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}
	
	
	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getCompany() {
		return company;
	}
	
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getType() {
		return type;
	}
	
	
	public void setProduct(String product) {
		this.product = product;
	}
	
	public String getProduct() {
		return product;
	}
	
	
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public String getQuantity() {
		return quantity;
	}
	
	
	public void setTotalPri(String totalPri) {
		this.totalPri = totalPri;
	}
	
	public String getTotalPri() {
		return totalPri;
	}

	@Override
	public String toString() {
		return "supProId=" + supProId + "\n"+" sid=" + sid +"\n"+ " sname=" + sname +"\n"+ " phone=" + phone +"\n"+ " company="
				+ company + "\n"+" type=" + type +"\n"+ " product=" + product +"\n"+ " quantity=" + quantity +"\n"+ " totalPri="
				+ totalPri;
	}
	
	
}
