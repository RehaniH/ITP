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
  h1{
  font-family:Formal Scripts;
  font-size:60px;
  font-weight:bold;}
  
    th{
  font-family:Formal Scripts;
  font-size:20px;
  font-weight:bold;
  text-align:center;
  }
  thead{
  background-color: white;
  border-radius:10px;}
  
      td{
  font-family:Times New Roman;
  font-size:15px;
  font-weight:bold;
  text-align:center;}
  
button{
  background-color:#6699ff;
  color: black;
  font-size: 16px;
  height:40px;
  width:145px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  text-align: center;
  }
  
  button:hover{
  background-color:#33cc33;
  color: white;
  }
  .btnmap{
  margin-left: 55px;
  width:90px;
  height:90px;
  background: url("Pics/buttonicon.png");
  background-size: cover;
  }
    .btnmap:hover{

  }
  body{
		
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	
	}
  

</style>
  
  
</head>


  
<body background="Pics/abc.png" background-repeat="no-repeat">



  
<nav class="navbar navbar-light bg-light">
  <form class="form-inline" >
      <a href="details.jsp"><button class="btn btn-outline-success" type="button" >Details</button></a>&nbsp;
     <a href="myprofile1.jsp"><button class="btn btn-sm btn-outline-secondary" type="button" >My Profile</button></a>&nbsp;
    <a href="history.jsp"><button class="btn btn-sm btn-outline-secondary" type="button">History</button></a>
  </form>
  
   <form class="form-inline" method="post" action="search-details.jsp">
   <input type="search" name="roll_no" class="form-control" placeholder="Search" required>&nbsp;
   <button type="submit" name="save" class="btn btn-primary">Search</button>&nbsp;
     <a href="index.jsp"><button class="btn btn-outline-dark" type="button">Log Out</button></a>
   </form>
  
    
</nav>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
String id = request.getParameter("id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/store";
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


<br>
<h1><center><font color="White">Delivery Details</font></center></h1>
<br>

<a href="https://www.google.lk/maps" ><button class="btnmap"></button><h3 style="color:white; margin-left: 15px;" >Search Location</h3></a>
<br><br><br>

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
       <button type="button" id="<%=resultSet.getString("id") %>"  class="delete">Deliverd</button>&nbsp;&nbsp;
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
	alert(data); 
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
	alert(data); 
	location.reload(); 
	}
	});
	});
	});
</script>









</body>
</html>
