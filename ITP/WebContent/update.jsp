
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

try
{
	String id1=request.getParameter("stocks");
	out.println(id1);
	int id11 = Integer.parseInt(id1);			
	System.out.println(id11);
	
	
	String id2=request.getParameter("p_ID");
	out.println(id2);
	
	
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/store", "root", "root");

String query = "select stocks from stocks where p_ID=p_ID ";

int id33 = Integer.parseInt(query);			
System.out.println(id33);

 int id44 = id33-id11;

Statement st=conn.createStatement();
int i=st.executeUpdate("UPDATE 'stocks' SET 'stocks' = id44  WHERE p_ID"+id2);

out.println("Data updated succ!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>