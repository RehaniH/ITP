<%@page import="com.nlhs.service.ItemsServiceImp"%>
<%@page import="com.nlhs.model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="bootstrap/jquery.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<title>Home Page</title>

 <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .img {
    position: relative;
    float: left;
    width:  100px;
    height: 100px;
    background-position: 50% 50%;
    background-repeat:   no-repeat;
    background-size:     cover;
}
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>
 <div class="jumbotron">
  <div class="container text-center">
    <h1>New Lanka Hardware Store</h1>      
    <p>Hardware merchants for 35+ years</p>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>
<% 	
		ArrayList<Item> ilist = new ArrayList<Item>() ;
    	//ilist = (ArrayList)session.getAttribute("ilist"); 
    		Item[] items = new Item[6];
    		int i=0;
    		
    			
    			ItemsServiceImp isi = new ItemsServiceImp();
    			ilist = isi.getHomePageItems();
        		
    		
    		
					for(Item item : ilist){
        			items[i] = item;
        			i++;
        			}
    		
    %>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">BEST DEAL</div>
        <div class="panel-body"><img src="productImages/<%= items[0].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div>
        <div class="panel-footer">
        <b><%=items[0].getpName() %></b>
        <br>
        <b><%=items[0].getpDesc() %></b>
        <br>
        <b>Now Its Just :RS <%= items[0].getSellingPrice() %>/=</b>
        <br>
        <button>Purchase</button>
<!--         <from action> -->
<%--         <input text="hidden" name="pid" value=<%=items[0].getPid() %>> --%>
<%--         <input text="hidden" name="cid" value=<%=session.getAttribute("UserName") %>> --%>
<!--         <button type="submit" value="Purchase" > -->
        
<!--         </from> -->
        
        </div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">BEST DEAL</div>
        <div class="panel-body"><img src="productImages/<%= items[1].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div>
        <div class="panel-footer">
        <b><%=items[1].getpName() %></b>
        <br>
        <b><%=items[1].getpDesc() %></b>
        <br>
        <b>Now Its Just :RS <%= items[1].getSellingPrice() %>/=</b>
        <br>
        <button>Purchase</button>
        </div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-success">
        <div class="panel-heading">BEST DEAL</div>
        <div class="panel-body"><img src="productImages/<%= items[2].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div>
        <div class="panel-footer">
        <b><%=items[2].getpName() %></b>
        <br>
        <b><%=items[2].getpDesc() %></b>
        <br>
        <b>Now Its Just :RS <%= items[2].getSellingPrice() %>/=</b>
        <br>
        <button>Purchase</button>
        </div>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">BEST DEAL</div>
        <div class="panel-body"><img src="productImages/<%= items[3].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div>
        <div class="panel-footer">
        <b><%=items[3].getpName() %></b>
        <br>
        <b><%=items[3].getpDesc() %></b>
        <br>
        <b>Now Its Just :RS <%= items[3].getSellingPrice() %>/=</b>
        <br>
        <button>Purchase</button>
        </div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">BEST DEAL</div>
        <div class="panel-body"><img src="productImages/<%= items[4].getpImage() %>"class="img-responsive" style="width:100%; height:100px"alt="Image"></div>
        <div class="panel-footer">
        <b><%=items[4].getpName() %></b>
        <br>
        <b><%=items[4].getpDesc() %></b>
        <br>
        <b>Now Its Just :RS <%= items[4].getSellingPrice() %>/=</b>
          <br>
        <button>Purchase</button>
        </div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">BEST DEAL</div>
        <div class="panel-body"><img src="productImages/<%= items[5].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div>
         <div class="panel-footer">
        <b><%=items[5].getpName() %></b>
        <br>
        <b><%=items[5].getpDesc() %></b>
        <br>
        <b>Now Its Just :RS <%= items[5].getSellingPrice() %>/=</b>
          <br>
        <button>Purchase</button>
        </div>
      </div>
    </div>
  </div>
</div><br><br>

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>  
  <form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
</footer>

</body>
</html>