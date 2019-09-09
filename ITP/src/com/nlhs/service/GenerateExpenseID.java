package com.nlhs.service;

import java.util.ArrayList;

public class GenerateExpenseID {
	
	public static String generateIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = "E" + next;
		if (arrayList.contains(id)) {
			next++;
			id = "E" + next;
		}
		return id;
	}


}
