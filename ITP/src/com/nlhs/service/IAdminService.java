package com.nlhs.service;

import com.nlhs.model.Admin;

public interface IAdminService {

	public String addAdmin(Admin admin);

	public Admin getAdmin(String id);

	public String updateAdminProfile(Admin admin);

}
