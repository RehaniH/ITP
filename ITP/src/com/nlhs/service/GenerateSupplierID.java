package com.nlhs.service;
import java.util.ArrayList;

public class GenerateSupplierID {
	
	public static String generateSupplierIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		
		next++;
		id = "S0" + next;
		if (arrayList.contains(id)) {
			
			next++;
			id = "S0" + next;
			
		}
		return id;
	}


}
