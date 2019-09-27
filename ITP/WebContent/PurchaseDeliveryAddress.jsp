<!DOCTYPE html>
<html>
    <head>
        <title>New Lanka Hardware | Store</title>
        <meta name="description" content="This is the description">
        <link rel="stylesheet" href="css/stylesNis.css" />
        

	<style>
    
        *{margin: 0; padding: 0;}
        body{background: #ecf1f4; font-family: sans-serif;}
        
        .form-wrap{ width: 500px; background: #3e3d3d; padding: 20px 20px; box-sizing: border-box;position:absolute; top:250px;left:550px;}

        h1{text-align: center; color: #fff; font-weight: normal; margin-bottom: 20px;}
        
        input{width: 100%; background: none; border: 1px solid #fff; border-radius: 3px; padding: 6px 15px; box-sizing: border-box; margin-bottom: 20px; font-size: 16px; color: #fff;}
        
        input[type="submit"]{ background: #ff3361; border: 0; cursor: pointer; color: #3e3d3d;}

        input[type="submit"]:hover{ background: #3393ff  ; transition: .6s;}
        
        ::placeholder{color: #fff;}
    
    </style>
    </head>
    <body>
        <header class="main-header">
          
            <h1 class="band-name band-name-large">New Lanka Hardware</h1>
        </header>
	
	<div class="form-wrap">	
		<form method="post" action="PurchaseAddressServlet">
            
                <h1>Enter New Address</h1>
				<input type="text" name="social" placeholder="Social Status" required>
                <input type="text" name="fname" placeholder="First Name" required>
                <input type="text" name="lname" placeholder="Last Name" required>
                <input type="text" name="no" placeholder="Address Line 1" required>
                <input type="text" name="street" placeholder="Address Line 2" required>
                <input type="text" name="city" placeholder="City" required>
                <input type="text" name="district" placeholder="District" required>
                <input type="number" name="postal" placeholder="Postal Code" required>
                <input type="number" name="tele" placeholder="Telephone Number" required>
                <input type="email" name="email"  placeholder="Enter your email">
                
               
             
                
           		<button class="btn btn-primary btn-purchase"  type="submit">PROCEED TO PAYMENTS</button>
          	   </form>
            
            
        
       
        </div>
        <footer class="main-footer">
            <div class="container main-footer-container">
                <h3 class="band-name">  </h3>
            </div>
        </footer>
    </body>
</html>