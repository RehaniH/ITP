package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.nlhs.model.Income;
import com.nlhs.util.DBConnection;

public class IncomeServiceImpl implements IncomeService {

	public static final Logger log = Logger.getLogger(IncomeServiceImpl.class.getName());
	private static Connection connection;
	private static Statement statement = null;
	private static PreparedStatement preparedStatement;
	boolean results;

	@Override
	public void addIncome(Income income) {
		String incomeID = GenerateIncomeID.generateIDs(getIncomeIDs());
		income.setIncomeID(incomeID);

		String sqlInsert = "insert into income(incomeID,type,value) VALUES ( ? , ? , ? )";

		try {

			connection = DBConnection.getConnection();

			preparedStatement = connection.prepareStatement(sqlInsert);
			preparedStatement.setString(1, income.getIncomeID());
			preparedStatement.setString(2, income.getType());
			preparedStatement.setString(3, income.getValue());
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

	public ArrayList<String> getIncomeIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();

		String GetIncomeSql = "select i.incomeID from income as i";

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(GetIncomeSql);
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

	private ArrayList<Income> actionOnIncome(String incomeID) {

		ArrayList<Income> incomeList = new ArrayList<Income>();
		try {
			connection = DBConnection.getConnection();

			if (incomeID != null && !incomeID.isEmpty()) {

				String queary1 = "select * from income where income.incomeID = ?";
				preparedStatement = connection.prepareStatement(queary1);
				preparedStatement.setString(1, incomeID);
			}

			else {
				String allIncomeQueary = "select * from income";
				preparedStatement = connection.prepareStatement(allIncomeQueary);
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Income income = new Income();
				income.setIncomeID(resultSet.getString(1));
				income.setType(resultSet.getString(2));
				income.setValue(resultSet.getString(3));

				incomeList.add(income);
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
		return incomeList;
	}

	@Override
	public ArrayList<Income> getIncome() {
		return actionOnIncome(null);
	}

	@Override
	public Income getIncomeByID(String incomeID) {

		return actionOnIncome(incomeID).get(0);
	}

	@Override
	public Income updateIncome(String incomeID, Income income) {
		if (incomeID != null && !incomeID.isEmpty()) {
			try {
				connection = DBConnection.getConnection();
				String updateQuery = "update income as i set i.type=?,i.value=? where i.incomeID=? ";

				preparedStatement = connection.prepareStatement(updateQuery);
				preparedStatement.setString(1, income.getType());
				preparedStatement.setString(2, income.getValue());
				preparedStatement.setString(3, income.getIncomeID());
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
		return getIncomeByID(incomeID);
	}

	@Override
	public void removeIncome(String incomeID) {

		if (incomeID != null && !incomeID.isEmpty()) {
			try {
				connection = DBConnection.getConnection();
				String removeQuery = "delete from income where income.incomeID=?";

				preparedStatement = connection.prepareStatement(removeQuery);
				preparedStatement.setString(1, incomeID);
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
