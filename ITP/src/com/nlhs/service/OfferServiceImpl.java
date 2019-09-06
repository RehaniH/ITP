package com.nlhs.service;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.nlhs.model.offer;
import com.nlhs.util.DBConnection;


public class OfferServiceImpl implements OfferService {

	public static final Logger log =Logger.getLogger(OfferServiceImpl.class.getName());
	private static Connection connection;
	
	private static PreparedStatement preparedStatement;
	
	boolean results;
	
	@Override
	public void addOffer(offer offer)  {
		
		String offerId = GenerateOfferId.generateIDs(getofferIDs());
		offer.setOfferId(offerId);
		
		
		String sqlInsertQuery = "insert into offer(`offerId`, `supId`, `start`, `expire`, `company`, `product`, `description`) values(?,?,?,?,?,?,?)";
		
		try {
			connection = new DBConnection().getConnection();
			preparedStatement = connection.prepareStatement(sqlInsertQuery);
			preparedStatement.setString(1, offer.getOfferId());
			preparedStatement.setString(2, offer.getSupId());
			preparedStatement.setString(3, offer.getStart());
			preparedStatement.setString(4, offer.getExpire());
			preparedStatement.setString(5, offer.getCompany());
			preparedStatement.setString(6, offer.getProduct());
			preparedStatement.setString(7, offer.getDescription());
			results = preparedStatement.execute();
		}
		catch(SQLException |  ClassNotFoundException e)
		{
				log.log(Level.SEVERE, e.getMessage());
		}
		finally {
			try {
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					preparedStatement.close();
				}
			}
			catch(SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
	}

	private ArrayList<String> getofferIDs() {
		
		ArrayList<String> arrayList = new ArrayList<String>();
		
		String GetOfferSqlQuery = "select e.offerId from offer as e";
		
		try {
			connection = new DBConnection().getConnection();
			preparedStatement = connection.prepareStatement(GetOfferSqlQuery);
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
	
	private ArrayList<offer> actionOnOffer(String offerId){
		
		ArrayList<offer>  offerList = new ArrayList<offer>();
		
		try {
			connection = new DBConnection().getConnection();
			//&& offerId.isEmpty()
			if(offerId != null )
			{
				String query1 ="select * from offer where offerId=?";
				preparedStatement=connection.prepareStatement(query1);
				preparedStatement.setString(1, offerId);
			}
			else {
				String allOfferQuery ="select * from offer";
				preparedStatement = connection.prepareStatement(allOfferQuery);
			}
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
		
			offer offer = new offer();
			offer.setOfferId(resultSet.getString(1));
			offer.setSupId(resultSet.getString(2));
			offer.setStart(resultSet.getString(3));
			offer.setExpire(resultSet.getString(4));
			offer.setCompany(resultSet.getString(5));
			offer.setProduct(resultSet.getString(6));
			offer.setDescription(resultSet.getString(7));
			offerList.add(offer);
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
		return offerList;
	}
	
	@Override
	public ArrayList<offer> getOffers() {
						
		return actionOnOffer(null);
	}

	public offer getOfferByID(String offerId) {
		
		return actionOnOffer(offerId).get(0);
	}


	public offer updateOffer(String offerId, offer offer) {
		//&& offerId.isEmpty()
		if(offerId != null )
		{
			try {
					connection = new DBConnection().getConnection();
							
					String updateQuery = "update offer as e set e.supId=?,e.start=?,e.expire=?,e.company=?, e.product=?,e.description=? where e.offerId =?";
					preparedStatement = connection.prepareStatement(updateQuery);
					preparedStatement.setString(1, offer.getSupId());
					preparedStatement.setString(2, offer.getStart());
					preparedStatement.setString(3, offer.getExpire());
					preparedStatement.setString(4, offer.getCompany());
					preparedStatement.setString(5, offer.getProduct());
					preparedStatement.setString(6, offer.getDescription());
					preparedStatement.setString(7, offer.getOfferId());
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
			return getOfferByID(offerId);
	}
	

	@Override
	public void removeOffer(String offerId) {
	
		if(offerId != null)
		{
			try {
				connection = new DBConnection().getConnection();
				
				String removeQuery ="delete from offer where offer.offerId=?";
				
				preparedStatement = connection.prepareStatement(removeQuery);
				preparedStatement.setString(1, offerId);
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
