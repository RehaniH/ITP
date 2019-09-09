package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;

import com.nlhs.model.Item;
import com.nlhs.util.DBConnection;

public class ItemsServiceImp implements IItemsService {

	private static Connection connection;
	private PreparedStatement preparedStatement;
	private static Statement statement;

	@Override
	public String addItem(Item item) {

		String sql = "Insert into Item values(?,?,?,?,?,?,?,?,?,?,?) ";
		int res = 0;
		if (item != null) {
			System.out.println("inside add item method");
			System.out.println(item.getPid());
		}

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, item.getPid());
			preparedStatement.setString(2, item.getpName());
			preparedStatement.setString(3, item.getpImage());
			preparedStatement.setString(4, item.getCategory());
			preparedStatement.setString(5, item.getSupplierName());
			preparedStatement.setString(6, item.getSupplierContact());
			preparedStatement.setInt(7, item.getUnitSize());
			preparedStatement.setInt(8, item.getCostPrice());
			preparedStatement.setInt(9, item.getSellingPrice());
			preparedStatement.setInt(10, item.getBufferStock());
			preparedStatement.setString(11, item.getpDesc());

			res = preparedStatement.executeUpdate();
			System.out.println("running Insert Item");
			System.out.println("Add item query desc:" + item.getpDesc());

			System.out.println("res:" + res);

		} catch (SQLException e) {
			e.printStackTrace();
			String excep = e.toString();
			return excep;
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (res == 0) {
				return "Item \"Not\" Added because Item ID already exist";

			} else {
				return "Successfully Added Item";
			}

		}

	}

	@Override
	public HashSet<Item> filterItems(String name, String category, int cprice, int sprice, int profit)
			throws SQLException {
//		String sql = "select * from Item where p_name=" + "'" + name + "'" + " or p_category =" + "'" + category + "'"
//				+ "or p_costPrice <=" + cprice + " or p_sellingPrice <=" + sprice
//				+ " or p_sellingPrice - p_costPrice >=" + profit;
		String sql1 = new String();
		String sql2 = new String();
		String sql3 = new String();
		String sql4 = new String();
		String sql5 = new String();
		HashSet<Item> ItemList = new HashSet<Item>();
		try {

			connection = DBConnection.getConnection();

			statement = connection.createStatement();
			if (!(name.equals("NS"))) {
				sql1 = "select * from item where p_name=" + "'" + name + "'";
				ResultSet rs1 = statement.executeQuery(sql1);
				System.out.println("running Filter Item");
				while (rs1.next()) {
					Item item = new Item();

					item.setPid(rs1.getString("p_id"));
					item.setpName(rs1.getString("p_name"));
					item.setCategory(rs1.getString("p_category"));
					item.setSellingPrice(rs1.getInt("p_sellingPrice"));
					item.setCostPrice(rs1.getInt("p_costPrice"));
					item.setUnitSize(Integer.parseInt(rs1.getString("p_unitSize")));
					item.setSupplierName(rs1.getString("p_supplierName"));
					item.setSupplierContact(rs1.getString("p_supplierContact"));
					item.setBufferStock(rs1.getInt("p_bufferStock"));
					item.setpImage(rs1.getString("p_image"));
					item.setpDesc(rs1.getString("p_description"));
					ItemList.add(item);

				}
			}
			if (cprice != -99) {
				sql2 = "select * from item where p_costPrice >=" + cprice;

				ResultSet rs2 = statement.executeQuery(sql2);
				System.out.println("running Filter Item");
				while (rs2.next()) {
					Item item = new Item();

					item.setPid(rs2.getString("p_id"));
					item.setpName(rs2.getString("p_name"));
					item.setCategory(rs2.getString("p_category"));
					item.setSellingPrice(rs2.getInt("p_sellingPrice"));
					item.setCostPrice(rs2.getInt("p_costPrice"));
					item.setUnitSize(Integer.parseInt(rs2.getString("p_unitSize")));
					item.setSupplierName(rs2.getString("p_supplierName"));
					item.setSupplierContact(rs2.getString("p_supplierContact"));
					item.setBufferStock(rs2.getInt("p_bufferStock"));
					item.setpImage(rs2.getString("p_image"));
					item.setpDesc(rs2.getString("p_description"));
					ItemList.add(item);

				}
			}
			if (sprice != -99) {
				sql3 = "select * from item where p_sellingPrice >=" + sprice;

				ResultSet rs3 = statement.executeQuery(sql3);
				System.out.println("running Filter Item");
				while (rs3.next()) {
					Item item = new Item();

					item.setPid(rs3.getString("p_id"));
					item.setpName(rs3.getString("p_name"));
					item.setCategory(rs3.getString("p_category"));
					item.setSellingPrice(rs3.getInt("p_sellingPrice"));
					item.setCostPrice(rs3.getInt("p_costPrice"));
					item.setUnitSize(Integer.parseInt(rs3.getString("p_unitSize")));
					item.setSupplierName(rs3.getString("p_supplierName"));
					item.setSupplierContact(rs3.getString("p_supplierContact"));
					item.setBufferStock(rs3.getInt("p_bufferStock"));
					item.setpImage(rs3.getString("p_image"));
					item.setpDesc(rs3.getString("p_description"));
					ItemList.add(item);

				}
			}
			if (!(category.equals("NC"))) {
				sql4 = "select * from item where p_category=" + "'" + category + "'";

				ResultSet rs4 = statement.executeQuery(sql4);
				System.out.println("running Filter Item");

				while (rs4.next()) {
					Item item = new Item();

					item.setPid(rs4.getString("p_id"));
					item.setpName(rs4.getString("p_name"));
					item.setCategory(rs4.getString("p_category"));
					item.setSellingPrice(rs4.getInt("p_sellingPrice"));
					item.setCostPrice(rs4.getInt("p_costPrice"));
					item.setUnitSize(Integer.parseInt(rs4.getString("p_unitSize")));
					item.setSupplierName(rs4.getString("p_supplierName"));
					item.setSupplierContact(rs4.getString("p_supplierContact"));
					item.setBufferStock(rs4.getInt("p_bufferStock"));
					item.setpImage(rs4.getString("p_image"));
					item.setpDesc(rs4.getString("p_description"));
					ItemList.add(item);

				}
			}
			if (profit != 1) {
				sql5 = "select * from item where p_sellingPrice - p_costPrice >=" + profit;

				ResultSet rs5 = statement.executeQuery(sql5);
				System.out.println("running Filter Item");
				while (rs5.next()) {
					Item item = new Item();

					item.setPid(rs5.getString("p_id"));
					item.setpName(rs5.getString("p_name"));
					item.setCategory(rs5.getString("p_category"));
					item.setSellingPrice(rs5.getInt("p_sellingPrice"));
					item.setCostPrice(rs5.getInt("p_costPrice"));
					item.setUnitSize(Integer.parseInt(rs5.getString("p_unitSize")));
					item.setSupplierName(rs5.getString("p_supplierName"));
					item.setSupplierContact(rs5.getString("p_supplierContact"));
					item.setBufferStock(rs5.getInt("p_bufferStock"));
					item.setpImage(rs5.getString("p_image"));
					item.setpDesc(rs5.getString("p_description"));
					ItemList.add(item);

				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			statement.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ItemList;
	}

	@Override
	public String editItem(Item item) {
		String sql = "UPDATE Item set  p_name = ? , p_image = ? , p_category =? , p_supplierName = ? , p_supplierContact = ? ,  p_unitSize = ? , p_costPrice = ? , p_sellingPrice = ? , p_bufferStock = ? , p_description = ?  where p_id = ? ";
		int res = -1;

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, item.getpName());
			preparedStatement.setString(2, item.getpImage());
			preparedStatement.setString(3, item.getCategory());
			preparedStatement.setString(4, item.getSupplierName());
			preparedStatement.setString(5, item.getSupplierContact());
			preparedStatement.setInt(6, item.getUnitSize());
			preparedStatement.setInt(7, item.getCostPrice());
			preparedStatement.setInt(8, item.getSellingPrice());
			preparedStatement.setInt(9, item.getBufferStock());
			preparedStatement.setString(10, item.getpDesc());
			preparedStatement.setString(11, item.getPid());

			res = preparedStatement.executeUpdate();
			System.out.println("running Edit Item");
		} catch (SQLException e) {
			e.printStackTrace();
			String excep = e.toString();
			return excep;
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (res == 0) {
				return "Item \"Not\" Edited";
			} else {
				System.out.println("Hello successfull");
				return "Successfully Edited Item";
			}

		}

	}

	@Override
	public String deleteItem(String id) {
		String sql = " DELETE FROM Item where p_id = ?";
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			System.out.println("deleteItem method:" + id);
			preparedStatement.setString(1, id);
			int res = preparedStatement.executeUpdate();
			System.out.println("running Delte item");
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (res == 0) {
				return "Delete Fail";
			} else {
				return "product " + id + "Delete successfull";
			}
		} catch (SQLException e) {
			String excep = e.toString();
			return excep;
		} catch (ClassNotFoundException e) {
			String excep = e.toString();
			return excep;
		}

	}

	@Override
	public String HomePageItems(String p1, String p2, String p3, String p4, String p5, String p6) {
		String sql = "Select * from Item Where p_id IN (?,?,? ,? ,? , ?) ";
		ArrayList<Item> ItemList = new ArrayList<Item>();
		int res = 0;

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, p1);
			preparedStatement.setString(2, p2);
			preparedStatement.setString(3, p3);
			preparedStatement.setString(4, p4);
			preparedStatement.setString(5, p5);
			preparedStatement.setString(6, p6);
			ResultSet rs = preparedStatement.executeQuery();

			String sqld = "Delete From HomePageItem";
			statement = connection.createStatement();
			statement.executeUpdate(sqld);

			String sql2 = "Insert into HomePageItem values(?,?,?,?,?,?,?,?,?,?,?) ";
			while (rs.next()) {
				Item item = new Item();

				item.setPid(rs.getString("p_id"));
				item.setpName(rs.getString("p_name"));
				item.setCategory(rs.getString("p_category"));
				item.setSellingPrice(rs.getInt("p_sellingPrice"));
				item.setCostPrice(rs.getInt("p_costPrice"));
				item.setUnitSize(Integer.parseInt(rs.getString("p_unitSize")));
				item.setSupplierName(rs.getString("p_supplierName"));
				item.setSupplierContact(rs.getString("p_supplierContact"));
				item.setBufferStock(rs.getInt("p_bufferStock"));
				item.setpImage(rs.getString("p_image"));
				item.setpDesc(rs.getString("p_description"));

				preparedStatement = connection.prepareStatement(sql2);

				preparedStatement.setString(1, item.getPid());
				preparedStatement.setString(2, item.getpName());
				preparedStatement.setString(3, item.getpImage());
				preparedStatement.setString(4, item.getCategory());
				preparedStatement.setString(5, item.getSupplierName());
				preparedStatement.setString(6, item.getSupplierContact());
				preparedStatement.setInt(7, item.getUnitSize());
				preparedStatement.setInt(8, item.getCostPrice());
				preparedStatement.setInt(9, item.getSellingPrice());
				preparedStatement.setInt(10, item.getBufferStock());
				preparedStatement.setString(11, item.getpDesc());

				res = preparedStatement.executeUpdate();
				System.out.println("running Insert HomePageItems");
				// ItemList.add(item);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			String excep = e.toString();
			return excep;
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (res == 0) {
				return "not Successful";
			} else {
				return "Successfully changed home page";
			}
		}

	}

	@Override
	public ArrayList<Item> getHomePageItems() {
		String sql = "Select * from HomePageItem ";
		ArrayList<Item> ItemList = new ArrayList<Item>();

		try {

			connection = DBConnection.getConnection();

			statement = connection.createStatement();

			ResultSet rs = statement.executeQuery(sql);
			System.out.println("running get Home page items()");

			while (rs.next()) {
				Item item = new Item();

				item.setPid(rs.getString("p_id"));
				item.setpName(rs.getString("p_name"));
				item.setCategory(rs.getString("p_category"));
				item.setSellingPrice(rs.getInt("p_sellingPrice"));
				item.setCostPrice(rs.getInt("p_costPrice"));
				item.setUnitSize(Integer.parseInt(rs.getString("p_unitSize")));
				item.setSupplierName(rs.getString("p_supplierName"));
				item.setSupplierContact(rs.getString("p_supplierContact"));
				item.setBufferStock(rs.getInt("p_bufferStock"));
				item.setpImage(rs.getString("p_image"));
				item.setpDesc(rs.getString("p_description"));

				ItemList.add(item);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			statement.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ItemList;
	}

}
