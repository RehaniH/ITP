package com.nlhs.model;

public class Expense {
	
	private String ExpenseID;
	private String Type;
	private String Value;
	
	public Expense() {
		
	}
	
	public Expense(String ID,String Etype,String Evalue) {
		super();
		this.ExpenseID=ID;
		this.Type=Etype;
		this.Value=Evalue;
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
		return "Expense [ExpenseID=" + ExpenseID + ", Type=" + Type + ", Value=" + Value + "]";
	}
	
	

}
