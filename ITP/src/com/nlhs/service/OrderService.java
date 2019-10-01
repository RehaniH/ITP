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
		 
		query = "INSERT INTO orders(order_id, email, item_id, p_name, unit_price, quantity, p_value) VALUES(?, ?, ?, ?, ?, ?, ?)";
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
	
	/**
	 * @author IT18176070 Perera P.R.H
	 */
	
	public ArrayList getOrderById(String id) {
		
		ArrayList list = new ArrayList();
		Orders orders = null ;
		query = "select * from orders where order_id = ?";
		try {
			connection = DBConnection.getConnection();
			pre = connection.prepareStatement(query);
			pre.setString(1, id);
			ResultSet results = pre.executeQuery();
			
			while(results.next()) {
				orders = new Orders();
				orders.setOrderId(id);
				System.out.println(id);
				orders.setEmail(results.getString(2));
				System.out.println(orders.getEmail());
				orders.setItemId(results.getString(3));
				orders.setpName(results.getString(4));
				orders.setUnitPrice(results.getFloat(5));
				orders.setQuantity(results.getInt(6));
				orders.setpValue(results.getFloat(7));
				list.add(orders);
			}
			
			return list;
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
		
		
	}//end method 
	
	public int deleteOrderReceipt(String orderId) {
		int status = 0;
		query = "DELETE FROM orders WHERE order_id = ?";
		try {
			connection = DBConnection.getConnection();
			pre = connection.prepareStatement(query);
			pre.setString(1, orderId);
			status = pre.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return status;
		
		
	}
	
	

}
