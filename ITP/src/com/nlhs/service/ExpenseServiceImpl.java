package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.nlhs.model.Expense;
import com.nlhs.util.DBConnection;

public class ExpenseServiceImpl implements ExpenseService {

	public static final Logger log = Logger.getLogger(ExpenseServiceImpl.class.getName());
	private static Connection connection;
	private static Statement statement = null;
	private static PreparedStatement preparedStatement;
	boolean results;

	@Override
	public void addExpense(Expense expense) {
		String expenseID = GenerateExpenseID.generateIDs(getExpenseIDs());
		expense.setExpenseID(expenseID);

		String sqlInsert = "insert into expense(expenseID,type,value) VALUES ( ? , ? , ? )";

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sqlInsert);
			preparedStatement.setString(1, expense.getExpenseID());
			preparedStatement.setString(2, expense.getType());
			preparedStatement.setString(3, expense.getValue());
			results = preparedStatement.execute();
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
	}

	public ArrayList<String> getExpenseIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();

		String GetExpenseSql = "select e.expenseID from expense as e";

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(GetExpenseSql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(1));
			}
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return arrayList;
	}

	private ArrayList<Expense> actionOnExpense(String expenseID) {

		ArrayList<Expense> expenseList = new ArrayList<Expense>();
		try {
			connection = DBConnection.getConnection();

			if (expenseID != null && !expenseID.isEmpty()) {

				String queary1 = "select * from expense where expense.expenseID = ?";
				preparedStatement = connection.prepareStatement(queary1);
				preparedStatement.setString(1, expenseID);
			}

			else {
				String allExpenseQueary = "select * from expense";
				preparedStatement = connection.prepareStatement(allExpenseQueary);
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Expense expense = new Expense();
				expense.setExpenseID(resultSet.getString(1));
				expense.setType(resultSet.getString(2));
				expense.setValue(resultSet.getString(3));

				expenseList.add(expense);
			}

		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return expenseList;
	}

	@Override
	public ArrayList<Expense> getExpense() {
		return actionOnExpense(null);
	}

	@Override
	public Expense getExpenseByID(String expenseID) {

		return actionOnExpense(expenseID).get(0);
	}

	@Override
	public Expense updateExpense(String expenseID, Expense expense) {
		if (expenseID != null && !expenseID.isEmpty()) {
			try {
				connection = DBConnection.getConnection();
				String updateQuery = "update expense as e set e.type=?,e.value=? where e.expenseID=? ";

				preparedStatement = connection.prepareStatement(updateQuery);
				preparedStatement.setString(1, expense.getType());
				preparedStatement.setString(2, expense.getValue());
				preparedStatement.setString(3, expense.getExpenseID());
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
		return getExpenseByID(expenseID);
	}

	@Override
	public void removeExpense(String expenseID) {

		if (expenseID != null && !expenseID.isEmpty()) {
			try {

				connection = DBConnection.getConnection();

				String removeQuery = "delete from expense where expense.expenseID=?";

				preparedStatement = connection.prepareStatement(removeQuery);
				preparedStatement.setString(1, expenseID);
				preparedStatement.executeUpdate();

			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}

				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}

	}

}
