package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nlhs.model.Customer;
import com.nlhs.util.DBConnection;

public class CustomerService {

	private Connection conn;
	private PreparedStatement statement;
	private String query;
	
	public void addCustomer(Customer customer) {

		try {
		    conn = DBConnection.getConnection();

			query = "INSERT INTO customer( email, password) VALUES (?, ?)";

			PreparedStatement statement = conn.prepareStatement(query);
			
			statement.setString(1, customer.getEmail());
			statement.setString(2, customer.getPassword());

			statement.execute();
			conn.close();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch(Exception s) {
			System.out.println("An exception has occured. ");
			System.out.println(s.getMessage());
			s.printStackTrace();
		}

	}//end addCustomer method
	
	public boolean changePassword(Customer customer, String newPassword) {
		
		boolean state = false;
		try {
			conn = DBConnection.getConnection();
			query = "UPDATE customer SET password = ? WHERE email = ? ";
			
			PreparedStatement statement = conn.prepareStatement(query);
			
			statement.setString(1, newPassword);
			statement.setString(2, customer.getEmail());
			//statement.setString(3, customer.getPassword());
			int result = statement.executeUpdate();
			
			if(result > 0)
				state = true;
			else
				state = false;
			
			conn.close();
			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return state;
		
		
	}//changePassword
	
	public void changePassword(Customer cus) {
		
		try {
			
			conn = DBConnection.getConnection();
			String query = "UPDATE customer as c\r\n" + 
					"SET c.password = ? WHERE c.email = ?";
			statement = conn.prepareStatement(query);
			statement.setString(1, cus.getPassword());
			statement.setString(2, cus.getEmail());
			statement.executeUpdate();
			
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
		
	}//change password
	
	public boolean passwordCheck(Customer customer) {
		
		try {
			conn = DBConnection.getConnection();
			
			query="SELECT password FROM customer WHERE email = ?";
			statement = conn.prepareStatement(query);
			statement.setString(1, customer.getEmail());
			ResultSet results = statement.executeQuery();
			
			String password = "none";
			
			while(results.next()) {
				password = results.getString(1);
				System.out.println(password);
			}
			
			
			if(password.equals(customer.getPassword())) {
					return true;
			}else
				return false;
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			try {
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
			return false;
		
		
		
			
	}//end method
		
	public int deactivateAccount(Customer customer) {
		
		int status = 0;
		try {
			conn = DBConnection.getConnection();
			query = "DELETE FROM customer WHERE email = ? and password = ?";
			statement = conn.prepareStatement(query);
			statement.setString(1, customer.getEmail());
			statement.setString(2, customer.getPassword());
			status = statement.executeUpdate();
			return status;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return status;
	}
	
	public boolean comparePassword(String pass1, String pass2) {
		
			if(pass1.equals(pass2)) 
				return true;
			else
				return false;
		
	}
	
	public int changeDetails(Customer cus) {
		
		int result = 0;
		query="UPDATE customer as c SET c.first_name = ?, c.last_name = ? WHERE c.email = ?";
		
		try {
			conn = DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			statement.setString(1, cus.getFirstName());
			statement.setString(2, cus.getLastName());
			statement.setString(3, cus.getEmail());
			result = statement.executeUpdate();
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
		return result;
		
	}//end method
	
	public void customerLogin(Customer customer) {
		
	}//end method
	
	
	
	
		
	
}
