package com.nlhs.service;

import java.util.ArrayList;



public class GenerateOfferId {

	public static String generateIDs(ArrayList<String> arrayList) {
	

		String id;
		int next = arrayList.size();
		next++;
		id = "Offer100" + next;
		if (arrayList.contains(id)) {
			next++;
			id = "Offer100" + next;
		}
		return id;
		
		
		
	}

}
