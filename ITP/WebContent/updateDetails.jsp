<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>


<script>
		// Disable form submissions if there are invalid fields
		(function() {
  			'use strict';
 			 window.addEventListener('load', function() {
   			 // Get the forms we want to add validation styles to
   			 var forms = document.getElementsByClassName('needs-validation');
    			// Loop over them and prevent submission
    			var validation = Array.prototype.filter.call(forms, function(form) {
      			form.addEventListener('submit', function(event) {
        		if (form.checkValidity() === false) {
         			 event.preventDefault();
          				event.stopPropagation();
        			}
        		form.classList.add('was-validated');
      			}, false);
    		});
  			}, false);
		})();
</script>

</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h2 class="display-4">My Information</h2>
		</div>
	</div>
	
	
	<div class="container" style="border: 2px solid green; padding:20px;">
		
		<div class="row">
		<div class="col-md-8">
		<div>
			<h4>Change My Information</h4>
		</div>
	<!-- class="needs-validation" -->
		<form  action="UpdateCusInfoServlet" method="post" class="needs-validation" novalidate>
			
			<div class="form-group col-md-10">
				<label for="email">User Name</label>
				<input type="email" class="form-control" name="user" id="email" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter the correct User Name. </div>
			</div>	
			
				
		
			<div class="form-group col-md-10">
				<label for="fname">First Name </label>
				<input type="text" class="form-control" name="fName" id="fname" pattern="[A-Za-z]{3,15}" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter name starting form a capital letter and less than 15 characters.</div>
			</div>
		
			<div class="form-group col-md-10">
				<label for="lName">Last Name </label>
				<input type="text" class="form-control" name="lName" id="lName" pattern="[A-Za-z]{3,15}" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter name starting form a capital letter and less than 15 characters. 
				</div>
			</div>
			<div class="d-flex justify-content-end mb-3">
				<input type="submit" value="Save" class="btn btn-success" name="Names"/>
			</div>
		</form>
		</div>
		
		<div class="form-group col-md-4">
					<img alt="product displayed" class="mx-auto d-block"
							src="productImages/13APlugBase.jpg" >
				</div>
		</div><!-- End of the row -->
	</div>
	
			
			
	
	
	<div class="container" style="border: 2px solid green; padding:20px; margin-top:100px; margin-bottom:100px;">
	
		<div class="row">
			<div class="col-md-8">
		<div>
			<h4>Change password</h4>
		</div>
	<!-- class="needs-validation" -->
		<form  action="UpdateCusInfoServlet" method="post"  class="needs-validation" novalidate>
	
			<div class="form-group col-md-10">
				<label for="email">User Name</label>
				<input type="email" class="form-control" name="user" id="email" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter the correct User Name.</div>
			</div>		
		
			<div class="form-group col-md-10">
				<label for="oldPass">Old Password</label>
				<input type="password" class="form-control" name="old" id="oldPass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter the correct password.</div>
			</div>
		
			<div class="form-group col-md-10">
				<label for="newPass">New Password</label>
				<input type="password" class="form-control" name="new" id="newPass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">Please enter a password with at least 1 character, 1 special 
				character and 1 number with 8 characters or more.
			
				</div>
			</div>
			<div class="d-flex justify-content-end mb-3">
				<input type="submit" value="Save" class="btn btn-success" name="Passwords"/>
			</div>
		</form>
		</div>
		<div class="form-group col-md-4">
					<img alt="product displayed" class="mx-auto d-block"
							src="productImages/holder.jpg" >
				</div>
		</div><!-- End of the row -->
		
		</div><!-- End of the row in second form -->
	</div>
	
	
	
	
</body>
</html>