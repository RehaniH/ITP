package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.nlhs.model.Stocks;
import com.nlhs.util.DBConnection;

public class StocksServiceImp implements IStocksServiceImp {

	private static Connection connection;
	private PreparedStatement preparedStatement;
	private Statement statement;

	@Override
	public String updateStocks(Stocks stock) {

		int ret = 0;
		ResultSet rs;

		try {
			connection = DBConnection.getConnection();

			String sql = "Insert into stocks values(?,?,?,?,?,?)";

			String sql2 = "Select * from stocks where p_id = ?";

			preparedStatement = connection.prepareStatement(sql2);

			preparedStatement.setString(1, stock.getPid());

			rs = preparedStatement.executeQuery();

			if (rs.next()) {

				String sql3 = "Update stocks set stocks = ? , Admin_ID = ? where p_id = ?";
				preparedStatement = connection.prepareStatement(sql3);
				preparedStatement.setInt(1, rs.getInt(4) + stock.getStocks());
				preparedStatement.setString(2, rs.getInt(5) + stock.getAid());
				preparedStatement.setString(3, stock.getPid());

				ret = preparedStatement.executeUpdate();

				if (ret != 0) {
					return "Increased Stocks";
				} else {
					return "Failed increasing stocks";
				}
			}

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, stock.getPid());
			preparedStatement.setString(2, stock.getPname());
			preparedStatement.setString(3, stock.getSid());
			preparedStatement.setInt(4, stock.getStocks());
			preparedStatement.setString(5, stock.getAid());
			preparedStatement.setString(6, stock.getuDate());

			ret = preparedStatement.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (ret > 0) {
			return "Success";
		} else {
			return "Not Updated";
		}

	}

	@Override
	public ArrayList<Stocks> getStockDetails() {
		ArrayList<Stocks> list = new ArrayList<Stocks>();

		String sql1 = "select * from stocks";
		try {

			connection = DBConnection.getConnection();

			statement = connection.createStatement();

			ResultSet rs = statement.executeQuery(sql1);

			while (rs.next()) {
				Stocks stk = new Stocks();

				stk.setPid(rs.getString(1));
				stk.setPname(rs.getString(2));
				stk.setSid(rs.getString(3));
				stk.setStocks(rs.getInt(4));
				stk.setAid(rs.getString(5));
				stk.setuDate(rs.getString(6));

				list.add(stk);

			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
