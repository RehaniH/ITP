package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nlhs.model.OrderDetails;
import com.nlhs.util.DBConnection;

public class OrderDetailsService {
	
	Connection connection;
	PreparedStatement pre;
	ArrayList list;
	String query;
	
	public String addOrderDetails(OrderDetails details) {
		
		String orderId = generateOrderId(getAllOrders());
		query = "INSERT INTO order_details(order_id, email, amount, delivery_charges, grand_total, order_date, payment_status, order_status)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			connection = DBConnection.getConnection();
			pre = connection.prepareStatement(query);
			pre.setString(1, orderId);
			System.out.println(orderId);
			pre.setString(2, details.getEmail());
			pre.setFloat(3, details.getAmount());
			
			pre.setFloat(4, details.getDeliveryCharges());
			pre.setFloat(5, details.getGrandTotal());
			pre.setDate(6, details.getOrderDate());
			pre.setString(7, details.getPaymentStatus());
			pre.setString(8, details.getOrderStatus());
			pre.execute();
			
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderId;
		
	}
	
	public void selectOrderDetails(String userName) {
		
	}
	

	public ArrayList getAllOrders() {
		
		OrderDetails details;
		list = new ArrayList<OrderDetails>();
		query = "select * from order_details";
		try {
			connection = DBConnection.getConnection();
			pre = connection.prepareStatement(query);
			ResultSet resultsSet = pre.executeQuery();
			
			while(resultsSet.next()) {
				details = new OrderDetails();
				details.setOrderId((resultsSet.getString(1)));
				
				list.add(details);
				
				
			}
			
			return list;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
		
		
	}
	
	public String generateOrderId(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = "OR"  + next;
		if (arrayList.contains(id)) {
			next++;
			id = "OR"   + next;
		}
		return id;
	}
	
}
