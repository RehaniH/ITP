<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.nlhs.service.AdminServiceImp"%>
<%@page import="com.nlhs.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/addnewItem.css">
<meta charset="ISO-8859-1">
<title>Edit Admin Profile</title>
<script type="text/javascript" src="js/addAdmin.js"></script>
</head>
<body>
  <%Admin admin = new Admin(); %>
  <%if(session.getAttribute("UserID") == null){
	  request.getRequestDispatcher("index.jsp").include(request, response);  
  }else{
	  String id = (String)session.getAttribute("UserID");
	  AdminServiceImp asi = new AdminServiceImp();
	  
	  
	  admin = asi.getAdmin(id);
	 
	  
  } %>
<form enctype="multipart/form-data" action="./UpdateAdminProfileServlet" name="addAdminfrm" onsubmit="return validateAddAdminForm()" method="POST"  autocomplete="on">
  <div class="container">
    <h1>Edit Admin Profile</h1>
    <p>Please update Admin details.</p>
    <hr>
    
	<br>

    <input type="hidden" placeholder="Enter admin ID" value="<%=admin.getAid()   %>" name="a_id"  required="required" >

    <label for="email"><b>Admin First Name</b></label>
    <input type="text" placeholder="Enter admin first name" value="<%=admin.getFname()%>" name="a_fname" required="required" >
    
    <label for="email"><b>Admin Last Name</b></label>
    <input type="text" placeholder="Enter admin last name"  value="<%=admin.getLname() %>" name="a_lname"  >

    <label><b>Profile Image</b></label>
    <input type = "file" name = "profile_image" size = "50"  />
     <hr>
     <br>
   
    <label for="email"><b>Age</b></label>
    <input type="text" placeholder="Enter age" value="<%=admin.getAge() %>" name="a_age"  >
    
    <br>
    <label for="email"><b>Admin Contact</b></label>
    <input type="text" placeholder="076 *******" name="a_contact"  value="<%=admin.getContactNumber()%>"  required="required" >
    <br>
    <label for="email"><b>Email address</b></label>
    <input type="text" placeholder="tharik@yahoo.com" name="a_email"  value="<%=admin.getEmail() %>" required="required" >
     <br>
    <label for="email"><b>Password</b></label>
    <input type="text" placeholder="Enter Password" name="a_password" value="<%=admin.getPassword() %>" required="required">
    

    
    <br>

    
    
    
   
	<button type="submit" class="registerbtn">Update Item</button>
	 </div>
	</form>
</body>
</html>