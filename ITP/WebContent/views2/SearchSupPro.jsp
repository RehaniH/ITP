<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
   private Connection con;
   private Statement st;
   private ResultSet rs;
   private String url,user,pass;

%>
  
<%
     url="jdbc:mysql://localhost:3306/store?useTimeZone=true&serverTimezone=UTC";
// databse name
       user="root";//username
       pass="";//pass
     
 try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           
 con=DriverManager.getConnection(url,user,pass);
         
    st=con.createStatement();
     
        }
 catch (Exception ex) {
          out.println("Error "+ ex);
        } 


%>
<!DOCTYPE html>
<html>
   
 <head>
   
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
     <title>New Lanka Hardware stores</title>
 </head>
   
 <body>
      
  
        <table>
          

    <tr>
    			<th>Supplied Product ID</th>
                <th>Supplier ID</th>
                <th>Supplier Name</th>
                <th>Contact Number</th>
                <th>Company</th>
                <th>Product Type</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Total Price</th>
    
  </tr>      
       
     
        


<%
    try {
            if (request.getParameter("submit").equals("submit")) {
  
              String skey = request.getParameter("id").toString().trim()  ;
     
     String query;
                if (!skey.equals("")) {
                          query="select * from sup_pro where supProId like '%"+skey+"%' ";  
                    }else{
                    query="";
                }
                          
          
             
             
          rs= st.executeQuery(query);

                     
          int j ;
         while (rs.next()) {
           out.print("<tr><td>"+rs.getString(1)+"</td>");
           out.print("<td>"+rs.getString(2)+"</td>");   
           out.print("<td>"+rs.getString(3)+"</td>");
           out.print("<td>"+rs.getString(4)+"</td>");
           out.print("<td>"+rs.getString(5)+"</td>");
           out.print("<td>"+rs.getString(6)+"</td>");
           out.print("<td>"+rs.getString(7)+"</td>");         
           out.print("<td>"+rs.getString(8)+"</td></tr>");
         }
            
    
                
            }    
   
        } catch (Exception e) {
                 out.print(""+e);
        }




%>
</table>
    </body>
</html>