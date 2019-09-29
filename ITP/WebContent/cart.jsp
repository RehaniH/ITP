<%@page import="com.nlhs.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nlhs.service.CartServiceImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NEW LANKA HARDWARE STORE|CART</title>
<%@ include file = "header.jsp" %>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}



</style>
</head>
<body>


<%if(session.getAttribute("UserName") == null){
	  request.getRequestDispatcher("index.jsp").include(request, response);  
  } %>
  <% String userEmail = (String)session.getAttribute("UserName");
  		float sum = 0;
  %>
  
  
  <table border="0" cellpadding="12">
		 <caption><h2>ITEMS ADDED TO YOUR CART</h2></caption>
		
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
        			<br><button class="button"><a href="PurchaseDeliveryAddress.jsp">Proceed to Purchase</a></button>
				
					
    		
 <%@ include file = "footer.jsp" %>   
</body>
</html>