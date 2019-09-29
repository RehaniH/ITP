<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String p_name=request.getParameter("p_name");
String p_ID=request.getParameter("p_ID");
String p_r=request.getParameter("p_r");
String stocks=request.getParameter("stocks");
String p_d=request.getParameter("p_d");
String s_id=request.getParameter("s_id");
String s_name=request.getParameter("s_name");
try
{
System.out.println("Sucess");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/store", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into supplier_return(p_name,p_ID,p_r,stocks,p_d,s_id,s_name)values('"+p_name+"','"+p_ID+"','"+p_r+"','"+stocks+"','"+p_d+"','"+s_id+"','"+s_name+"')");
System.out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>