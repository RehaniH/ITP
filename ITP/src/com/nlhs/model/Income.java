package com.nlhs.model;

public class Income {
	
	private String Date;
	private String IncomeID;
	private String Type;
	private String Value;
	
	public Income() {
		
	}
	
	

	public String getDate() {
		return Date;
	}



	public void setDate(String date) {
		Date = date;
	}



	public Income(String date, String incomeID, String type, String value) {
		super();
		Date = date;
		IncomeID = incomeID;
		Type = type;
		Value = value;
	}



	public String getIncomeID() {
		return IncomeID;
	}

	public void setIncomeID(String incomeID) {
		IncomeID = incomeID;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public String getValue() {
		return Value;
	}

	public void setValue(String value) {
		Value = value;
	}



	@Override
	public String toString() {
		return "Income [Date=" + Date + ", IncomeID=" + IncomeID + ", Type=" + Type + ", Value=" + Value + "]";
	}

	
	
	

}
