<!DOCTYPE html>
<html>
    <head>
        <title>New Lanka Hardware | Store</title>
        <meta name="description" content="This is the description">
        <link rel="stylesheet" href="styles.css" />
        

	<style>
    
        *{margin: 0; padding: 0;}
        body{background: #ecf1f4; font-family: sans-serif;}
        
        .form-wrap{ width: 500px; background: #8eebf6; padding: 20px 20px; box-sizing: border-box;position:absolute; top:250px;left:550px;}

        h1{text-align: center; color: #000606; font-weight: normal; margin-bottom: 20px;}
        
        input{width: 100%; background: none; border: 1px solid #fff; border-radius: 3px; padding: 6px 15px; box-sizing: border-box; margin-bottom: 20px; font-size: 16px; color: #000000;}
        
        input[type="submit"]{ background: #dde70f; border: 0; cursor: pointer; color: #dde70f;}

        input[type="submit"]:hover{ background: #dde70f  ; transition: .6s;}
        
        ::placeholder{color: #000000;}
    
    </style>
    </head>
    <body>

	<div class="form-wrap">	
		<form method="GET">
            
                <h1>YOUR INFORMATION</h1>
		<h2>PURCHASE DELIVERY ADDRESS</h2>
		<input type="text" placeholder="Social Status" required>
                <input type="text" placeholder="First Name" required>
                <input type="text" placeholder="Last Name" required>
                <input type="text" placeholder="Address Line 1" required>
                <input type="text" placeholder="Address Line 2" required>
                <input type="text" placeholder="City" required>
                <input type="text" placeholder="District" required>
                <input type="number" placeholder="Postal Code" required>
                <input type="number" placeholder="Telephone Number" required>
                <input type="email"  placeholder="Enter your email">
                
               
             
                
           		<button class="btn btn-primary btn-purchase" input type="submit"><a href="paymentgateway.jsp">PROCEED TO PAYMENTS</a></button>
          	   </form>
            
            
        
       
        </div>
        <footer class="main-footer">
            <div class="container main-footer-container">
                <h3 class="band-name">  </h3>
            </div>
        </footer>
    </body>
</html>