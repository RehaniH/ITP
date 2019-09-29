<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page language="java"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
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
  width: 20%;
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
<body>

<%@page language="java"%>
<%@page import="java.sql.*"%>
<table border="1">


</tr>
<%
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/store", "root", "root");
String query = "select * from returned ";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>



<tr>
<tr><td>Return ID</td><td><input type="text" name="id"  value="<%=rs.getString("id")%>"></td></tr>
<tr><td>Name</td><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td></tr>
<tr><td>Address</td><td><input type="text" name="address" value="<%=rs.getString("address")%>"></td></tr>
<tr><td>Telephone </td><td><input type="text" name="tele" value="<%=rs.getString("tele")%>"></td></tr>
<tr><td>Order ID </td><td><input type="text" name="order_id" value="<%=rs.getString("order_id")%>"></td></tr>
<tr><td><a href="vousave.jsp?id=<%=rs.getString("id") %>"><button type="button" class="submit">Create</button></a></td></tr>
<%

}

System.out.println("Data is successfully inserted!");
}
catch(Exception e){}
%>

</table>
<script>
$(document).ready(function() {
$(".save_data").click(function() {
var id = +this.id;
$.ajax({
url: "vousave.jsp",
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