package com.nlhs.service;
import java.util.ArrayList;

public class GenerateIncomeID {
		public static String generateIDs(ArrayList<String> arrayList) {

			String id;
			int next = arrayList.size();
			next++;
			id = "I" + next;
			if (arrayList.contains(id)) {
				next++;
				id = "I" + next;
			}
			return id;
		}
	

}
