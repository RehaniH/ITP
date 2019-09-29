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
 <link rel="stylesheet" href="css/stylesNis.css" />
        <script src="js/store.js" async></script>
<script src="bootstrap/jquery.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<title>Paints Page</title>

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
<%if(session.getAttribute("UserName") == null){
	  request.getRequestDispatcher("index.jsp").include(request, response);  
  } %>
  <% String userEmail = (String)session.getAttribute("UserName"); %>
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
        <li class="active"><a href="homePage.jsp">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
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
    			ilist = isi.getPaintsPageItems();
        		
    		
    		
					for(Item item : ilist){
        			items[i] = item;
        			i++;
        			}
    		
    %>
    
      <section class="container content-section">
            <h2 class="section-header">Best Selling Paints And Brushes Products</h2>
            
            <div class="shop-items">
                <div class="shop-item">
                    <span class="shop-item-title"><%=items[0].getpName() %></span>
                     <span class="shop-item-title"><%=items[0].getpDesc() %></span>
                    <img class="shop-item-image" src="productImages/<%=items[0].getpImage() %>">
                    <div class="shop-item-details">
                    	<br>
                        <span class="shop-item-price">Rs:<%=items[0].getSellingPrice() %><br></span>
                        <br>
                    </div>
                    <div>
                    <form method="post" action="./AddCartServlet">
                    	 Quantity (between 1 and 5): <input type="text" name="quantity" min="1" max="5">
                    	 <input type="hidden" name="pId" value="<%=items[0].getPid() %>">
                    	 <input type="hidden" name="pName" value="<%=items[0].getpName() %>">
                    	 <input type="hidden" name="pImage" value="<%=items[0].getpImage() %>">
                    	 <input type="hidden" name="sellingPrice" value="<%=items[0].getSellingPrice()%>">
                    	 <input type="hidden" name="uEmail" value="<%=userEmail%>" >
                    	 
                    	 <br>
                        <button class="btn btn-primary shop-item-button" type="submit">ADD TO CART</button>
                        </form>
                    </div>
                </div>
                
               <div class="shop-item">
                    <span class="shop-item-title"><%=items[1].getpName() %></span>
                     <span class="shop-item-title"><%=items[1].getpDesc() %></span>
                    <img class="shop-item-image" src="productImages/<%=items[1].getpImage() %>">
                    <div class="shop-item-details">
                    	<br>
                        <span class="shop-item-price">Rs:<%=items[1].getSellingPrice() %><br></span>
                        <br>
                    </div>
                    <div>
                    <form method="post" action="./AddCartServlet">
                    	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5">
                    	 <input type="hidden" name="pId" value="<%=items[1].getPid() %>">
                    	 <input type="hidden" name="pName" value="<%=items[1].getpName() %>">
                    	 <input type="hidden" name="pImage" value="<%=items[1].getpImage() %>">
                    	 <input type="hidden" name="sellingPrice" value="<%=items[1].getSellingPrice()%>">
                    	 <input type="hidden" name="uEmail" value=<%=userEmail%> >
                    	 
                    	 <br>
                        <button class="btn btn-primary shop-item-button" type="submit">ADD TO CART</button>
                        </form>
                    </div>
                </div>
                
             <div class="shop-item">
                    <span class="shop-item-title"><%=items[2].getpName() %></span>
                     <span class="shop-item-title"><%=items[2].getpDesc() %></span>
                    <img class="shop-item-image" src="productImages/<%=items[2].getpImage() %>">
                    <div class="shop-item-details">
                    	<br>
                        <span class="shop-item-price">Rs:<%=items[2].getSellingPrice() %><br></span>
                        <br>
                    </div>
                    <div>
                    <form method="post" action="./AddCartServlet">
                    	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5">
                    	 <input type="hidden" name="pId" value="<%=items[2].getPid() %>">
                    	 <input type="hidden" name="pName" value="<%=items[2].getpName() %>">
                    	 <input type="hidden" name="pImage" value="<%=items[2].getpImage() %>">
                    	 <input type="hidden" name="sellingPrice" value="<%=items[2].getSellingPrice()%>">
                    	 <input type="hidden" name="uEmail" value="<%=userEmail%>" >
                    	 
                    	 <br>
                        <button class="btn btn-primary shop-item-button" type="submit">ADD TO CART</button>
                        </form>
                    </div>
                </div>
                
               <div class="shop-item">
                    <span class="shop-item-title"><%=items[3].getpName() %></span>
                     <span class="shop-item-title"><%=items[0].getpDesc() %></span>
                    <img class="shop-item-image" src="productImages/<%=items[3].getpImage() %>">
                    <div class="shop-item-details">
                    	<br>
                        <span class="shop-item-price">Rs:<%=items[3].getSellingPrice() %><br></span>
                        <br>
                    </div>
                    <div>
                    <form method="post" action="./AddCartServlet">
                    	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5">
                    	 <input type="hidden" name="pId" value="<%=items[3].getPid() %>">
                    	 <input type="hidden" name="pName" value="<%=items[3].getpName() %>">
                    	 <input type="hidden" name="pImage" value="<%=items[3].getpImage() %>">
                    	 <input type="hidden" name="sellingPrice" value="<%=items[3].getSellingPrice()%>">
                    	 <input type="hidden" name="uEmail" value="<%=userEmail%>">
                    	 
                    	 <br>
                        <button class="btn btn-primary shop-item-button" type="submit">ADD TO CART</button>
                        </form>
                    </div>
                </div>
                

	<div class="shop-item">
                    <span class="shop-item-title"><%=items[4].getpName() %></span>
                     <span class="shop-item-title"><%=items[4].getpDesc() %></span>
                    <img class="shop-item-image" src="productImages/<%=items[4].getpImage() %>">
                    <div class="shop-item-details">
                    	<br>
                        <span class="shop-item-price">Rs:<%=items[4].getSellingPrice() %><br></span>
                        <br>
                    </div>
                    <div>
                    <form method="post"./AddCartServlet">
                    	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5">
                    	 <input type="hidden" name="pId" value="<%=items[4].getPid() %>">
                    	 <input type="hidden" name="pName" value="<%=items[4].getpName() %>">
                    	 <input type="hidden" name="pImage" value="<%=items[4].getpImage() %>">
                    	 <input type="hidden" name="sellingPrice" value="<%=items[4].getSellingPrice()%>">
                    	 <input type="hidden" name="uEmail" value="<%=userEmail%>" >
                    	 
                    	 <br>
                        <button class="btn btn-primary shop-item-button" type="submit">ADD TO CART</button>
                        </form>
                    </div>
                </div>
                
                
		<div class="shop-item">
                    <span class="shop-item-title"><%=items[5].getpName() %></span>
                     <span class="shop-item-title"><%=items[5].getpDesc() %></span>
                    <img class="shop-item-image" src="productImages/<%=items[5].getpImage() %>">
                    <div class="shop-item-details">
                    	<br>
                        <span class="shop-item-price">Rs:<%=items[5].getSellingPrice() %><br></span>
                        <br>
                    </div>
                    <div>
                    <form method="post" action="./AddCartServlet">
                    	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5">
                    	 <input type="hidden" name="pId" value="<%=items[5].getPid() %>">
                    	 <input type="hidden" name="pName" value="<%=items[5].getpName() %>">
                    	 <input type="hidden" name="pImage" value="<%=items[5].getpImage() %>">
                    	 <input type="hidden" name="sellingPrice" value="<%=items[5].getSellingPrice()%>">
                    	 <input type="hidden" name="uEmail" value="<%=userEmail%>" >
                    	 
                    	 <br>
                        <button class="btn btn-primary shop-item-button" type="submit">ADD TO CART</button>
                        </form>
                    </div>
                </div>
                
<!-- 	<div class="shop-item"> -->
<%--                     <span class="shop-item-title"><%=items[0].getpName() %></span> --%>
<%--                      <span class="shop-item-title"><%=items[0].getpDesc() %></span> --%>
<%--                     <img class="shop-item-image" src="productImages/<%=items[0].getpImage() %>"> --%>
<!--                     <div class="shop-item-details"> -->
<!--                     	<br> -->
<%--                         <span class="shop-item-price">Rs:<%=items[0].getSellingPrice() %><br></span> --%>
<!--                         <br> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                     <form method="post" action="./CartServlet"> -->
<!--                     	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5"> -->
<%--                     	 <input type="hidden" name="pId" value="<%=items[0].getPid() %>"> --%>
<%--                     	 <input type="hidden" name="pName" value="<%=items[0].getpName() %>"> --%>
<%--                     	 <input type="hidden" name="pImage" value="<%=items[0].getpImage() %>"> --%>
<%--                     	 <input type="hidden" name="sellingPrice" value=<%=items[0].getpImage()%>> --%>
<%--                     	 <input type="hidden" name="uEmail" value="<%=userEmail%>" > --%>
                    	 
<!--                     	 <br> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
                
<!--            <div class="shop-item"> -->
<%--                     <span class="shop-item-title"><%=items[0].getpName() %></span> --%>
<%--                      <span class="shop-item-title"><%=items[0].getpDesc() %></span> --%>
<%--                     <img class="shop-item-image" src="productImages/<%=items[0].getpImage() %>"> --%>
<!--                     <div class="shop-item-details"> -->
<!--                     	<br> -->
<%--                         <span class="shop-item-price">Rs:<%=items[0].getSellingPrice() %><br></span> --%>
<!--                         <br> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                     <form method="post" action="./CartServlet"> -->
<!--                     	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5"> -->
<%--                     	 <input type="hidden" name="pId" value="<%=items[0].getPid() %>"> --%>
<%--                     	 <input type="hidden" name="pName" value="<%=items[0].getpName() %>"> --%>
<%--                     	 <input type="hidden" name="pImage" value="<%=items[0].getpImage() %>"> --%>
<%--                     	 <input type="hidden" name="sellingPrice" value=<%=items[0].getpImage()%>> --%>
<%--                     	 <input type="hidden" name="uEmail" value="<%=userEmail%>" > --%>
                    	 
<!--                     	 <br> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
                
<!-- 	<div class="shop-item"> -->
<%--                     <span class="shop-item-title"><%=items[0].getpName() %></span> --%>
<%--                      <span class="shop-item-title"><%=items[0].getpDesc() %></span> --%>
<%--                     <img class="shop-item-image" src="productImages/<%=items[0].getpImage() %>"> --%>
<!--                     <div class="shop-item-details"> -->
<!--                     	<br> -->
<%--                         <span class="shop-item-price">Rs:<%=items[0].getSellingPrice() %><br></span> --%>
<!--                         <br> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                     <form method="post" action="./CartServlet"> -->
<!--                     	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5"> -->
<%--                     	 <input type="hidden" name="pId" value="<%=items[0].getPid() %>"> --%>
<%--                     	 <input type="hidden" name="pName" value="<%=items[0].getpName() %>"> --%>
<%--                     	 <input type="hidden" name="pImage" value="<%=items[0].getpImage() %>"> --%>
<%--                     	 <input type="hidden" name="sellingPrice" value=<%=items[0].getpImage()%>> --%>
<%--                     	 <input type="hidden" name="uEmail" value="<%=userEmail%>" > --%>
                    	 
<!--                     	 <br> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
                
<!-- 		<div class="shop-item"> -->
<%--                     <span class="shop-item-title"><%=items[0].getpName() %></span> --%>
<%--                      <span class="shop-item-title"><%=items[0].getpDesc() %></span> --%>
<%--                     <img class="shop-item-image" src="productImages/<%=items[0].getpImage() %>"> --%>
<!--                     <div class="shop-item-details"> -->
<!--                     	<br> -->
<%--                         <span class="shop-item-price">Rs:<%=items[0].getSellingPrice() %><br></span> --%>
<!--                         <br> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                     <form method="post" action="./CartServlet"> -->
<!--                     	 Quantity (between 1 and 5): <input type="number" name="quantity" min="1" max="5"> -->
<%--                     	 <input type="hidden" name="pId" value="<%=items[0].getPid() %>"> --%>
<%--                     	 <input type="hidden" name="pName" value="<%=items[0].getpName() %>"> --%>
<%--                     	 <input type="hidden" name="pImage" value="<%=items[0].getpImage() %>"> --%>
<%--                     	 <input type="hidden" name="sellingPrice" value=<%=items[0].getpImage()%>> --%>
<%--                     	 <input type="hidden" name="uEmail" value="<%=userEmail%>" > --%>
                    	 
<!--                     	 <br> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
                
<!--     	</div>  -->

<!--         </section> -->
<!--         <section class="container content-section"> -->
<!--             <h2 class="section-header">Circuit Breakers</h2> -->
<!--             <div class="shop-items"> -->
<!--                 <div class="shop-item"> -->
<!--                     <span class="shop-item-title">RCD SIGMA 2 POLE 40A 30MA</span> -->
<!--                     <img class="shop-item-image" src="Pics\11.jpg"> -->
<!--                     <div class="shop-item-details"> -->
<!--                         <span class="shop-item-price">Rs:3630.00</span> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="shop-item"> -->
<!--                     <span class="shop-item-title">RCD SIGMA 2 POLE 63A 30MA</span> -->
<!--                     <img class="shop-item-image" src="Pics\12.jpg"> -->
<!--                     <div class="shop-item-details"> -->
<!--                         <span class="shop-item-price">Rs:4150.00</span> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                     </div> -->
<!--                 </div> -->
<!-- 		<div class="shop-item"> -->
<!--                     <span class="shop-item-title">RCD SIGMA4 POLE 40A 30MA</span> -->
<!--                     <img class="shop-item-image" src="Pics\13.jpg"> -->
<!--                     <div class="shop-item-details"> -->
<!--                         <span class="shop-item-price">Rs:5505.00</span> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                     </div> -->
<!--                 </div> -->
<!-- 		<div class="shop-item"> -->
<!--                     <span class="shop-item-title">RCD SIGMA4 POLE 40A 100MA</span> -->
<!--                     <img class="shop-item-image" src="Pics\14.jpg"> -->
<!--                     <div class="shop-item-details"> -->
<!--                         <span class="shop-item-price">Rs:5720.00</span> -->
<!--                         <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
        </section>
<!--         <section class="container content-section"> -->
<!--  <h2 class="section-header">CART</h2> -->
<!--             <div class="cart-row"> -->
<!--                 <span class="cart-item cart-header cart-column">ITEM</span> -->
<!--                 <span class="cart-price cart-header cart-column">PRICE</span> -->
<!--                 <span class="cart-quantity cart-header cart-column">QUANTITY</span> -->
<!--             </div> -->
<!--             <div class="cart-items"> -->
<!--             </div> -->
<!--             <div class="cart-total"> -->
<!--                 <strong class="cart-total-title">Total</strong> -->
<!--                 <span class="cart-total-price">Rs0</span> -->
<!--             </div> -->
            
<!--            <form action="PurchaseDeliveryAddress.jsp" method="GET"> -->
<%--            <input type="hidden" value=<%= %>> --%>
<!--             <button class="btn btn-primary btn-purchase" input type="submit">PURCHASE</button> -->
<!--            </form> -->
        
<!--         </section> -->

<!-- <div class="container">     -->
<!--   <div class="row"> -->
<!--     <div class="col-sm-4"> -->
<!--       <div class="panel panel-primary"> -->
<!--         <div class="panel-heading">BEST DEAL</div> -->
<%--         <div class="panel-body"><img src="productImages/<%= items[0].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div> --%>
<!--         <div class="panel-footer"> -->
<%--         <b><%=items[0].getpName() %></b> --%>
<!--         <br> -->
<%--         <b><%=items[0].getpDesc() %></b> --%>
<!--         <br> -->
<%--         <b>Now Its Just :RS <%= items[0].getSellingPrice() %>/=</b> --%>
<!--         <br> -->
<!--         <button>Purchase</button> -->
<!-- <!--         <from action> --> 
<%-- <%--         <input text="hidden" name="pid" value=<%=items[0].getPid() %>> --%> 
<%-- <%--         <input text="hidden" name="cid" value=<%=session.getAttribute("UserName") %>> --%> 
<!-- <!--         <button type="submit" value="Purchase" > --> 
        
<!-- <!--         </from> --> 
        
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--     <div class="col-sm-4">  -->
<!--       <div class="panel panel-danger"> -->
<!--         <div class="panel-heading">BEST DEAL</div> -->
<%--         <div class="panel-body"><img src="productImages/<%= items[1].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div> --%>
<!--         <div class="panel-footer"> -->
<%--         <b><%=items[1].getpName() %></b> --%>
<!--         <br> -->
<%--         <b><%=items[1].getpDesc() %></b> --%>
<!--         <br> -->
<%--         <b>Now Its Just :RS <%= items[1].getSellingPrice() %>/=</b> --%>
<!--         <br> -->
<!--         <button>Purchase</button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--     <div class="col-sm-4">  -->
<!--       <div class="panel panel-success"> -->
<!--         <div class="panel-heading">BEST DEAL</div> -->
<%--         <div class="panel-body"><img src="productImages/<%= items[2].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div> --%>
<!--         <div class="panel-footer"> -->
<%--         <b><%=items[2].getpName() %></b> --%>
<!--         <br> -->
<%--         <b><%=items[2].getpDesc() %></b> --%>
<!--         <br> -->
<%--         <b>Now Its Just :RS <%= items[2].getSellingPrice() %>/=</b> --%>
<!--         <br> -->
<!--         <button>Purchase</button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div><br> -->

<!-- <div class="container">     -->
<!--   <div class="row"> -->
<!--     <div class="col-sm-4"> -->
<!--       <div class="panel panel-primary"> -->
<!--         <div class="panel-heading">BEST DEAL</div> -->
<%--         <div class="panel-body"><img src="productImages/<%= items[3].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div> --%>
<!--         <div class="panel-footer"> -->
<%--         <b><%=items[3].getpName() %></b> --%>
<!--         <br> -->
<%--         <b><%=items[3].getpDesc() %></b> --%>
<!--         <br> -->
<%--         <b>Now Its Just :RS <%= items[3].getSellingPrice() %>/=</b> --%>
<!--         <br> -->
<!--         <button>Purchase</button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--     <div class="col-sm-4">  -->
<!--       <div class="panel panel-primary"> -->
<!--         <div class="panel-heading">BEST DEAL</div> -->
<%--         <div class="panel-body"><img src="productImages/<%= items[4].getpImage() %>"class="img-responsive" style="width:100%; height:100px"alt="Image"></div> --%>
<!--         <div class="panel-footer"> -->
<%--         <b><%=items[4].getpName() %></b> --%>
<!--         <br> -->
<%--         <b><%=items[4].getpDesc() %></b> --%>
<!--         <br> -->
<%--         <b>Now Its Just :RS <%= items[4].getSellingPrice() %>/=</b> --%>
<!--           <br> -->
<!--         <button>Purchase</button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--     <div class="col-sm-4">  -->
<!--       <div class="panel panel-primary"> -->
<!--         <div class="panel-heading">BEST DEAL</div> -->
<%--         <div class="panel-body"><img src="productImages/<%= items[5].getpImage() %>" class="img-responsive" style="width:100%; height:100px " alt="Image"></div> --%>
<!--          <div class="panel-footer"> -->
<%--         <b><%=items[5].getpName() %></b> --%>
<!--         <br> -->
<%--         <b><%=items[5].getpDesc() %></b> --%>
<!--         <br> -->
<%--         <b>Now Its Just :RS <%= items[5].getSellingPrice() %>/=</b> --%>
<!--           <br> -->
<!--         <button>Purchase</button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div><br><br> -->

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>  
  <form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
</footer>

</body>
</html>