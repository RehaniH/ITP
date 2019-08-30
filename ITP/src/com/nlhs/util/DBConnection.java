package com.nlhs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	static Connection connection;

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	public static final String DB_URL = "jdbc:mysql://localhost:3306/store";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "root";

	public static Connection getConnection() throws SQLException, ClassNotFoundException {

		if(connection == null || connection.isClosed()) {

			Class.forName("com.mysql.jdbc.Driver");

			connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);

		}

		return connection;

	}
}
