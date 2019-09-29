package com.nlhs.service;

import java.util.ArrayList;

import com.nlhs.model.Income;

public interface IncomeService {
	
	public void addIncome(Income income);
	public ArrayList<Income> getIncome();
	public Income getIncomeByID(String incomeID);
	public void removeIncome(String incomeID);

}
