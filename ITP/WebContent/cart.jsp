<%@page import="com.nlhs.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nlhs.service.CartServiceImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%if(session.getAttribute("UserName") == null){
	  request.getRequestDispatcher("index.jsp").include(request, response);  
  } %>
  <% String userEmail = (String)session.getAttribute("UserName");
  		float sum = 0;
  %>
  
  
  <table border="1" cellpadding="12">
		 <caption><h2>List of Items</h2></caption>
		
		  <tr>
                <th>Item ID</th>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Each Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Remove From Cart</th>
             
              
            </tr>
  
  <% 	
		ArrayList<Cart> ilist = new ArrayList<Cart>() ;
    	//ilist = (ArrayList)session.getAttribute("ilist"); 
    		//Cart[] cart = new Item[6];
    		//int i=0;
    		
    			
    			CartServiceImp csi = new CartServiceImp();
        		ilist = csi.getCart(userEmail);
    		
    		%><%
					for(Cart c : ilist){
						sum+=c.getpValue();
        			%>
        		<tr>
			 	<td> <%=c.getItemId()%> </td>
				<td> <%=c.getpName()%> </td>
				<td><img alt="image" src="productImages/<%=c.getpImage()%>" width="100" height="100">  </td>
				<td> <%=c.getUnitPrice()%> </td>
				<td> <%=c.getQuantity() %> </td>
				<td> <%=c.getpValue() %> </td>
				<td> <form action="./DeleteCartItemServlet" method="POST">
				
				<input type="hidden"  name="product_id" value="<%= c.getItemId()%>" >
				 
				
				
				
				<input type="submit" value="remove"  >
				
				</form>
				 </td>
				 
				
				
					</tr>	
        			
        			<%} %>
        				
				</table>
        			<p><b>Grand Total  </b><b>RS : <%=sum %>  </b>  </p>
        			<br><button ><a href="PurchaseDeliveryAddress.jsp">Proceed Purchase</a></button>
				
				
        			
    		
    
</body>
</html>