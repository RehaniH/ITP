package com.nlhs.service;

import java.util.ArrayList;

import com.nlhs.model.Expense;


public interface ExpenseService {
	
	public void addExpense(Expense expense);
	public ArrayList<Expense> getExpense();
	public Expense getExpenseByID(String expenseID);
	public void removeExpense(String expenseID);

}
