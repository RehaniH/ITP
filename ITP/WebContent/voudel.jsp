<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

try
{
	String id=request.getParameter("id");
	out.println(id);
	
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/store", "root", "root");
Statement st=conn.createStatement();
int j=st.executeUpdate("INSERT INTO vousave SELECT * FROM returned WHERE id="+id);

out.println("Data transfer Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>