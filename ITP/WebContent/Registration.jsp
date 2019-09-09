<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>RegistrationForm</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script type="text/javascript"> 
       function showAlert(){
	       alert("Form has been submitted successfully !!!Your account will be activated after your supplier request is confirmed in 1-2 hours.!!Please try logging in an hour. Do not hesitate to contact us.")
       }
       
    </script>
  
  <!--TableStyles------------------------------------------->
  <style>			  
		  input[type=reset] {
		  background-color: #4CAF50;
		  color: white;
		  padding: 12px 82px;
		  border: none;
		  border-radius: 15px;
		  cursor: pointer;		   
		  }
		  		
		  input[type=reset]:hover {  
			background-color: #45a049;
		  }

		  input[type=submit] {
		  background-color: #4CAF50;
		  color: white;
		  padding: 12px 50px;
		  border: none;
		  border-radius: 15px;
		  cursor: pointer;
		  width: 200px;
		 
		}
		
		input[type=submit]:hover {
		  background-color: #45a049;
		}
  	     
     	table {
		  font-family: arial, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		td, th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 8px;
		}
		
		tr:nth-child(even) {
		  background-color: #dddddd;
		  }
		  
	  h2{

		  background-color: #dddddd;
	      float:centre;
	  }
	.header{
	 background-color: #dddddd;
	
	}	  
	.select{	
	text-decoration: #dddddd;
	}
	
}
  </style>
    <script type="text/javascript"> 
   function showAlert(){
	   alert("Form has been submitted successfully !!!Your account will be activated after your supplier request is confirmed in 1-2 hours.!!Please try logging in an hour. Do not hesitate to contact us.")
   }
   </script>
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
		
		<!-- STYLE CSS --> 
		<link rel="stylesheet" href="bootstrap/css/RegSupstyle.css">
	</head>
	<body>
		  
	
	
		<div class="wrapper" style="background-image: url('images/downloadp.jpg');">
			<div class="inner">
			<div></div>
				<form method="POST" action="./InsertSupplierServlets" onsubmit="return showAlert();">
					<h3>Registration Form</h3>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">First Name</label>
					<input type="text" class="form-control" name="firstName" maxlength = "15" required/>

						</div>
						<div class="form-wrapper">
							<label for="">Last Name</label>
							<input type="text" class="form-control" name="lastName" value = "" maxlength = "20"  required/>
						</div>
					</div>
					<div class="form-wrapper">
						<label for="">Company Name</label> <input type="text" class="form-control" name="companyName" maxlength = "20" required/>
					</div>
					<div class="select-list" >
						<label for="">Product Category</label>
						<select name="productCategory" class="form-control">
				          <option value="Electricals" class="form-control" >Electrical</option>
				  		  <option value="Plumbing"  class="form-control">Plumbing</option>
				  	      <option value="Paint"  class="form-control">Paint</option>
				          </select>
					</div>
					<div class="form-wrapper">
						<label for="">Contact Number</label>
						<input type="number" name="contactNumber" class="form-control" size="50" maxlength = "30" required/>
					</div>
					<div class="form-wrapper">
						<label for="">Email Address</label>
						<input type="email" name="emailAddress" class="form-control" size="50" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}"/>
					</div>
					<div class="form-wrapper">
						<label for="">Address</label>
						<input type="text" name="address" class="form-control" size="50" maxlength = "60" required/>
					</div>
					<div class="form-wrapper">
						<label for="">Password</label>
						<input type="password" name="password" class="form-control" size="50" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
					</div>
					<div class="form-checkbox">
					<label class="container">
					<p>By signing up, you agree to the <a href="#" class="text">Term of Service</a></p>
					  	<input type="checkbox" name="agree" id="agree">
					  	<span class="checkmark"></span>
					</label>
				</div>
					<br>
					<input type="submit" value="Register" class="register-button" /> 
					<br>
					<br>
					<input type="reset" value="Reset" class="reset-button"/>
				</form>
			</div>
		</div>
	
</html>