package com.nlhs.service;

import java.util.ArrayList;

public class GenerateSupProId {

	public static String generateIDs(ArrayList<String> arrayList) {
		

		String id;
		int next = arrayList.size();
		next++;
		id = "SupPro100" + next;
		if (arrayList.contains(id)) {
			next++;
			id = "SupPro100" + next;
		}
		return id;
		
		
		
	}
	
	
	
}
