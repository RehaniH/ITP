<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.html.HtmlWriter"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.*"%>;
<%@page import="java.awt.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="com.nlhs.util.DBConnection"%>
<%@page import="java.awt.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="MCSS/css/bootstrap.min.css" >
<link href="MCSS/css/sb-admin-2.min.css" rel="stylesheet">
<link href="MCSS/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="MCSS/url.css" rel="stylesheet" type="text/css">
</head>
<body><!-- IT18176070: Perera P.R.H -->
<%
String str="pdf";

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
try
{
    Document document=new Document();
    if(str.equals("pdf"))
    {
        response.setContentType("application/pdf");
        PdfWriter.getInstance(document,response.getOutputStream());
    }
    conn= DBConnection.getConnection();
    String query = "SELECT * from customer_address";          //Fetching data from table
       ps=conn.prepareStatement(query);                // executing query
       rs=ps.executeQuery();
      
    document.open();

    /* new paragraph instance initialized and add function write in pdf file*/
    document.add(new Paragraph("-------------------------------------------Report On All registered Accounts------------------------------\n\n"));
   
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    document.addCreationDate();
   
    document.add(new Paragraph("Customer Id\t\t" + "First Name\t\t" + "Last Name\t\t"+"District\n\n"));
    while(rs.next())
    {
          // fetch & writing records in pdf files
        document.add(new Paragraph(rs.getString(1)+"\t\t"+rs.getString(5) +"\t\t"+rs.getString(6)+"\t\t" +rs.getString(10)+"\n\n"));
    }
    document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));

    document.close(); //document instance closed
    conn.close();  //db connection close
}
catch(Exception de)
{
        de.printStackTrace();
            System.err.println("document: " + de.getMessage());
           
}
%>
</body>
</html>