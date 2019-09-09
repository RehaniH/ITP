<%@page import="com.nlhs.service.StocksServiceImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.nlhs.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table border="1" cellpadding="12">
		 <caption><h2>List of Items</h2></caption>
		
		  <tr>
                <th>Item ID</th>
                <th>Product Name</th>
                <th>SID</th>
                <th>Stocks</th>
                <th>Aid</th>
                <th>Last update Date</th>
             
              
            </tr>
            <%
   					StocksServiceImp ssi = new StocksServiceImp();
					ArrayList<Stocks> itemlist=(ArrayList) ssi.getStockDetails() ;
					
			
			for(Stocks stk: itemlist){
			%>
			 <tr>
			 	<td> <%=stk.getPid() %> </td>
				<td> <%=stk.getPname()%> </td>
				<td> <%=stk.getSid() %> </td>
				<td> <%=stk.getStocks() %> </td>
				<td> <%=stk.getAid() %> </td>
				<td> <%=stk.getuDate() %> </td>
			
				
				</tr>			
			<%	
			   }
            %>     
		</table>
		</div>
		

</body>
</html>