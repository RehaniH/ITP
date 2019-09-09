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

		String sql = " Insert into stocks values(?,?,?,?,?,?)";
		int res = 0;
		String ex = " ";
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, stock.getPid());
			preparedStatement.setString(2, stock.getPname());
			preparedStatement.setString(3, stock.getSid());
			preparedStatement.setInt(4, stock.getStocks());
			preparedStatement.setString(5, stock.getAid());
			preparedStatement.setString(6, stock.getuDate());

			res = preparedStatement.executeUpdate();
			System.out.println("running Stock update");
		} catch (SQLException e) {

			// ex = e.toString();
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
				return "Stock \"Not\" Updated Because No such supplier or Product id";

			} else {
				return "Successfully Updated Stock";
			}

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
