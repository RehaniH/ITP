package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nlhs.model.CustomerAddress;
import com.nlhs.model.OrderDetails;
import com.nlhs.util.DBConnection;

public class OrderDetailsService {

	private PreparedStatement statement;

	private String query;
	private Connection conn;
	private ResultSet result;
	private OrderDetails order;
	
	public ArrayList getOrderDetails(String id) {
		ArrayList<OrderDetails> list = new ArrayList<>();
		
		try {
			query = "SELECT * FROM order_details WHERE customer_id = ?";
			conn = DBConnection.getConnection();
			statement = conn.prepareStatement(query);
			statement.setString(1, id);
			result = statement.executeQuery();
			
			while(result.next()){
				order = new OrderDetails();
				order.setOrderId(result.getString(1));
				order.setdDate(result.getDate(2));
				order.setTotal(result.getFloat(3));
				order.setGrandTotal(result.getFloat(4));
				list.add(order);
				
			}
			
			return list;
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}
}
