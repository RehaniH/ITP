package com.nlhs.service;

import java.util.ArrayList;

import com.nlhs.model.Supplier;

public interface SupplierStatusServices {
	
	
	public Supplier getSupplierbyIDStatus(String supplierID);
	
	public ArrayList<Supplier> getSuppliers();
		
	public Supplier statusSupplier(String supplierID, Supplier supplier);


}
