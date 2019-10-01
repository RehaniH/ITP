<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Settings</title>
<!-- IT18176070: Perera P.R.H -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
</head>
<body>
	<div class="jumbotron" >
		<div class="container">
			<h2 class="display-4" >
				Settings
			</h2>
		</div>
	</div>
	
	<div class="container">
		<h4 >Deactivate Account</h4>
		<%
			if(request.getAttribute("Results")!=null){
				boolean status = (Boolean)request.getAttribute("Status");
				out.println("<h5 style=\"color:red;\"> "+ "Could not deactivate the account due to incompatible passwords."
				+ "</h5>");
			}else
				if(request.getAttribute("Status") !=null){
					out.println("<h5 style=\"color:red;\"> "+ "Please check your email and password and try again."
							+ "</h5>");	
				}
			
			
		
		%>
		<form action="DeactivateCusServlet" method="post">
		<div class="row">
			<div class="form-group col-md-8">
			<div class="form-group col-md-10">
				<label for="email">User Name</label>
				<input type="email" class="form-control" name="user" id="email" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter the correct User Name.</div>
			</div>		
		
			<div class="form-group col-md-10">
				<label for="oldPass">Enter Password</label>
				<input type="password" class="form-control" name="pass1" id="oldPass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter the correct password.</div>
			</div>
		
			<div class="form-group col-md-10">
				<label for="newPass">Re enter Password</label>
				<input type="password" class="form-control" name="pass2" id="newPass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter the correct password.</div>
			</div>
			</div>
			
			<div class="form-group col-md-4">
				<img alt="product displayed" class="mx-auto d-block"
							src="images/handshake.jpg" >
			</div>
			
			</div><!-- The first row -->
			
			<div class="form-group">
			<label for="">Please state the reason for leaving us before you deactivate the account.</label>
			<div style="color:#483D8B;">
			<div >
    			<input type="radio"  id="leaving" name="reason" value="dislike" required>
   				<label  for="leaving">I don't like the online hardware store.</label>
   			<div >
   				<input type="radio"  id="leaving" name="reason" value="usability">
   				<label for="leaving">I won't be using the online store anymore.</label>
   			</div>
   			
   			<div >
   				 <input type="radio"  id="leaving" name="reason" value="fProducts">
   				 <label  for="leaving">I have received faulty products.</label>
   			</div>
   			<div >
   				 <input type="radio"  id="leaving" name="reason" value="site">
   				 <label  for="leaving">I unsatisfied with the web site.</label>
   			</div>	
   			<div >
   				 <input type="radio"  id="leaving" name="reason" value="shipments">
   				 <label  for="leaving">Products I ordered weren't shipped.</label>
  			</div> 
			
			<div class="d-flex justify-content-end mb-3">
				<input type="submit" value="Submit" class="btn btn-success"/>
			</div>
			</div>
			</div>
			</div>
		</form>
	
		<form action="DirectServlet" method="post">
		 	<div >
				<input type="submit" value="Back" class="btn btn-info" style="left:50px;" />
			</div>
		</form>
	</div>

</body>
</html>