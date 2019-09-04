<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
      </tr>
    </thead>
    <!-- For change of colors use style="background-color:#FFF5EE; -->
    <%
    	out.print("<tbody>");
    	out.print("<tr>");
    	out.print("<td>" + "" + "</td>");
    	out.print("<td>" + "" + "</td>");
    	out.print("<td>" + "" + "</td>");
    	out.print("<td>" + "" + "</td>");
    	out.print("</tr>");
    	out.print("</tbody>");
    
    %>
    
  </table>
	</div>

</body>
</html>