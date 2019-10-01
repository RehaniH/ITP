<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.nlhs.model.OrderDetails" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order History</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>

</head>
<%
	ArrayList<OrderDetails> list = new ArrayList<>();
	
	
	if(request.getAttribute("History") != null){
		list = (ArrayList)request.getAttribute("History");
		
		
%>
<body>
	<div class="jumbotron" >
		<div class="container">
			<h1 class="display-4" >
				Order History
			</h1>
		</div>
	</div>
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
	<!-- For change of colors use  style="background-color:#FFA500; color:white" -->
    <thead class="thead-dark">
      <tr>
        <th>Order Id</th>
        <th>Order Date</th>
        <th>Total</th>
        <th>Order Status</th>
        <th>Record</th>
       <!--  <th>View Reciept</th> -->
      </tr>
    </thead>
    <!-- For change of colors use style="background-color:#FFF5EE; -->
    <%
    
    if(!list.isEmpty()){
		
		for(OrderDetails details: list){
			
			
			
	    	out.print("<tbody>");
	    	out.print("<tr>");
	    	out.print("<td>" + details.getOrderId() + "</td>");
	    	out.print("<td>" + details.getOrderDate() + "</td>");
	    	
	    	out.print("<td>" + details.getGrandTotal() + "</td>");
	    	out.print("<td >" + details.getOrderStatus() + "</td>");
	    	 out.print("<form action='OrderHistoryServlet' method='post'>");
	    	 out.print("<input type='hidden' name='id' value=" + details.getOrderId() + " />");
	    	 out.print("<td>" +  "<input type='submit' value='Details' name='View' class='btn btn-secondary'/>"
	    			+ "&nbsp"	+ "<input type='submit' value='Delete' name='delete' class='btn btn-dark'/>"+ "</td>");
	    	 out.print("</form");
    
   
    %>
    
    	<a class="tooltips" data-toggle="tooltip" data-placement="top" title="Delete">
          <button type="submit"  style="border: 0; background: none;">
            <i class="fa fa-trash-o" aria-hidden="true"></i>
          </button>

       </a>
   
    
    <%    		
			
			
			out.print("</tr>");
			out.print("</tbody>");	
			}


		}
	}
				
			
	%>
    
  </table>
	</div>

</body>
</html>