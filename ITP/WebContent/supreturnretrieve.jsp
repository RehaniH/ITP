<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("rid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "store";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<style>
table, td, th {  
  border: 1px solid #ddd;
  text-align: left;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 15px;
}

.button {
  background-color: #4CAF50;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>

<h1>Return Summary</h1>
<table border="1">
<tr>
<td>Return ID</td>
<td>Product name</td>
<td>Product ID</td>
<td>Product Return Reason</td>
<td>Product Return Quantity</td>
<td>Product Return Date</td>
<td>Supplier ID</td>
<td>Supplier Name</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from supplier_return";
ResultSet rs = statement.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("rid") %></td>
<td><%=rs.getString("p_name") %></td>
<td><%=rs.getString("p_ID") %></td>
<td><%=rs.getString("p_r") %></td>
<td><%=rs.getInt("stocks") %></td>
<td><%=rs.getString("p_d") %></td>
<td><%=rs.getString("s_id") %></td>
<td><%=rs.getString("s_name") %></td>
<td><a href="delete.jsp?id=<%=rs.getInt("rid") %>"><button class="button" type="button" class="delete">Delete</button></a></td>

</tr>
<%

}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>