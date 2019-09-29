<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.util.DBConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.design.JRDesignQuery"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<!DOCTYPE html>
<html>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
       Connection connection;
       connection = new DBConnection().getConnection();

       String report="C:/Users/DELL/JaspersoftWorkspace/MyReports/Suppliers.jrxml";
       JasperReport jasperreport = JasperCompileManager
				.compileReport(report);
		
		JasperPrint jp = JasperFillManager.fillReport(jasperreport,
				null, connection);
		
		JasperExportManager.exportReportToPdfStream(jp, response.getOutputStream());
		response.getOutputStream().flush();
		response.getOutputStream().close();
}catch(Exception e){
	System.out.println(e);
}

%>
</body>
</html>