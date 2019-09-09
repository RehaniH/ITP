<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/addnewItem.css">
<script type="text/javascript" src="js/insertItem.js"></script>
<title>Edit Product</title>
</head>
<body>

<div><img src=productImages/<%=request.getParameter("pimage") %>> <h4>Previous Image</h4></div>

<form enctype="multipart/form-data" action="./EditItemServlet" name="frm" onsubmit="return validateForm() " method="POST"  autocomplete="on">
  <div class="container">
    <h1>Edit Product</h1>
    <p>Please fill item details.</p>
    <hr>
    
	<br>
    <label for="email"><b>Product ID</b></label>
    <input type="hidden" placeholder="Enter Product ID" name="product_id" value="<%=request.getParameter("product_id")  %>" required="required" >

    <label for="email"><b>Product Name</b></label>
    <input type="text" placeholder="Enter product name" name="product_name" value="<%=request.getParameter("product_name")%>" required="required" >

    <label><b>Product Image</b></label>
    <input type = "file" name = "product_image"  size = "50" required="required" />
     <hr>
     <br>
    <label for="email"><b>Product Category</b></label><br>
    <p>Previous value is <%=request.getParameter("product_category") %> </p>
    <input type="radio" name="product_category" value="<%=request.getParameter("product_category") %>" checked="checked"> Keep Previous Value<br>
   <input type="radio" name="product_category" value="Paints And Brushes" required="required" > Paints And Brushes<br>
   <input type="radio" name="product_category" value="Electrical" required="required"> Electrical<br>
   <input type="radio" name="product_category" value="Plumbing"required="required" >Plumbing
    <hr>
	<br>
    <label for="email"><b>Supplier Name</b></label>
    <input type="text" placeholder="Enter Supplier Name" name="supplier_name" value="<%=request.getParameter("supplier_name" ) %>"   required="required">
    
    <br>
    <label for="email"><b>Supplier Contact</b></label>
    <input type="text" placeholder="Enter Supplier Contact" name="supplier_contact" value="<%=request.getParameter("supplier_contact" ) %>" required="required" >
    <br>
    <label for="email"><b>Unit size</b></label>
    <input type="text" placeholder="Unit Size" name="product_unitSize" value="<%=request.getParameter("product_unitSize") %>" required="required" >
     <br>
    <label for="email"><b>Cost price</b></label>
    <input type="text" placeholder="Enter Cost price" name="cost_price" value="<%=request.getParameter("cost_price") %>" required="required">
    
    <br>
    <label for="email"><b>Selling price</b></label>
    <input type="text" placeholder="Enter Selling price" name="selling_price" value="<%=request.getParameter("selling_price") %>" required="required" >
     
    <br>
    <label for="email"><b>Buffer Stock</b></label>
    <input type="text" placeholder="Enter Buffer Stock" name="buffer_stock" value="<%=request.getParameter("buffer_stock") %>" required="required" >
    
    <br>
    <label for="email"><b>Item Description</b></label>
    <input type="text" placeholder="Enter Item Description" name="product_desc" value="<%=request.getParameter("product_desc") %>" required="required" >
    
    
    
   
	<button type="submit" class="registerbtn">Edit Item</button>
	 </div>
	</form>
 	
<button style="color: white; text-decoration: none; padding: 15px ;32px text-align: center;" ><a href="ShowProductForm.jsp">Back</a></button>
 
</body>
</html>