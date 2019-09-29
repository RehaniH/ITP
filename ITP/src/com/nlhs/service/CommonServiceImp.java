package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nlhs.model.Admin;
import com.nlhs.model.Customer;
import com.nlhs.model.Supplier;
import com.nlhs.util.DBConnection;

import comPula.RegisterUser;

public class CommonServiceImp {

	private static Connection connection;
	private PreparedStatement preparedStatement;

	public Admin isValidAdmin(String email, String password) {

		ResultSet rs;
		// String[] result = new String[2];
		Admin admin = null;

		String sql1 = "select * from Admin where email = ? and password = ?";

		try {

			connection = DBConnection.getConnection();

			preparedStatement = connection.prepareStatement(sql1);

			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				admin = new Admin();
				admin.setAid(rs.getString(1));
				admin.setFname(rs.getString(2));
				admin.setLname(rs.getString(3));
				admin.setProfilePic(rs.getString(4));

				admin.setAge(rs.getInt(5));

				admin.setContactNumber(rs.getString(6));
				admin.setEmail(rs.getString(7));
				admin.setPassword(rs.getString(8));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return admin;

	}

	public Customer isValidCustomer(String email, String password) {

		ResultSet rs;

		Customer cus = null;

		String query = "select * from customer where email = ? and password = ?";

		try {
			try {
				connection = DBConnection.getConnection();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				cus = new Customer();
				System.out.println("i got a result in validCustomer" + rs.getString(1));

				cus.setEmail(rs.getString(1));
				cus.setPassword(rs.getString(2));

			}

			return cus;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return cus;

	}// end method

	public Supplier isValidSupplier(String email, String password) {

		ResultSet rs;

		Supplier sup = null;

		String query = "select * from supplier where emailAddress = ? and password = ?";

		try {
			try {
				connection = DBConnection.getConnection();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
		
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				sup = new Supplier();
				System.out.println("i got a result in valid Supplier" + rs.getString(1));
				sup.setEmailAddress(rs.getString(1));
				sup.setPassword(rs.getString(2));
				sup.setSupplierID(rs.getString(3));
			}

			return sup;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return sup;

	}// end method

	public String isValidDelivery(String userName, String password) {
		RegisterUser user = new RegisterUser();
		String mess = user.logUser(userName, password);
		return mess;
	}

}
