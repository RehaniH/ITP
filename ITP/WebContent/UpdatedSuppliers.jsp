<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.nlhs.service.SupplierServiceImpl"%>
<%@page import="com.nlhs.service.ISupplierServices"%>
<%@page import="com.nlhs.model.Supplier"%>
<%@page import="java.util.ArrayList"%>
<!-- S.A.L.Witharana
     IT18068856   -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateSupplier</title>
<link rel="stylesheet" type = "text/css" href="./SupplierStyle.css"/>
<!--TableStyles------------------------------------------->
	  <style>
	    table {
	    border-collapse: collapse;
	    border-spacing: 0;
	    width: 50%;
	    border: 1px solid #ddd;
	    }
	
		th {
		  background-color: #4CAF50;
		  color: white;
		}
	    th, td {
	      text-align: left;
	      padding: 8px;
	    }
	
	    tr:nth-child(even){background-color: #f2f2f2}
	  </style>
	   <style>
    .jumbotron {
      margin-bottom: 0px;
      height: 80px;
    }
 
	  
<!--TableStyles--------------------------------------->

    <link rel="stylesheet" href="css/Supplierprofilestyle.css">
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 20%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 50%;
  align-items: centre;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}

</style>
</head>
<body>
 <h2>Updates Of Suppliers</h2>
      
  <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
       	<form class="edit">
       	<table id="myTable">
          <tr class="header">
            <th  style="width:40%;">Supplier Id</th>
            <th  style="width:40%;">First Name</th>
            <th  style="width:40%;">Last Name</th>
            <th  style="width:40%;">Company Name</th>
            <th  style="width:40%;">Product Category</th>
            <th  style="width:40%;">Contact Number</th>
            <th  style="width:40%;">Email</th>
            <th  style="width:40%;">Address</th>
            <th  style="width:40%;">Select</th>
            </tr>
     <%
            ISupplierServices supplierServices = new SupplierServiceImpl();
            ArrayList<Supplier> arrayList = supplierServices.getSuppliers();
            for(Supplier supplier : arrayList){
     
    %>
    
		    <tr>
		    <td><%=supplier.getSupplierID()%> </td>
		    <td><%=supplier.getFirstName()%> </td>
		    <td><%=supplier.getLastName()%> </td>
		    <td><%=supplier.getCompanyName()%> </td>
		    <td><%=supplier.getProductCategory()%></td>
		    <td><%=supplier.getContactNumber()%></td>
		    <td><%=supplier.getEmailAddress()%></td>
		    <td><%=supplier.getAddress() %></td>
		    
		    <td>
		    <form method="POST" action="./GetSupplierServlet">
				<input type="hidden" name="supplierID" value= "<%=supplier.getSupplierID()%>"/>
				 <input type="submit" value= "Select Supplier" class="select-button" /> 
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
 
     <h5>The updates of the suppliers are shown here.</h5>
          <form  action="UpdatedDynamReport.jsp">	
				 <input type="submit" value= "Updates of Suppliers" class="select-button" /> 
		    </form>
		    
     <!-- UpdatedDynamicReport.jsp -->
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