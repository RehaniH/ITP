<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/addnewItem.css">
<script type="text/javascript" src="js/addAdmin.js"></script>
<title>Add new Admin</title>
</head>
<body>
<form enctype="multipart/form-data" action="./addAdminServlet" name="addAdminfrm" onsubmit="return validateAddAdminForm()" method="POST"  autocomplete="on">
  <div class="container">
    <h1>Add new Administrator!</h1>
    <p>Please fill new Admin details.</p>
    <hr>
    
	<br>
    <label for="email"><b>Admin ID</b></label>
    <input type="text" placeholder="Enter admin ID" name="a_id" required="required" >

    <label for="email"><b>Admin First Name</b></label>
    <input type="text" placeholder="Enter admin first name" name="a_fname" required="required" >
    
    <label for="email"><b>Admin Last Name</b></label>
    <input type="text" placeholder="Enter admin last name" name="a_lname"  >

    <label><b>Profile Image</b></label>
    <input type = "file" name = "profile_image" size = "50"  />
     <hr>
     <br>
   
    <label for="email"><b>Age</b></label>
    <input type="text" placeholder="Enter age" name="a_age"  >
    
    <br>
    <label for="email"><b>Admin Contact</b></label>
    <input type="text" placeholder="076 *******" name="a_contact" required="required" >
    <br>
    <label for="email"><b>Email address</b></label>
    <input type="text" placeholder="tharik@yahoo.com" name="a_email" required="required" >
     <br>
    <label for="email"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="a_password"  required="required">
    <label for="email"><b>Enter Password Again</b></label>
    <input type="password" placeholder="Enter Password" name="a_password2"  required="required">

    
    <br>

    
    
    
   
	<button type="submit" class="registerbtn">Add Item</button>
	 </div>
	</form>
 	
<button style="color: white; text-decoration: none; padding: 15px ;32px text-align: center;" ><a href="AdminDashboard.jsp">Back</a></button>
 
</body>
</html>