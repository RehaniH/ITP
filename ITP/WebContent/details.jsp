<!DOCTYPE html>
<html lang="en">
<head>
  <title>Delivery Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrapPulasthi/bootstrap.min.css">
  <script src="bootstrapPulasthi/jquery.min.js"></script>
  <script src="hbootstrapPulasthi/popper.min.js"></script>
  <script src="bootstrapPulasthi/bootstrap.min.js"></script>
  <script src="bootstrapPulasthi/jquery.min.js"></script>
  <style >

</style>
  
  
</head>
<body>

<!-- -<body background="Pics/abc.jpg"> -->
<nav class="navbar navbar-light bg-light">
  <form class="form-inline" >
      <a href="details.jsp"><button class="btn btn-outline-success" type="button" >Details</button></a>
     <a href="myprofile1.jsp"><button class="btn btn-sm btn-outline-secondary" type="button" >My Profile</button></a>
    <a href="history.jsp"><button class="btn btn-sm btn-outline-secondary" type="button">History</button></a>
  </form>
</nav>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
String id = request.getParameter("id");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/store";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>



<h1><center>Delivery Details</center></h1>
<br></br>
<br></br>


<div class="container">

   <table class="table">
    <thead>
      <tr>
        <th>Customer Name</th>
        <th>Address</th>
        <th>Telephone Number</th>
        <th>Order ID</th>
        <th>Order Status</th>
      </tr>
    </thead>



<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM details";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

 
 
 
 <tr class="table-primary">
       <td><%=resultSet.getString("name") %></td>
       <td><%=resultSet.getString("address") %></td>
       <td><%=resultSet.getString("tele") %></td>
       <td><%=resultSet.getString("order_id") %></td>
        <td>
       <button type="button" id="<%=resultSet.getString("id") %>"  class="delete">Deliverd</button>
       <button type="button" id="<%=resultSet.getString("id") %>" class="delete1">Returned</button>
       </td>
      </tr>






<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</table>


</div>


<script>
$(document).ready(function() {
$(".delete").click(function() {
var id = +this.id;
$.ajax({
url: "delete-deliverd.jsp",
type: "post",
data: {
id : id,
},
success : function(data){
//alert(data); 
location.reload(); 
}
});
});
});

$(document).ready(function() {
	$(".delete1").click(function() {
	var id = +this.id;
	$.ajax({
	url: "delete-return.jsp",
	type: "post",
	data: {
	id : id,
	},
	success : function(data){
	//alert(data); 
	location.reload(); 
	}
	});
	});
	});
</script>









</body>
</html>
