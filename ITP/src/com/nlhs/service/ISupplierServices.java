package com.nlhs.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.nlhs.model.Supplier;

public interface ISupplierServices {

	public static final Logger log = Logger.getLogger(ISupplierServices.class.getName());

	public void addSupplier(Supplier supplier);
	
	public Supplier getSupplierbyID(String supplierID);
	
	public ArrayList<Supplier> getSuppliers();
	
	public Supplier updateSupplier(String supplierID, Supplier supplier);

	public void removeSupplier(String supplierID);

	public void login(String email, String password);

	public Supplier updateSupplierProfile(String supplierID, Supplier supplier);

}
