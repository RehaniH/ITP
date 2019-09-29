<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String order_id=request.getParameter("order_id");
String reason=request.getParameter("reason");

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/store", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into returned_reason(order_id,reason)values('"+order_id+"','"+reason+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>