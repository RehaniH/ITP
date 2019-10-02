package com.nlhs.service;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.nlhs.model.SupPro;

import com.nlhs.util.DBConnection;

public class SupProServiceImpl implements SupProService{

	public static final Logger log =Logger.getLogger(SupProServiceImpl.class.getName());
	private static Connection connection;
	
	private static PreparedStatement preparedStatement;
	
	boolean results;
	
	
	@Override
	public void addSupPro(SupPro supPro) {
		
		String supProId = GenerateSupProId.generateIDs(getSupProIDs());
		supPro.setSupProId(supProId);
		
		String sqlInsertQuery = "insert into sup_pro(`supProId`, `sid`, `sname`, `phone`, `company`, `type`, `product`, `quantity`,`totalPri`) values(?,?,?,?,?,?,?,?,?)";
	
		try {
			
			connection = new DBConnection().getConnection();
			preparedStatement = connection.prepareStatement(sqlInsertQuery);
			preparedStatement.setString(1,supPro.getSupProId());
			preparedStatement.setString(2,supPro.getSid());
			preparedStatement.setString(3,supPro.getSname());
			preparedStatement.setString(4,supPro.getPhone() );
			preparedStatement.setString(5,supPro.getCompany());
			preparedStatement.setString(6,supPro.getType());
			preparedStatement.setString(7,supPro.getProduct());
			preparedStatement.setString(8,supPro.getQuantity());
			preparedStatement.setString(9,supPro.getTotalPri());
			results = preparedStatement.execute();
			
			
		}catch(SQLException |  ClassNotFoundException e) {
			
			log.log(Level.SEVERE, e.getMessage());
		}
		finally
		{
			try {
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					preparedStatement.close();
				}
			}
			catch(SQLException e)
				{
				log.log(Level.SEVERE, e.getMessage());
				}
		}
	
	}

	private ArrayList<String> getSupProIDs() {
		
		ArrayList<String> arrayList = new ArrayList<String>();
		
		String GetSupProSqlQuery = "select e.supProId from sup_pro as e";
		
		try {
			connection = new DBConnection().getConnection();
			preparedStatement = connection.prepareStatement(GetSupProSqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				arrayList.add(resultSet.getString(1));
				
			}
		}
		catch(SQLException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
			
		}
		finally {
			try {
				if(preparedStatement != null){
					preparedStatement.close();
				}
				if(connection != null)
				{
					connection.close();
				}
			}
			catch(SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
		return arrayList;		
		
	}

	@Override
	public ArrayList<SupPro> getSupPro() {
		
		return actionOnSupPro(null);
	}

	private ArrayList<SupPro> actionOnSupPro(String supProId ) {
		
		ArrayList<SupPro>  supProList = new ArrayList<SupPro>();
		
		try {
			connection = new DBConnection().getConnection();
			
			//&& supProId.isEmpty()
			if(supProId != null )
			{
				String query1 ="select * from sup_pro where supProId=?";
				preparedStatement=connection.prepareStatement(query1);
				preparedStatement.setString(1, supProId);
			}
			else {
				String allSupProQuery ="select * from sup_pro";
				preparedStatement = connection.prepareStatement(allSupProQuery);
			}
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
		
				SupPro supPro = new SupPro();
				supPro.setSupProId(resultSet.getString(1));
				supPro.setSid(resultSet.getString(2));
				supPro.setSname(resultSet.getString(3));
				supPro.setPhone(resultSet.getString(4));
				supPro.setCompany(resultSet.getString(5));				
				supPro.setType(resultSet.getString(6));
				supPro.setProduct(resultSet.getString(7));
				supPro.setQuantity(resultSet.getString(8));
				supPro.setTotalPri(resultSet.getString(9));
				supProList.add(supPro);
			}
		}
			catch(SQLException |ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
				}
			
			finally {
				try {
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
					}
				catch(SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		return supProList;
	}

	@Override
	public SupPro getSupProByID(String supProId) {
		
		return actionOnSupPro(supProId).get(0);
	}

	@Override
	public SupPro updateSupPro(String SupProId, SupPro supPro) {
		//&& SupProId.isEmpty()
		if(SupProId != null )
		{
			try {
					connection = new DBConnection().getConnection();
							
					String updateQuery = "update sup_pro as e set e.sid=?,e.sname=?,e.phone=?,e.company=?, e.type=?,e.product=? ,e.quantity =?,e.totalPri =? where e.SupProId =?";
					preparedStatement = connection.prepareStatement(updateQuery);
					preparedStatement.setString(1,supPro.getSid());
					preparedStatement.setString(2, supPro.getSname());
					preparedStatement.setString(3,supPro.getPhone());
					preparedStatement.setString(4, supPro.getCompany());
					preparedStatement.setString(5, supPro.getType());
					preparedStatement.setString(6, supPro.getProduct());
					preparedStatement.setString(7, supPro.getQuantity());
					preparedStatement.setString(8, supPro.getTotalPri());
					preparedStatement.setString(9, supPro.getSupProId());
					preparedStatement.executeUpdate();
			}
			catch(SQLException | ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			
			}
			finally {
				
				try {
					
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				
				if(connection != null) {
					connection.close();
				}
					}
				catch(SQLException e)
				  {
					log.log(Level.SEVERE, e.getMessage());
				  }
			   }	
			}
			return getSupProByID(SupProId);		
	}

	@Override
	public void removeSupPro(String SupProId) {
		//&& SupProId.isEmpty()
		
		if(SupProId != null )
		{
			try {
				connection = new DBConnection().getConnection();
				
				String removeQuery ="delete from sup_pro where sup_pro.SupProId=?";
				
				preparedStatement = connection.prepareStatement(removeQuery);
				preparedStatement.setString(1, SupProId);
				preparedStatement.executeUpdate();
				
				}
			catch(SQLException | ClassNotFoundException e)
			{
				log.log(Level.SEVERE , e.getMessage());
			}
		
		
		 finally  {
			try {				
			
			if(preparedStatement != null)
			{
				preparedStatement.close();
			}
			if(connection != null) {
				connection.close();
			}
				}
			
		catch(SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
				}
		 		
		 	}
		}
	}
				
	

}
