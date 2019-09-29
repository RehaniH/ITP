<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Lanka</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
		<h1 align="center">Profit Management</h1>
		<h1 align="center">Income</h1>
	<div class="container">
	<form method="post" action="../AddIncomeServerlet" >
		
		
	<div class="row">
    	<div class="col-25">
      		<label for="date">Date</label>
      	</div>
			<div class="col-75">
      			<input type="date" id="date" name="date" required">
    		</div>
  		</div>

		<div class="row">
    	<div class="col-25">
      		<label for="type">Type</label>
      	</div>
			<div class="col-75">
      			<input type="text" id="type" name="type" placeholder="Sales" required">
    		</div>
  		</div>
		<div class="row">
    	<div class="col-25">
      		<label for="value">Value</label>
      	</div>
			<div class="col-75">
      			<input type="number" id="value" name="value" placeholder="1000.00" required">
    		</div>
  		</div><br>
  		
  		<div class="row">
    		<input type="submit" value="Insert Income" class="insertI" />
  		</div>
	

	</form><br><br>

	<form method="post" action="../ListIncomeServerlet">
		<div class="row">
    		<input type="submit" value="List All" class="listI"/>
  		</div>
	</form>
	
	<footer>
  		<p>Posted by: Tharik Rizan</p>
  		<p>Contact information: <a href="NewLankaHardware.com">New Lanka Hardware</a>.</p>
	</footer>
	

</body>
</html>