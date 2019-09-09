<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="css/addnewItem.css">
<title>Add New Product</title>
<script type="text/javascript" src="js/insertItem.js"></script>


</head>
<body>
 ${requestScope.message}	
<form  enctype="multipart/form-data" action="./AddItemServlet " name="frm" onsubmit="return validateForm() " method="POST"  autocomplete="on">
  <div class="container">
    <h1>Insert New Product</h1>
    <p>Please fill item details.</p>
    <hr>
    
	<br>
    <label for="email"><b>Product ID</b></label>
    <input type="text" placeholder="Enter Product ID" name="product_id" required="required" >

    <label for="email"><b>Product Name</b></label>
    <input type="text" placeholder="Enter product name" name="product_name" required="required" >

    <label><b>Product Image</b></label>
    <input type = "file" name = "product_image" size = "50" required="required" />
     <hr>
     <br>
    <label for="email"><b>Product Category</b></label><br>
   <input type="radio" name="product_category" value="Paints And Brushes" required="required" > Paints And Brushes<br>
   <input type="radio" name="product_category" value="Electrical" required="required"> Electrical<br>
   <input type="radio" name="product_category" value="Plumbing"required="required" >Plumbing
    <hr>
	<br>
    <label for="email"><b>Supplier Name</b></label>
    <input type="text" placeholder="Enter Supplier Name" name="supplier_name"  required="required">
    
    <br>
    <label for="email"><b>Supplier Contact</b></label>
    <input type="text" placeholder="Enter Supplier Contact" name="supplier_contact" required="required" >
    <br>
    <label for="email"><b>Unit size</b></label>
    <input type="text" placeholder="Unit Size" name="product_unitSize" required="required" >
     <br>
    <label for="email"><b>Cost price</b></label>
    <input type="text" placeholder="Enter Cost price" name="cost_price"  required="required">
    
    <br>
    <label for="email"><b>Selling price</b></label>
    <input type="text" placeholder="Enter Selling price" name="selling_price" required="required" >
     
    <br>
    <label for="email"><b>Buffer Stock</b></label>
    <input type="text" placeholder="Enter Buffer Stock" name="buffer_stock" required="required" >
    
    <br>
    <label for="email"><b>Item Description</b></label>
    <input type="text" placeholder="Enter Item Description" name="product_desc" required="required" >
    
    
    
   
	<input type="submit" class="registerbtn" value="Add Item" >
	 </div>
	</form>

<button style="color: white; text-decoration: none; padding: 15px ;32px text-align: center;" ><a href="inventoryManagement.jsp">Back</a></button>
 
</body>
</html>