package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nlhs.model.Deactivated;
import com.nlhs.util.DBConnection;

public class DeactivatedCusService {
	private Connection conn;
	private PreparedStatement statement;
	private String query;
	private ResultSet result;
	
	public ArrayList<Deactivated> getDeactivatedCustomers() {
		
		ArrayList<Deactivated> list = new ArrayList<>();
		Deactivated cus;
		query = "SELECT * FROM deactivated_customers";
		
		try {
			conn = DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			
			result = statement.executeQuery();
			
			while(result.next()) {
				cus = new Deactivated();
				cus.setEmail(result.getString(1));
				cus.setReason(result.getString(2));
				list.add(cus);
			}
			
			return list;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		}
		return list;
		
	}//end method
	
	public void insertDeactivated(Deactivated dcus) {
		try {
			conn = DBConnection.getConnection();
			query = "INSERT INTO deactivated_customers(email, reason) VALUES(?, ?)";
			statement = conn.prepareStatement(query);
			statement.setString(1, dcus.getEmail());
			statement.setString( 2, dcus.getReason());
			statement.execute();
			conn.close();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}//end method
	
	
	public ArrayList<Deactivated>  getReasons() {
		
		Deactivated deac ;
		ArrayList<Deactivated> list = new ArrayList<>();
		query = "SELECT reason, COUNT(email) FROM deactivated_customers GROUP BY reason";
		
		try {
			conn = DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			result = statement.executeQuery();
			
			while(result.next()) {
				 deac = new Deactivated();
				 deac.setReason(result.getString(1));
				 deac.setEmail(result.getString(2));
				 list.add(deac);
			}
			
			return list;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
	}//end method
	
	
}
