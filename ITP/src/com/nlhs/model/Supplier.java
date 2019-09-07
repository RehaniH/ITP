package com.nlhs.model;

public class Supplier {

	private String supplierID;
	private String firstName;
	private String lastName;
	private String companyName;
	private String productCategory;
	private String contactNumber;
	private String emailAddress;
	private String address;
	private String password;
	private String status;
	public boolean valid;
	public Supplier(String supplierID, String firstName, String lastName, String companyName, String productCategory,
			String contactNumber, String emailAddress, String address, String password, String status) {
	
		super();
		
		this.supplierID = supplierID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.companyName = companyName;
		this.productCategory = productCategory;
		this.contactNumber = contactNumber;
		this.emailAddress = emailAddress;
		this.address = address;
		this.password = password;
		this.status = status;
	
	}

	public Supplier() {
		
		supplierID = null;
		firstName = null;
		lastName = null;
		companyName = null;
		productCategory = null;
		contactNumber = null;
		emailAddress = null;
		address = null;
		password = null;
		status = null;
	}

	public String getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(String supplierID) {
		this.supplierID = supplierID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	 public boolean isValid() {
         return valid;
	}

      public void setValid(boolean newValid) {
         valid = newValid;
	}	
	
	

	

}
