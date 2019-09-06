package com.nlhs.service;

import java.util.ArrayList;

import com.nlhs.model.SupPro;

public interface SupProService {

	public void addSupPro( SupPro supPro) ;
	
	public ArrayList<SupPro> getSupPro();
	
	public SupPro getSupProByID(String supProId);
	
	public SupPro updateSupPro(String SupProId, SupPro supPro);
	
	public void removeSupPro(String SupPro);

	
	
}
