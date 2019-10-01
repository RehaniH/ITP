package com.nlhs.service;
/**
 * @author IT18176070 Perera P.R.H
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nlhs.model.CustomerAddress;
import com.nlhs.util.DBConnection;

public class CustomerAddressService {
	
	private PreparedStatement statement;

	private String query;
	private Connection conn;

	
	/**
	 * Used to add the customer addresses to the database
	 * @param address
	 * @param userName
	 */
	public void addAddress(CustomerAddress address, String userName) {
		
		try {
			
			String customerId = getCustomerId(userName);
			
			if(customerId == null) {
				customerId = generateCustomerId();
			}
				
			
			conn = DBConnection.getConnection();
			
			query = "insert into customer_address(customer_id, is_billing, is_delivery, social_status, first_name, last_name, address_line1, address_line2, city, district, postal_code, \r\n" + 
					"telephone, email) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			PreparedStatement statement = conn.prepareStatement(query);
			
			
			
			
			//System.out.println(customerId);
			statement.setString(1, customerId);
			statement.setBoolean(2, address.isBilling());
			statement.setBoolean(3, address.isDelivery());
			statement.setString(4, address.getSocialStatus() );
			statement.setString(5, address.getFname());
			statement.setString(6, address.getLname());
			statement.setString(7, address.getNo());
			statement.setString(8, address.getStreet());
			statement.setString(9, address.getCity());
			statement.setString(10, address.getDistrict());
			statement.setInt(11, address.getPostalCode() );
			statement.setString(12, address.getTelephone());
			statement.setString(13, address.getEmail());
			
			statement.execute();
			conn.close();
			
			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}//end of method 
	
	/**
	 * Used to support generateCustomerIds() method
	 * @return
	 */
	public ArrayList<String> getCustomerIds() {
		
		ArrayList<String> list = new ArrayList<String>();
		ResultSet results;
		
		try {
			
			query = "select customer_id from customer_address";
			statement = conn.prepareStatement(query);
			results = statement.executeQuery();
			
			while(results.next()) {
				list.add(results.getString(1));
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
	}//end of method
	
	/**
	 * Generate a unique customer Id 
	 * @return
	 */
	public String generateCustomerId() {
		
		ArrayList<String> list = getCustomerIds();
		String id;
		String mid =  "CUS";
		int size = list.size();
		
		if(size == 0) {
			int first = 1;
			return (mid + "000000" + first);
		}
		
		String next = list.get(size-1);
		int current = Integer.parseInt(next.replaceAll("[^0-9]", ""));
		
		current++;
		double value = current / 1000000.0;
		
		if(value < 0.00001) 
			value = 5;
		else if (value < 0.0001)
			value = 4;
		else if(value < 0.001)			
			value = 3;
		else if(value < 0.01)
			value = 2;
		else if(value < 0.1)
			value = 1;
		else 
			value = 0;
			
		System.out.println(current);
		
		
		for(int i = 0 ; i <= value ; i++)
			mid = mid + "0";
			
		id = (  mid + current);
		
		
		return id;
		
	}
	
	/**
	 * Get all address details of a customer 
	 * @param userName
	 * @return
	 */
	public ArrayList getDetails(String userName) {
		
		ArrayList<CustomerAddress> list = new ArrayList<>();
		CustomerAddress address;
		
		query = "SELECT * FROM customer_address WHERE email = ?";
		
		try {
			conn = DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			statement.setString(1, userName);
			ResultSet results = statement.executeQuery();
			
			
			while(results.next()) {
				address = new CustomerAddress();
				address.setCustomerId(results.getString(1));
				address.setBilling(results.getBoolean(2));
				address.setDelivery(results.getBoolean(3));
				address.setSocialStatus(results.getString(4));
				address.setFname(results.getString(5));
				address.setLname(results.getString(6));
				address.setNo(results.getString(7));
				address.setStreet(results.getString(8));
				address.setCity(results.getString(9));
				address.setDistrict(results.getString(10));
				address.setPostalCode(results.getInt(11));
				address.setTelephone(results.getString(12));
				address.setEmail(results.getString(13));
				
				System.out.println(address.getFname());
				list.add(address);
			}
			
			conn.close();
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	/**
	 * Used to update a selected customer address
	 * @param address
	 * @param userName
	 * @return
	 */
	public int UpdateAddress(CustomerAddress address, String userName) {
		
		int updated = 0;
		try {
			conn = DBConnection.getConnection();
			query = "UPDATE customer_address SET first_name = ?, last_name = ?, address_line1 = ?, address_line2 = ?,  city = ?, district = ?,\r\n" + 
					"	postal_code = ?, telephone = ? " + 
					"	WHERE email = ? and is_billing = ? and is_delivery = ?";
			System.out.println("Inside the update address method");
			System.out.println();
			statement = conn.prepareStatement(query);
			statement.setString(1, address.getFname());
			statement.setString(2, address.getLname());
			statement.setString(3, address.getNo());
			statement.setString(4, address.getStreet());
			statement.setString(5, address.getCity());
			statement.setString(6, address.getDistrict());
			statement.setInt(7, address.getPostalCode());
			statement.setString(8, address.getTelephone());
			statement.setString(9, userName);
			statement.setBoolean(10, address.isBilling());
			statement.setBoolean(11, address.isDelivery());
			updated = statement.executeUpdate();
			conn.close();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return updated;
	}
	
	/**
	 * Return customer id of the session owner 
	 * @param userName
	 * @return
	 */
	public String getCustomerId(String userName) {
		
		String id = null;
		
		try {
			
			
			conn = DBConnection.getConnection();
			query="SELECT customer_id FROM customer_address WHERE email = ? ";
			statement = conn.prepareStatement(query);
			statement.setString(1, userName);
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				id = result.getString(1);
			}

			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return id;
	}
	
	/**
	 * Search customers  from specific district
	 * @param address
	 * @return
	 */
	public ArrayList searchCustomer(CustomerAddress address) {
		
			ArrayList list = new ArrayList();
			CustomerAddress cusAddress;
		try {
			conn = DBConnection.getConnection();
			query = "SELECT customer_id, email, first_name, last_name FROM customer_address WHERE district = ? "
					+ "AND is_billing = ?";
			
			statement = conn.prepareStatement(query);
			statement.setString(1, address.getDistrict());
			statement.setBoolean(2, true);
			
			ResultSet results = statement.executeQuery();
			
			while(results.next()) {
				cusAddress = new CustomerAddress();
				cusAddress.setCustomerId(results.getString(1));
				cusAddress.setEmail(results.getString(2));
				cusAddress.setFname(results.getString(3));
				cusAddress.setLname(results.getString(4));
				
				list.add(cusAddress);
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
		}//end final block
		return list;
		
	}//end method
	
	/**
	 * Returns no  of customers registered
	 * @return
	 */
	public String getNoOfCustomers() {
		
		String number = null;
		
		try {
			
			conn = DBConnection.getConnection();
			query="SELECT COUNT(customer_id) FROM customer_address;";
			
			statement = conn.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				number = result.getString(1);
			}
			
			return number;
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return number;
		
		
	}
	
	/**
	 * Returns true if a certain customer exist in the database
	 * @param userName
	 * @return
	 */
	public boolean getExistance(String userName, boolean isBilling, boolean isDelivery) {
		
		int num = 0;
		
		query="select count(customer_id) from customer_address where is_billing = ? and is_delivery = ? and email = ?";
		
		try {
			conn =DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			statement.setBoolean(1, isBilling);
			statement.setBoolean(2, isDelivery);
			statement.setString(3, userName);
			ResultSet results = statement.executeQuery();
			
			
			while(results.next()) {
				num = Integer.parseInt(results.getString(1));
			}
			
			if(num == 0) {
				return false;
			}else
				return true;
				
			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return false;
		
	}
	
	/**
	 * Delete a certain customer records from the database
	 */
	public void deleteAddressDetails(String userName) {
		query = "DELETE FROM customer_address WHERE email = ?";
		
		try {
			conn = DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			statement.setString(1, userName);
			statement.executeUpdate();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * Search a customer by customer last name
	 */
	public ArrayList SearchByLastName(String words) {
		
		CustomerAddress cus;
		ArrayList searchList = new ArrayList();
		query = "select * from customer_address where is_billing = true and (last_name like ? or first_name like ?"
				+ " or address_line1 like ? or address_line2 like ? or city like ? or district like ? or email like ?)";
		
		try {
			conn = DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			statement.setString(1, "%" + words + "%");
			statement.setString(2, "%" + words + "%");
			statement.setString(3, "%" + words + "%");
			statement.setString(4, "%" + words + "%");
			statement.setString(5, "%" + words + "%");
			statement.setString(6, "%" + words + "%");
			statement.setString(7, "%" + words + "%");
			ResultSet results = statement.executeQuery();
			
			while(results.next()) {
				cus = new CustomerAddress();
				cus.setCustomerId(results.getString(1));
				cus.setBilling(results.getBoolean(2));
				cus.setDelivery(results.getBoolean(3));
				cus.setSocialStatus(results.getString(4));
				cus.setFname(results.getString(5));
				cus.setLname(results.getString(6));
				cus.setNo(results.getString(7));
				cus.setStreet(results.getString(8));
				cus.setCity(results.getString(9));
				cus.setDistrict(results.getString(10));
				cus.setPostalCode(results.getInt(11));
				cus.setTelephone(results.getString(12));
				cus.setEmail(results.getString(13));
				
				searchList.add(cus);
				
			}
			
			return searchList;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return searchList;
		
	}
}
