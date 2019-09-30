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
    conn= DBConnection.getConnection();
    String query = "SELECT * FROM returned INNER JOIN returned_reason ON returned.order_id=returned_reason.order_id ";          //Fetching data from table
       ps=conn.prepareStatement(query);                // executing query
       rs=ps.executeQuery();
      
    document.open();

    /* new paragraph instance initialized and add function write in pdf file*/
    document.add(new Paragraph("---------------------------------- Returned Details History Report With Reason-----------------------------------\n\n"));
   
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------\n\n"));
    document.addCreationDate();
   
    while(rs.next())
    {
          // fetch & writing records in pdf files
        document.add(new Paragraph("NAME ::"+rs.getString(2)+"\nADDRESS ::"+rs.getString(3)+"\nTELEPHONE NUMBER ::"+rs.getString(4)+"\nORDER ID ::"+rs.getString(5)+"\nREASON  ::"+rs.getString(7)+"\n\n"));
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