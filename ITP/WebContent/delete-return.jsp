<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/store", "root", "root");
Statement st=conn.createStatement();
int j=st.executeUpdate("INSERT INTO returned SELECT * FROM details WHERE id="+id);
int i=st.executeUpdate("DELETE FROM details WHERE id="+id);
out.println("Order Returned Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>