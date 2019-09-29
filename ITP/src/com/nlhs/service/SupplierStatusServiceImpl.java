package com.nlhs.service;

import com.nlhs.model.Supplier;
import com.nlhs.util.DBConnection;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

public class SupplierStatusServiceImpl implements SupplierStatusServices{
	
	
	public static final Logger log = Logger.getLogger(SupplierStatusServiceImpl.class.getName());
	
	private static Connection connection;
	private static Statement statement;
	private PreparedStatement preparedStatement;
	static ResultSet rs= null;
	boolean results;
	
	private ArrayList<Supplier> actionOnSupplierStatus(String supplierID) {

		ArrayList<Supplier> supplierList = new ArrayList<Supplier>();
		try {
			connection = DBConnection.getConnection();
		
			if (supplierID != null && !supplierID.isEmpty()) {
				
				String query1 = "select * from supplier where supplier.supplierID = ?";
				preparedStatement = connection.prepareStatement(query1);
				preparedStatement.setString(1, supplierID);
			}
			else {
				String h="pending";
				String allSuppQuery = "select * from supplier where  supplier.status='"+h+"'";
				preparedStatement = connection.prepareStatement(allSuppQuery);
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Supplier supplier = new Supplier();
				supplier.setSupplierID(resultSet.getString(1));
				supplier.setFirstName(resultSet.getString(2));
				supplier.setCompanyName(resultSet.getString(4));
				supplier.setProductCategory(resultSet.getString(5));
				supplierList.add(supplier);
			}

		} catch (SQLException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
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
		return supplierList;
	}

	
	
	@Override
	public Supplier getSupplierbyIDStatus(String supplierID) {
		return actionOnSupplierStatus(supplierID).get(0);
	}
	
	@Override
	public ArrayList<Supplier> getSuppliers() {
		return actionOnSupplierStatus(null);
	}
	
	@Override
	public Supplier statusSupplier(String supplierID, Supplier supplier) {
		
		if (supplierID != null && !supplierID.isEmpty()) {
			
			try {
				connection = DBConnection.getConnection();
				String updateQueary = "update supplier as s set s.status =? where s.supplierID = ?";
				
				preparedStatement = connection.prepareStatement(updateQueary);
				preparedStatement.setString(1, supplier.getStatus());
				preparedStatement.setString(2, supplier.getSupplierID());
				preparedStatement.executeUpdate();

			} catch (SQLException | ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
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
		
		return getSupplierbyIDStatus(supplierID);
	}
	
	
	
	
}