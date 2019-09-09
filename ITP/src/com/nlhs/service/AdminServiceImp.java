package com.nlhs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.nlhs.model.Admin;
import com.nlhs.util.DBConnection;

public class AdminServiceImp implements IAdminService {

	private static Connection connection;
	private PreparedStatement preparedStatement;
	private static Statement statement;

	@Override
	public String addAdmin(Admin admin) {

		String sql = "Insert into Admin values(?,?,?,?,?,?,?,?) ";
		int res = 0;

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, admin.getAid());
			preparedStatement.setString(2, admin.getFname());
			preparedStatement.setString(3, admin.getLname());
			preparedStatement.setString(4, admin.getProfilePic());

			preparedStatement.setInt(5, admin.getAge());
			preparedStatement.setString(6, admin.getContactNumber());
			preparedStatement.setString(7, admin.getEmail());
			preparedStatement.setString(8, admin.getPassword());

			res = preparedStatement.executeUpdate();
			System.out.println("running Insert admin");

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
				return "Admin \"Not\" Added because admin aid exists";

			} else {
				return "Successfully Added Admin";
			}

		}

	}

	@Override
	public Admin getAdmin(String id) {
		String sql = "select * from Admin where a_id = ?";
		ResultSet rs;
		Admin admin = new Admin();

		try {

			connection = DBConnection.getConnection();

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, id);

			rs = preparedStatement.executeQuery();
			System.out.println("running get admin");
			while (rs.next()) {
				admin.setAid(rs.getString(1));
				admin.setFname(rs.getString(2));
				admin.setLname(rs.getString(3));
				admin.setProfilePic(rs.getString(4));
				admin.setAge(rs.getInt(5));
				admin.setContactNumber(rs.getString(6));
				admin.setEmail(rs.getString(7));
				admin.setPassword(rs.getString(8));

			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return admin;
	}

	@Override
	public String updateAdminProfile(Admin admin) {
		String sql = "UPDATE Admin set  f_name = ? , l_name = ? , profile_pic =? , age = ? , contactNumber = ? ,  email = ? , password = ? where a_id = ? ";
		int res = -1;

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, admin.getFname());
			preparedStatement.setString(2, admin.getLname());
			preparedStatement.setString(3, admin.getProfilePic());

			preparedStatement.setInt(4, admin.getAge());
			preparedStatement.setString(5, admin.getContactNumber());
			preparedStatement.setString(6, admin.getEmail());
			preparedStatement.setString(7, admin.getPassword());
			preparedStatement.setString(8, admin.getAid());

			res = preparedStatement.executeUpdate();
			System.out.println("running update admin");

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
				return "Admin \"Not\" Updated";

			} else {
				return "Successfully Updated Admin";
			}

		}

	}

}
