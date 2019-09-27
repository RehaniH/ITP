package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nlhs.model.Orders;
import com.nlhs.util.DBConnection;

public class OrderService {
	
	Orders order;
	
	Connection connection;
	PreparedStatement pre;
	ArrayList list;
	String query;
	
	public void addOrder(Orders or) {
		 
		query = "INSERT INTO order(order_id, email, item_id, p_name, unit_price, quantity, p_value) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			
			connection = DBConnection.getConnection();
				pre = connection.prepareStatement(query);
				//System.out.println(or.getOrderId());
				pre.setString(1, or.getOrderId());
				//System.out.println(or.getEmail());
				pre.setString(2, or.getEmail());
				pre.setString(3, or.getItemId());
				pre.setString(4, or.getpName());
				pre.setFloat(5, (Float)or.getUnitPrice());
				pre.setInt(6, or.getQuantity());
				pre.setFloat(7, (Float)or.getpValue());
				pre.execute();
				
			
			
			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	

}
