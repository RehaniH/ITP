package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.nlhs.model.Supplier;
import com.nlhs.util.DBConnection;

public class SupplierServiceImpl implements ISupplierServices{
	
	public static final Logger log = Logger.getLogger(SupplierServiceImpl.class.getName());
	private static Connection connection;
	private static Statement statement;
	private PreparedStatement st;
	static ResultSet rs= null;
	boolean results;
	
	private PreparedStatement preparedStatement;

	
		public void addSupplier(Supplier supplier) {

			String SupplierID = GenerateSupplierID.generateSupplierIDs(getSupplierIDs());
			supplier.setSupplierID(SupplierID);
			
			String sqlInsertQuery = "insert into supplier(supplierID,firstName,lastName,companyName,productCategory,contactNumber,emailAddress,address,password) values(?,?,?,?,?,?,?,?,?)";

			try {
				try {
					connection = DBConnection.getConnection();
				} catch (ClassNotFoundException e) {
					
					e.printStackTrace();
				}

				preparedStatement = connection.prepareStatement(sqlInsertQuery);

				preparedStatement.setString(1, supplier.getSupplierID());
				preparedStatement.setString(2, supplier.getFirstName());
				preparedStatement.setString(3, supplier.getLastName());
				preparedStatement.setString(4, supplier.getCompanyName());
				preparedStatement.setString(5, supplier.getProductCategory());
				preparedStatement.setString(6, supplier.getContactNumber());
				preparedStatement.setString(7, supplier.getEmailAddress());
				preparedStatement.setString(8, supplier.getAddress());
				preparedStatement.setString(9, supplier.getPassword());
				results = preparedStatement.execute();

				

			} catch (SQLException e) {
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

	private ArrayList<String> getSupplierIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();

		String GetSupplierSqlQuery = "select s.supplierID from supplier as s";

		try {
			try {
				connection = DBConnection.getConnection();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			preparedStatement = connection.prepareStatement(GetSupplierSqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(1));
			}
		} catch (SQLException e) {
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
		return arrayList;
	}


		
	private ArrayList<Supplier> actionOnSupplier(String supplierID) {

		ArrayList<Supplier> supplierList = new ArrayList<Supplier>();
		try {
			connection = new DBConnection().getConnection();
		
			if (supplierID != null && !supplierID.isEmpty()) {
				
				String query1 = "select * from supplier where supplier.supplierID = ?";
				preparedStatement = connection.prepareStatement(query1);
				preparedStatement.setString(1, supplierID);
			}
			
			else {
				String allSuppQuery = "select * from supplier";
				preparedStatement = connection.prepareStatement(allSuppQuery);
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Supplier supplier = new Supplier();
				supplier.setSupplierID(resultSet.getString(1));
				supplier.setFirstName(resultSet.getString(2));
				supplier.setLastName(resultSet.getString(3));
				supplier.setCompanyName(resultSet.getString(4));
				supplier.setProductCategory(resultSet.getString(5));
				supplier.setContactNumber(resultSet.getString(6));
				supplier.setEmailAddress(resultSet.getString(7));
				supplier.setAddress(resultSet.getString(8));
				supplier.setPassword(resultSet.getString(9));
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
	public Supplier getSupplierbyID(String supplierID) {
		return actionOnSupplier(supplierID).get(0);
	}
	@Override
	public ArrayList<Supplier> getSuppliers() {
		return actionOnSupplier(null);
	}
	@Override
	public Supplier updateSupplier(String supplierID, Supplier supplier) {
		
		if (supplierID != null && !supplierID.isEmpty()) {
			
			try {
				connection = new DBConnection().getConnection();
				
				String updateQuery = "update supplier as s set s.firstName = ?, s.lastName = ?, s.companyName = ?, s.productCategory = ?, s.contactNumber = ?, s.emailAddress = ?, s.address = ?,s.password = ?  where s.supplierID = ?";
				
				preparedStatement = connection.prepareStatement(updateQuery);
				preparedStatement.setString(1, supplier.getFirstName());
				preparedStatement.setString(2, supplier.getLastName());
				preparedStatement.setString(3, supplier.getCompanyName());
				preparedStatement.setString(4, supplier.getProductCategory());
				preparedStatement.setString(5, supplier.getContactNumber());
				preparedStatement.setString(6, supplier.getEmailAddress());
				preparedStatement.setString(7, supplier.getAddress());
				preparedStatement.setString(8, supplier.getPassword());
				preparedStatement.setString(9, supplier.getSupplierID());
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
		
		return getSupplierbyID(supplierID);
	}
	
	@Override
	public void removeSupplier(String supplierID) {
	
		if (supplierID != null && !supplierID.isEmpty()) {
			
			System.out.print(supplierID);
			
					try {
						connection = new DBConnection().getConnection();
						
						String removeQuery = " delete from supplier where supplierID = ?";
						
						preparedStatement = connection.prepareStatement(removeQuery);
						preparedStatement.setString(1, supplierID);
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
		}
	
	public void removeSupplierProfile(String emailAddress) {
		
		
		if (emailAddress != null && !emailAddress.isEmpty()) {

			System.out.print("Supplier "+emailAddress);
		
					try {
						connection = new DBConnection().getConnection();
						
						String removeQuery = " delete from supplier where emailAddress = ?";
						
						preparedStatement = connection.prepareStatement(removeQuery);
						preparedStatement.setString(1, emailAddress);
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
		
		
	}
	
	public void login(String email, String password) {
		           
		          try {
						connection = new DBConnection().getConnection();
						
						String loginQuery = "select email,password from supplier where email=? and password=?";
						
						preparedStatement = connection.prepareStatement(loginQuery);
						preparedStatement.setString(1, email);
						preparedStatement.setString(2, password);
						
						
						ResultSet rs = preparedStatement.executeQuery();
						
				     
					} catch (SQLException | ClassNotFoundException e) {
						e.printStackTrace();
				
				   }
		  
	}
	//Supplier Login
	public static Supplier login(Supplier supplier){
		
		 statement = null;
		 String emailAddress = supplier.getEmailAddress();
		 String password = supplier.getPassword();
		 
		 String searchQuery = "select * from supplier where emailAddress='"+ emailAddress + "' AND password='"+ password+ "'";
		 
		  System.out.println("Your email is " + emailAddress);          
	      System.out.println("Your password is " + password);
	      System.out.println("Query: "+searchQuery);
		try { 
	      connection = new DBConnection().getConnection();
	      statement = connection.createStatement();
	      rs = statement.executeQuery(searchQuery);
	      boolean more = rs.next();
	      if (!more) 
	         {
	            System.out.println("Sorry, you are not a registered user! Please sign up first");
	            supplier.setValid(false);
	         } 
	   
	         else if (more) 
	         {
	            String firstName = rs.getString("firstName");
	            String lastName = rs.getString("lastName");
		     	String companyName = rs.getString("companyName");
		     	String productCategory = rs.getString("productCategory");
		     	String contactNumber= rs.getString("contactNumber");
		     	String address= rs.getString("address");
		     	
		     	
	            System.out.println("Welcome " + firstName);
	            supplier.setFirstName(firstName);
	            supplier.setLastName(lastName);
	            supplier.setCompanyName(companyName);
	            supplier.setProductCategory(productCategory);
	            supplier.setContactNumber(contactNumber);
	            supplier.setAddress(address);
	            supplier.setValid(true);
	            
	         }
	} 
	catch (Exception ex) 
    {
       System.out.println("Log In failed: An Exception has occurred! " + ex);
    } 
	
	 return supplier;
	}
	
	
	public  Supplier getInformation(Supplier supplier)  {
		 statement = null;
		 String emailAddress = supplier.getEmailAddress();

		 String detailQuery = "select * from supplier where emailAddress='"+ emailAddress +  "'";
		
		 System.out.println("Your email is " + emailAddress);   
		 
	    
	    try {
	    	
	    	connection = new DBConnection().getConnection();
	    	st = connection.prepareStatement(detailQuery);	
		    rs = st.executeQuery();
		    //st.setString(1,emailAddress);
		    System.out.println(detailQuery); 
		    boolean more = rs.next();
		    
		    if(more) {
		    String supplierID =rs.getString("supplierID");
	        String firstName = rs.getString("firstName");
	        String lastName = rs.getString("lastName");
	     	String companyName = rs.getString("companyName");
	     	String productCategory = rs.getString("productCategory");
	     	String contactNumber= rs.getString("contactNumber");
	     	String address= rs.getString("address");
	     	String password = rs.getString("password");
	     	
	        System.out.println("Editing " + firstName + " Profile");
	        supplier.setSupplierID(supplierID);
	        supplier.setFirstName(firstName);
	        supplier.setLastName(lastName);
	        supplier.setCompanyName(companyName);
	        supplier.setProductCategory(productCategory);
	        supplier.setContactNumber(contactNumber);
	        supplier.setAddress(address);
	        supplier.setPassword(password);
		    }
	      
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	   
		return supplier;
	}
	
	public Supplier updateSupplierProfile(String supplierID, Supplier supplier) {
		

		if (supplierID != null && !supplierID.isEmpty()) {
			
			try {
				connection = new DBConnection().getConnection();
				
				String updateQuery = "update supplier as s set s.firstName = ?, s.lastName = ?, s.companyName = ?, s.productCategory = ?, s.contactNumber = ?, s.emailAddress = ?, s.address = ?,s.password = ?  where s.supplierID = ?";
				
				preparedStatement = connection.prepareStatement(updateQuery);
				preparedStatement.setString(1, supplier.getFirstName());
				preparedStatement.setString(2, supplier.getLastName());
				preparedStatement.setString(3, supplier.getCompanyName());
				preparedStatement.setString(4, supplier.getProductCategory());
				preparedStatement.setString(5, supplier.getContactNumber());
				preparedStatement.setString(6, supplier.getEmailAddress());
				preparedStatement.setString(7, supplier.getAddress());
				preparedStatement.setString(8, supplier.getPassword());
				preparedStatement.setString(9, supplier.getSupplierID());
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
		
        try {
			connection.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
        
		return getSupplierbyID(supplierID);
	
	}

}