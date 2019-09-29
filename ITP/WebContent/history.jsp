<!DOCTYPE html>
<html>
<head>

<title>Delivery History</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrapPulasthi/bootstrap.min.css">
  <script src="bootstrapPulasthi/jquery.min.js"></script>
  <script src="hbootstrapPulasthi/popper.min.js"></script>
  <script src="bootstrapPulasthi/bootstrap.min.js"></script>
  <script src="bootstrapPulasthi/jquery.min.js"></script>
   <link rel="stylesheet" href="cssPulasthi/style.css">
   
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
  body{
		
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	
	}

</style>
 

</head>
<body>

<nav class="navbar navbar-light bg-light">
  <form class="form-inline" >
   
   <a href="details.jsp"><button class="btn btn-sm btn-outline-secondary" type="button" >Details</button></a>&nbsp
     <a href="myprofile1.jsp"><button class="btn btn-sm btn-outline-secondary" type="button"  >My Profile</button></a>&nbsp
    <a href="history.jsp"><button class="btn btn-outline-success" type="button" >History</button></a>&nbsp
  </form>
  <form class="form-inline" method="post" action="search-deliverd-returned.jsp">
<input type="text" name="roll_no" class="form-control" placeholder="Search" required>&nbsp
<button type="submit" name="save" class="btn btn-primary">Search</button>&nbsp
 <a href="index.jsp"><button class="btn btn-outline-dark" type="button">Log Out</button></a>&nbsp
</form>

</nav>

<body background="Pics/abc.png">
<br></br>
<br></br>
<h1><center><font color="White">Delivery History</font></center></h1>




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


<br></br>
<br></br>
<h3><center><u><font color="White">Deliverd Details</font></u></center></h3>
<br>



<div class="container">

   <table class="table">
    <thead>
      <tr>
        <th>Customer Name</th>
        <th>Address</th>
        <th>Telephone Number</th>
        <th>Order ID</th>
        <th>Upgrade Status or View Report</th>
      </tr>
    </thead>



<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM deliverd";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

 
 
 
 <tr class="table-primary">
       <td><%=resultSet.getString("name") %></td>
       <td><%=resultSet.getString("address") %></td>
       <td><%=resultSet.getString("tele") %></td>
       <td><%=resultSet.getString("order_id") %></td>
        <td>
       <button type="button" id="<%=resultSet.getString("id") %>"  class="delete1">Update as Returned</button>&nbsp;&nbsp;
       <button type="button" id="<%=resultSet.getString("id") %>" class="">Display Report</button>&nbsp;
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




<!-- ------------------------------------------------------------------------------------------------------------------------ -->

<br></br>
<br></br>
<h3><center><u><font color="White">Returned Details</font></u></center></h3>
<br>



<div class="container">

   <table class="table">
    <thead>
      <tr>
        <th>Customer Name</th>
        <th>Address</th>
        <th>Telephone Number</th>
        <th>Order ID</th>
        <th>Upgrade Status or View Report</th>
      </tr>
    </thead>



<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM returned";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

 
 
 
 <tr class="table-primary">
       <td><%=resultSet.getString("name") %></td>
       <td><%=resultSet.getString("address") %></td>
       <td><%=resultSet.getString("tele") %></td>
       <td><%=resultSet.getString("order_id") %></td>
       
        <td>
       <button type="button" id="<%=resultSet.getString("id") %>"  class="delete">Update as Deliverd</button>&nbsp;&nbsp;
       <button type="button" id="<%=resultSet.getString("id") %>" class="">Display Report</button>&nbsp;
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
url: "update-deliverd.jsp",
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
	url: "update-returned.jsp",
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

 <div class="main">
        
        <div class="header">
        
        </div>
        <div class="container">
            <form id="booking-form" class="booking-form" method="POST" action="history.jsp">
                <div class="form-group">
                    <div class="form-destination">
                    <font color="White">
                        <label for="destination">Order ID</label></font>
                        <input type="text" id="order_id" class="order_id" placeholder="" />
                    </div>
                    <div class="form-date-from form-icon">
                     <font color="White">
                        <label for="date_from">Reason</label></font>
                        <input type="text" id="reason" class="reason" placeholder="" />
                        
                        
                    </div>
                    
                    <div class="form-submit">
                        <input type="submit" id="save_data" class="submit" value="Submit" />
                    </div>
                </div>
            </form>
        </div>

    </div>


<script>
$(document).ready(function() {
$("#save_data").click(function() {
alert("succeess");
$.ajax({
url: "save.jsp",
type: "post",
data: {
order_id:$('#order_id').val(),
reason:$('#reason').val(),
success : function(data){
//alert(data);
location.reload(); 
}
}
});
});
});
</script>


</body>
</html>