<%@page import="java.util.Date"%>
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
    
    Date d = new Date();
	String[] date = d.toString().split(" ");
	System.out.println(date);
   
    conn= DBConnection.getConnection();
    String query = "select * from stocks where last_update =?";          //Fetching data from table
       ps=conn.prepareStatement(query); 
    String realDate = date[0]+" "+date[1]+" "+date[2]+" "+date[5];
    	ps.setString(1,realDate)    ;                // executing query
       rs=ps.executeQuery();
      
    document.open();

    //document.setHeader("New Lanka Hardware Stores Kalutara");
    document.addTitle(" Stocks added for the day :"+ realDate);
    /* new paragraph instance initialized and add function write in pdf file*/
    document.add(new Paragraph("-------------------------------------------NEW LANKA HARDWARE STORES---------------------------------------------------\n\n"));
    document.add(new Paragraph("-------------------------------------------Stocks Updated Today "+ realDate+"---------------------------------------------------\n\n"));
   
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    
    document.addCreationDate();
    int count = 1;
   
    while(rs.next())
    {
          // fetch & writing records in pdf files
          document.add(new Paragraph("-------------------------------------------------------"+count+"---------------------------------------------------\n\n"));
        document.add(new Paragraph("Product ID ::"+rs.getString(1)+"\nProduct Name::"+rs.getString(2)+"\n Supplier ID ::"+rs.getString(3)+"\nAdmin ID ::"+rs.getString(4)));
        document.add(new Paragraph("-------------------------------------------------------\n---------------------------------------------------\n\n"));
        count++;
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