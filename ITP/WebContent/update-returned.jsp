<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/store", "root", "root");
Statement st=conn.createStatement();
int j=st.executeUpdate("INSERT INTO returned SELECT * FROM deliverd WHERE id="+id);
int i=st.executeUpdate("DELETE FROM deliverd WHERE id="+id);
out.println("Data Updated As Returned!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>