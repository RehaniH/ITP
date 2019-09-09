package com.nlhs.model;

public class Income {
	
	private String IncomeID;
	private String Type;
	private String Value;
	
	public Income() {
		
	}
	
	public Income(String ID,String Itype,String Ivalue) {
		
		super();
		this.IncomeID=ID;
		this.Type=Itype;
		this.Value=Ivalue;
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
		return "Income [IncomeID=" + IncomeID + ", Type=" + Type + ", Value=" + Value + "]";
	}
	
	

}
