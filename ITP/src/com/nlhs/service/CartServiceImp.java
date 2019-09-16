package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nlhs.model.Cart;
import com.nlhs.util.DBConnection;

public class CartServiceImp {
	private static Connection connection;
	private PreparedStatement preparedStatement;

	public String addToCart(Cart cart) {

		String sql = "Insert into cart values(?,?,?,?,?,?,?) ";
		int res = 0;

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, cart.getCusEmail());
			preparedStatement.setString(2, cart.getItemId());
			preparedStatement.setString(3, cart.getpName());
			preparedStatement.setInt(4, cart.getQuantity());
			preparedStatement.setFloat(5, cart.getUnitPrice());
			preparedStatement.setFloat(6, cart.getpValue());

			preparedStatement.setString(7, cart.getpImage());

			res = preparedStatement.executeUpdate();
			System.out.println("running Insert to cart");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (res == 0) {
				return "Item \"Not\" Added to cart";

			} else {
				return "Successfully Added Item to cart";
			}

		}

	}

	public ArrayList<Cart> getCart(String userEmail) {
		String sql = "select * from cart where cusEmail =?";
		ArrayList<Cart> cartList = new ArrayList<Cart>();

		try {

			connection = DBConnection.getConnection();

			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userEmail);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCusEmail(rs.getString(1));
				cart.setItemId(rs.getString(2));
				cart.setpName(rs.getString(3));
				cart.setQuantity(rs.getInt(4));
				cart.setUnitPrice(rs.getFloat(5));
				cart.setpValue(rs.getFloat(6));
				cart.setpImage(rs.getString(7));

				cartList.add(cart);

			}
			System.out.println("running get cart");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;

	}

	public String DeleteCartItem(String pid) {
		String sql = "Delete From cart where itemId=?";

		int result = 0;
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, pid);
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result == 0) {
			return "Remove Fail";
		} else {
			return "product remove successfull";
		}

	}

}
