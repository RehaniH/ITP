<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.service.SupplierStatusServiceImpl"%>
<%@page import="com.nlhs.service.SupplierStatusServices"%>
<%@page import="com.nlhs.model.Supplier"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Suppliers</title>
 <style>
  			* {
  			box-sizing: content-box;
  			
			}

input[type=text], select,input[type=number],input[type=date] {
  width: 30%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: inherit;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 10px;
  background-color: #f2f2f2;
  padding: 10px;
}

.col-25 {
  float: left;
  width: 10%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 70%;
  margin-top: 6px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}


@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
			table {
 			 border-collapse: collapse;
  			 width: 100%;
			}

			th, td {
  				padding: 8px;
  				text-align: left;
  				border-bottom: 1px solid #ddd;
			}

			tr:hover {background-color:#f5f5f5;}
			* {box-sizing: border-box;}

			body { 
  				margin: 0;
  				font-family: Arial, Helvetica, sans-serif;
			}

			.header {
  				overflow: hidden;
  				background-color: #f1f1f1;
  				padding: 20px 10px;
			}

			.header a {
  				float: left;
  				color: black;
 			 	text-align: center;
  				padding: 12px;
  				text-decoration: none;
 			 	font-size: 18px; 
  				line-height: 25px;
  				border-radius: 4px;
			}

			.header a.logo {
  				font-size: 25px;
  				font-weight: bold;
			}

			.header a:hover {
  				background-color: #ddd;
  				color: black;
			}

			.header a.active {
  				background-color: dodgerblue;
  				color: white;
			}

			.header-right {
  				float: right;
			}

			@media screen and (max-width: 500px) {
  				.header a {
    				float: none;
    				display: block;
    				text-align: left;
  				}
  
  				.header-right {
    				float: none;
  				}
  			}
  			footer{
  				position: fixed;
   				left: 0;
   				bottom: 0;
   				width: 100%;
   				background-color: black;
   				color: white;
   				text-align: center;}
   			input[type=search] {
  				width: 130px;
  				box-sizing: border-box;
  				border: 2px solid #ccc;
  				border-radius: 4px;
  				font-size: 16px;
  				background-color: white;
  				background-image: url('searchicon.png');
 				background-position: 10px 10px; 
  				background-repeat: no-repeat;
  				padding: 12px 20px 12px 40px;
  				-webkit-transition: width 0.4s ease-in-out;
 			 	transition: width 0.4s ease-in-out;
			}

			input[type=search]:focus {
  				width: 80%;
			}
		</style>

</head>
<body>
	<header>
		<div class="header">
  				<a href="#default" class="logo">NEW LANKA HARDWARE</a>
  			<div class="header-right">
    			<a class="active" href="#home">PROFIT MANAGMENT</a>
    			<a href="#contact">INCOME</a>
    			<a href="#about">EXPENSE</a>
  			</div>
		</div>
	</header>

   <h1 align="center">Requested Suppliers</h1>
      
  <input type="search" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
       	<br><br>
       	<form class="edit">
       	<table id="myTable">
          <tr class="header">
            <th  style="width:150px;">SUPPLIER ID</th>
            <th  style="width:150px;">FIRST NAME</th>
            <th  style="width:150px;">COMPANY NAME</th>
            <th  style="width:150px;">PRODUCT CATEGORY</th>
            <th style="width:150px;">ACCEPT SUPPLIER REQUEST</th>
            <th style="width:150px;">DENY SUPPLIER REQUEST</th>
            </tr>
     <%
     	SupplierStatusServices supplierServices = new SupplierStatusServiceImpl();
                      ArrayList<Supplier> arrayList = supplierServices.getSuppliers();
                      for(Supplier supplier : arrayList){
     %>
    
		    <tr>
		    <td><%=supplier.getSupplierID()%> </td>
		    <td><%=supplier.getFirstName()%> </td>
		    <td><%=supplier.getCompanyName() %></td>
		    <td><%=supplier.getProductCategory() %></td>
		    <td>
		    <form method="POST" action="./AcceptSupplierServerlet">
				<input type="hidden" name="supplierID" value= "<%=supplier.getSupplierID()%>"/>
				 <input type="submit" value= "Accept Request" class="select-button" /> 
		    </form></td>
		    <td>
		    <form method="POST" action="./DenySupplierServerlet">
				<input type="hidden" name="supplierID" value= "<%=supplier.getSupplierID()%>"/>
				 <input type="submit" value= "Deny Request" class="select-button" /> 
		    </form>
		    
		    </td>	
		    </tr>
    <%
  
        }
            %>
            <tr>
   
  </tr>
    </table>
 </form>   
 <footer>
  		<p>Posted by: Tharik Rizan</p>
  		<p>Contact information: <a href="NewLankaHardware.com">New Lanka Hardware</a>.</p>
	</footer>
    <script>
		function myFunction() {
		  var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[1];
		    if (td) {
		      txtValue = td.textContent || td.innerText;
		      if (txtValue.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }       
		  }
		}
</script>
</body>
</html>