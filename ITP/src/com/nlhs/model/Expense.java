package com.nlhs.model;

public class Expense {
	
	private String Date;
	private String ExpenseID;
	private String Type;
	private String Value;
	
	public Expense() {
		
	}
	
	


	public Expense(String date, String expenseID, String type, String value) {
		super();
		Date = date;
		ExpenseID = expenseID;
		Type = type;
		Value = value;
	}




	public String getDate() {
		return Date;
	}




	public void setDate(String date) {
		Date = date;
	}




	public String getExpenseID() {
		return ExpenseID;
	}

	public void setExpenseID(String expenseID) {
		ExpenseID = expenseID;
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
		return "Expense [Date=" + Date + ", ExpenseID=" + ExpenseID + ", Type=" + Type + ", Value=" + Value + "]";
	}

	
	
	

}
