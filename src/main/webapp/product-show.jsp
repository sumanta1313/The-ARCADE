<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="jakarta.servlet.http.HttpSession"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />

    <!-- Icon -->
    <link
      rel="stylesheet"
      href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
      
      <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <!-- icon -->

    <!-- Google fonts End -->

    <!-- custon style Sheet & JavaScript -->
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/shop.css" />
    <link rel="stylesheet" href="css/blog.css" />
    <link rel="stylesheet" href="css/product.css" />
    <link rel="stylesheet" href="css/contactus.css" />
    <link rel="stylesheet" href="css/about.css" />
    <script src="js/index.js" defer></script>
    <script src="js/product.js" defer></script>
  <!-- custon style Sheet & JavaScript -->
  <title>The Arcade Store</title>
  <!-- Adds icon to title -->
  <link rel="icon" href="image\title.png" type="image/x-icon" />
  <style>
  
  
      .product-details i:hover{
	  color:hsl(var(--clr-white));
    text-shadow: 0px 0px 15px #fff;
}
    
  .sub-pro p{
            text-wrap: wrap;
            margin-top: -12%;
            margin-left: 5%;
            
	 height:66px;
    overflow: hidden;           
    
    display: block;       
        }
        
        
          #pr{
           position:relative;
           left:-53%;
           margin-top:17.9%;
            font-size: 22px;
            color: #108800;
        }
        
         #qt{
            width: 40%;
            z-index: 5;
            margin-top: 5%;
            position:relative;
            left:3%;
            font-size: 15px;
        }
      
        
        
  
  
  
*{
    margin: 0;
    padding: 0;
    font-family: sans-serif;
    box-sizing: border-box;
}

.container{
    width: 100%;
}

:root {
	--yellow: #FFBD13;
	--blue: #4383FF;
	--blue-d-1: #3278FF;
	--light: #F5F5F5;
	--grey: #AAA;
	--white: #FFF;
	--shadow: 8px 8px 30px rgba(0,0,0,.05);
}


/* =================================================  Product section  =========================================================== */

#prodoct{
    padding-bottom: 30px;
    
}

.brands{
margin-top: 10%;
}

.wrapper{
    width: 90%;
    height: 100vh;
    /* grid-template-areas: 'one two' ; */
    display: flex;
    align-items: center;
    justify-content: space-evenly;
}

/* .wrapper :nth-child(1){ 
    grid-area: one;
}

.wrapper :nth-child(2){ 
    grid-area: two;
} */



.text{
    flex-basis: 45%;

}

.main-images img{
    
    width: 400px;
    height: 500px;
    margin-left: 25px;
    border-radius: 10px;
    transform: scale(1.4);
    object-fit: contain;
}

#secimg{
    width: 400px;
    height: 500px;
    margin-left: 25px;
    border-radius: 25px;
    
    object-fit: contain;
    transition: all 0.2s ease-in-out;
}


#sectxt{
    margin-left: -30%;
    margin-top: -30%;
}


p{
    margin-bottom: 12px;
}

.brand{
    background-color: #008000;
    width: fit-content;
    counter-reset: #fff;
    font-size: 12px;
    padding: 2px 5px;
}

h2{
    font-size: 35px;
    color: #555;
    margin-bottom:  20px;
}

.review{
    background-color: #008000;
    display: inline-block;
    color: #fff;
    padding: 4px;
    border-radius: 5px;
    font-size: 15px;
}

.review .uil{
    counter-reset: #fff;

}



.price{
    color: rgb(29,28,28);
    font-size: 26px;
    font-weight: bold;
    padding-top: 10px;
    padding-right: 10px;
}

.price-box{
    display: flex;
    align-items: center;
}

strike{
    color: rgb(160, 160, 160);
    
}

.buy{
    margin-top: 10%;
    margin-left: 15px;
}

.boton{
    border-radius: 35px;
    padding: 0.5rem 1rem 0.5rem 1rem;
    border: 0.1px none;
    font-weight: 900;
    transition: all 0.3s ease-in-out;
}

.boton:hover{
    transform: scale(1.1);
}

#plus:hover{
    background-color: hsl(var(--clr-red) / 0.6);
}



#minus:hover{
    background-color: hsl(var(--clr-yellow) / 0.6);
}

#input{
    width:25%;
    margin-bottom: 25px;
    border: 1px solid #ccc;
    font-weight: bold;
    text-align: center; 
    border-radius: 15px;
    margin-left: 5px;
    margin-right: 5px;
}

/* ========================================   Description section   ================================================ */



hr{
    width: 80%;
    margin-left: 10%;
}


/* ====================================  REVIEW SECTION  =============================== */



#rev {
    padding: 2em;
    text-align: center;
}

#rev h2 {
    margin-top: 1em;
    font-size: 3em;
    margin-bottom: 2em;
    animation: sco  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}

.review-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 2em;
}

.review-card {
    background: #fff;
    padding: 1.5em;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: left;
    transition: all 0.5s ease-in-out;
    animation: appry  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}

.review-card:hover{
    background: #c2c2c22a;
    transform: scale(1.03);
    box-shadow: 0 4px 18px rgba(0, 0, 0, 0.63);
}


.review-card img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-bottom: 1em;
    transition: all 0.5s ease-in-out;
    animation: sco  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}

.review-card img:hover {
    transform: scale(1.3);
}

.review-card h3 {
    font-size: 1.2em;
    margin-top: -3em;
    margin-bottom: 2em;
    margin-left: 5em;
    animation: appr  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}

.review-card p {
    font-size: 0.9em;
    color: #555;
    margin-bottom: 0.5em;
    animation: appear  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}

.review-card .stars {
    color: #f39c12;
    font-size: 1.1em;
    animation: appear  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}


/* ============================================ Comment Section ================================== */


.comm{
    margin-top: 5em;
	display: flex;
	justify-content: center;
    animation: appry  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}

.wap {
	background: var(--white);
	padding: 2rem;
	max-width: 576px;
	width: 100%;
	border-radius: .75rem;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.336);
	text-align: center;
    transition: all 0.5s ease-in-out;
}

.wap:hover{
    transform: scale(1.3);
    box-shadow: 0 0px 22px rgba(0, 0, 0, 0.452);
}


.wap h3 {
	font-size: 1.5rem;
	font-weight: 600;
	margin-bottom: 1rem;
    animation: sco  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}
.rating {
	display: flex;
	justify-content: center;
	align-items: center;
	grid-gap: .5rem;
	font-size: 2rem;
	color: var(--yellow);
	margin-bottom: 2rem;
    animation: sco  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}
.rating .star {
	cursor: pointer;
}
.rating .star.active {
	opacity: 0;
	animation: animate .5s calc(var(--i) * .1s) ease-in-out forwards;
}

@keyframes animate {
	0% {
		opacity: 0;
		transform: scale(1);
	}
	50% {
		opacity: 1;
		transform: scale(1.2);
	}
	100% {
		opacity: 1;
		transform: scale(1);
	}
}


.rating .star:hover {
	transform: scale(1.1);
}
textarea {
	width: 100%;
	background: var(--light);
	padding: 1rem;
	border-radius: .5rem;
	border: none;
	outline: none;
	resize: none;
	margin-bottom: .5rem;
    animation: sco  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}
.btn-group {
	display: flex;
	grid-gap: .5rem;
	align-items: center;
    animation: appear  ease-in-out;
    animation-timeline: view();
animation-range: entry 0% cover 40%;
}
.btn-group .btn {
	padding: .75rem 1rem;
	border-radius: .5rem;
	border: none;
	outline: none;
	cursor: pointer;
	font-size: .875rem;
	font-weight: 500;
}
.btn-group .btn.submit {
	background: var(--blue);
	color: var(--white);
}
.btn-group .btn.submit:hover {
	background: var(--blue-d-1);
}
.btn-group .btn.cancel {
	background: var(--white);
	color: var(--blue);
}
.btn-group .btn.cancel:hover {
	background: var(--light);
}







/* ==================================================   Media quaries   =================================================================== */


/* ==================================================   mobile   =================================================================== */


@media (max-width: 35em) {

.wrapper{
    /* grid-template-areas: 'one' 'two' ; */
    flex-direction: column;
}

    
    
    .product-box{
        width: 100%;
    }
    .main-images img{
        flex-direction: column;
        width: 230px;
        height: 290px;
        position: relative;
        left: 17%;
        margin-top: 45%;
        object-fit: cover;
        margin-bottom: 138%;   
    }

    .text{
        margin-top: -78%;
        /* position: relative;
        top: -20%; */
        font-size: 15px;
        margin-bottom: 30%;
    }
    .text h2{
        font-size: 30px;
    }
    .review{
        /* position: relative;
        top: -58px;
        left: 40%; */
    }
    .price-box{
       margin-bottom: 5%;
       font-size: 20px;
    }
    .buy{
        margin-left: 20px;
        
        
    }
.cart{
    margin-left: 15px;
}

.large-btn{
    font-size: 20px;
}

hr{
    margin-top: 25%;
}

.review-container {
    grid-template-columns: 1fr;
}

.wap{
    transform: scale(0.7);
}

.wap:hover{
    transform: scale(0.8);
}


#secimg{
    width: 230px;
    height: 290px;
    position: relative;
    left: 17%;
    
    transition: all 0.2s ease-in-out;
    margin-top: 30%;
    margin-bottom: 40%;   
    
}


#sectxt{
    margin-left: 1%;
    margin-top: -30%;
    
}

#sectxt h1{
    font-size: 2.5rem;
}


}





/* ==================================================   TAB   =================================================================== */

@media (min-width: 35em) and (max-width: 900px){

    .text{
        font-size: 12px;
        margin-bottom: 30%;
    }

    .text h2{
        font-size: 30px;
    }
   
    .price{
        font-size: 20px;
    }

#input{
    width: 30%;
}

    .buy{
            margin-left: 20px;
    }

.cart{
    margin-left: 10px;
}

.main-images img{
    flex-direction: column;
    width: 230px;
    height: 290px;
    position: relative;
    left: 6%;
    margin-top: 30%;
    margin-bottom: 38%;   
    object-fit: cover;
}


.buy{
    margin-top: 2%;
    
    
}
.cart{
    margin-top: 2%;
}


.review-container {
    grid-template-columns: repeat(2, 1fr);
}

.wrapper{
    /* grid-template-areas: 'one' 'two' ; */
    flex-direction: column;
}

#secimg{
    width: 300px;
    height: 400px;
    position: relative;
    left: 17%;
    
    transition: all 0.2s ease-in-out;
    margin-top: 13%;
    margin-bottom: 40%;   
    
}


#sectxt{
    margin-left: 1%;
    margin-top: -30%;
    
}

#sectxt h1{
    font-size: 3.3rem;
}

.wap{
    transform: scale(0.8);
}

.wap:hover{
    transform: scale(1);
}

}


/* ==================================================   Laptop   =================================================================== */

@media (min-width: 900px){

    .main-images{
        margin-top: -7%;
    }

    .price{
        font-size: 23px;
    }

 

    .buy{
        margin-right: -70%;
        
    }

   
    .cart{
        margin-left: 0%;
    }


    .review-container {
        grid-template-columns: repeat(3, 1fr);
    }

    
}
  
  </style>
  
  </head>
  <body class="home">


    <!-- ========================== Header Section ============================== -->

    <header class="primary-header container flex">
      <div class="header-inner-one flex">
          <div class="logo">
              <a href="index.jsp"><img src="image\logo.png.png" alt=""></a>
          </div>
          <button class="mobile-close-btn" data-visible="false" aria-controls="primary-navigation"><i class="uil uil-times-circle"></i></button>


          <nav>
              <ul id="primary-navigation" data-visible="false" class="primary-navigation flex">
                  <li><a class="fs-100 fs-montserrat bold-500" href="index.jsp">Home</a></li>
                  <li><a class="fs-100 fs-montserrat bold-500" href="shop.jsp">Shop</a></li>
                  <li><a class="fs-100 fs-montserrat bold-500" href="about.jsp">About</a></li>
                  <li><a class="fs-100 fs-montserrat bold-500" href="blog.jsp">Blog</a></li>
                  <li><a class="fs-100 fs-montserrat bold-500" href="contactus.jsp">Contact Us</a></li>
              </ul>
          </nav>
      </diV>


      <div class="header-login flex">
          
          <!-- ================================ Search ======================================== -->
          <div class="home-search text-black flex">
              
              <input type="text" placeholder="      search" class="srput fs-montserrat ">
                <div class="ok">
                    <!-- <i class="uil text-black uil-search"></i> -->
                </div>
          </div>


        <!-- ================================ user icon ======================================== -->
<!-- <a href="login.jsp"><button class="navbut bg-red text-white fs-100 fs-montserrat bold-500" style="text-decoration: none;" >login</button></a> -->

 	<%
		HttpSession s = request.getSession();
		String pname = (String)s.getAttribute("pname");	
		
		String uid = (String)s.getAttribute("uid");
			%>
			

          <!-- ================================ user icon ======================================== -->

            <i id="user-box" aria-controls="user-icon" class="uil uil-user-circle" onclick="togmenu()"></i>
            <div class="sub-menu-wrap" id="submenu">
                <div class="sub-menu">
                    <div class="user-info">
                        <img style="height: 60px; width: 60px; overflow: hidden; object-fit: cover;" src="Cimg_search?uid=<%=uid %>">
                        
                        <h2><%=pname%></h2>
                        	
                    </div>
                    <hr>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="#" class="sub-menu-link">
    <img src="image/profile.png">
    <p>Edit Profile</p>
    <span>></span>
</a>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="#" class="sub-menu-link">
    <img src="image/setting.png">
    <p>Settings & Privacy</p>
    <span>></span>
</a>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="contactus.jsp" class="sub-menu-link">
    <img src="image/help.png">
    <p>Help & Support</p>
    <span>></span>
</a>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="Logout" class="sub-menu-link">
    <img src="image/logout.png">
    <p>Log Out</p>
    <span>></span>
</a>


                </div>
            </div>
            <!-- ================================ cart icon ======================================== -->
            <div style="position: relative; display: inline-block; margin-bottom: 12px;">
            
            
            
            
            
            
             <%		
             
             int cc = 0;
             
             try {
             
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String un = "root";
			String pwd = "Binit.1234";
					
			Connection con = DriverManager.getConnection(databaseurl,un,pwd);
			String sql = "SELECT COUNT(uid) AS numpr FROM cart WHERE uid = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, uid);
			
			
			ResultSet rs = ps.executeQuery();
			
			 if (rs.next()) {
		            cc = rs.getInt("numpr");
		        }
		
   %>
            
            
            
            
            
            
            
   
        <i id="cart-box" aria-controls="cart-icon" class="uil uil-shopping-bag" onclick="togcart()" style="text-decoration: none;"></i><span class="cart-count" id="cartCount"><%=cc%></span>
        
        
        <% } catch (Exception e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        } %>
        
        
   
</div>


            <!-- ============= Cart Box ============ -->
            
         
            <div id="cart-icon" data-visible="false" class="cart-icon">
            
              
        </div>

        <div class="mobile-open-btn">
            <i class="uil uil-align-right"></i>
        </div>

  <div class="sub-cart-wrap" id="subcart" style="z-index:10;">
          <div class="sub-cart">
              <div class="cart-info">
                  <h3>Shopping Cart</h3>                  
              </div>
              <hr>
              
              
   <%		
		

		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String un = "root";
			String pwd = "Binit.1234";
					
			Connection con = DriverManager.getConnection(databaseurl,un,pwd);
			String sql = "select * from cart where uid=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, uid);
			
			ResultSet rs = ps.executeQuery();
			
			
			 int counter = 0;		        	

			
			while(rs.next() && counter < 2)
			{
				
				counter++;
   %>
 <!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href='product-show.jsp?pid=<%= rs.getString("pid") %>' class="sub-pro">
    <img src="File_search?pid=<%=rs.getString("pid") %>" >
    <p class="fs-200"><%=rs.getString("pdname") %></p>
    <span id="qt"><b>Qty : </b><%=rs.getString("quantity") %></span>
    <span id='pr'>&#8377;<%=rs.getString("pdprice") %></span>
</a>
<hr>
			<%
			
			}			
		}
		catch(Exception e)
		{
			
		}
	%>
			<div class="carb">
           <a href="cart.jsp"  style="text-decoration: none; margin-left:10%;"><button class="navbut bg-red text-white fs-100 fs-montserrat bold-500" style="text-decoration: none; transform:scale(0.8); " >Cart</button> </a>
          </div>
          </div>
      </div>

        
       </div>

        
  </header>

  <!-- ======================== End header section ================================ -->



<!-- ======================== product section ================================ -->
<section id="product">
<form action="Addtocart">

<%
    String pid = request.getParameter("pid"); 

    String DB_URL = "jdbc:mysql://localhost:3306/user";
    String DB_USER = "root";
    String DB_PASSWORD = "Binit.1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        PreparedStatement pst = connection.prepareStatement("select * from product where pid = ?");
        pst.setString(1, pid);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) { 
%>










    <div class="container">
        <div class="wrapper grid">
            <div class="product-box">
                
                    <div class="main-images">
                        <img id="mainImage" src='File_search?pid=<%= rs.getString("pid") %>'>
                    </div>
                
            </div>
            <div class="text">
                <div class="content">
                    <h2><%= rs.getString("pdname") %><input type="hidden" name='pid' value='<%=rs.getString("pid")%>'><input type="hidden" name='pdname' value='<%=rs.getString("pdname")%>'></h2>
                    <div class="review">
                        <span>(4.6)</span>
                        <span class="uil uil-star"></span>
                    </div>
                    <div class="price-box">
                        <p class="price">&#8377; <%= rs.getString("pdprice") %><input type="hidden" name='pdprice' value='<%=rs.getString("pdprice")%>'></p>
                        <strike>&#8377; 79,990</strike>
                    </div>
                    <p>
                        <b class="b">Colors:</b>
                        <select style="border-radius: 20px;" name="size">
                            <option value="select colour">Select Colour</option>
                            <option value="black">Black</option>
                            <option value="blue">Blue</option>
                            <option value="green">White</option>
                        </select>
                    </p>
                    <p><b class="b">Quantity:</b>
                        <div>
                            <button class="boton" id="minus">-</button>
                            <input type="number" value="1" name='quantity' id="input"  >
                            <button class="boton" id="plus">+</button>
                        </div>
                    </p>
                    <button class="cart large-btn bg-red bold-800 text-white">
                        <span class="uil uil-shopping-cart"><input  style="border: none; cursor: pointer;" class="fs-montserat bg-red bold-800 text-white" type="submit" value="  Add to Cart"></span>
                    </button>
                    <button class="buy large-btn bg-yellow bold-800 text-white">
                        <span class="uil uil-shopping-bag"></span> Buy now
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
</section>



<!-- ======================== End product section ================================ -->

<hr>

<!-- =========================== Description section ================================ -->



<section class="about-section grid" id="desc"> 
  <div>
    <img  id="secimg" src='File_search?pid=<%= rs.getString("pid") %>'>
  </div>
      <div class="about-info" id="sectxt">
        <br><br>
       <h1 class="fs-montserrat fs-500 text-black ">About this item-</h1>
<p class="fs-montserrat fs-100">
<%=rs.getString("pddetails") %>
</p> 
</div>
</section>


<%
        } else {
            out.println("<p>Product not found.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!-- ======================== End of Description section ================================ -->


<hr>


<!-- ======================== Review section ================================ -->





<section id="rev">
  <h2 class="fs-montserrat">Customer Says</h2>
  <div class="review-container">
      <div class="review-card">
          <img src="image/user.png" alt="User 1">
          <h3>Touseeq Ijaz</h3>
          <p>GOOD !</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem, quaerat quis?</p>
          <div class="stars">&#9734 &#9734 &#9734 &#9734</div>
      </div>
      <div class="review-card">
          <img src="image/user.png" alt="User 2">
          <h3>J.K Rowling</h3>
          <p>BEST !</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem, quaerat quis?</p>
          <div class="stars">&#9734 &#9734 &#9734 &#9734 &#9734</div>
      </div>
      <div class="review-card">
          <img src="image/user.png" alt="User 3">
          <h3>Harry Potter</h3>
          <p>AVERAGE !</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem, quaerat quis?</p>
          <div class="stars">&#9734 &#9734 &#9734</div>
      </div>
      <div class="review-card">
          <img src="image/user.png" alt="User 4">
          <h3>Oliva</h3>
          <p>NOT GOOD !</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem, quaerat quis?</p>
          <div class="stars">&#9734 &#9734</div>
      </div>
  </div>
</section>






<!-- ======================== End of Review section ================================ -->


<hr>


<!-- ======================== Review Comment section ================================ -->


<section class="comm">

<div class="wap">
  <h3>Leave Your review.</h3>
  <form action="#">
    <div class="rating">
      <input type="number" name="rating" hidden>
      <i class='bx bx-star star' style="--i: 0;"></i>
      <i class='bx bx-star star' style="--i: 1;"></i>
      <i class='bx bx-star star' style="--i: 2;"></i>
      <i class='bx bx-star star' style="--i: 3;"></i>
      <i class='bx bx-star star' style="--i: 4;"></i>
    </div>
    <textarea name="opinion" cols="30" rows="5" placeholder="Your opinion..."></textarea>
    <div class="btn-group">
      <button type="submit" class="btn submit">Submit</button>
      <button class="btn cancel">Cancel</button>
    </div>
  </form>
</div>

</section>



<!-- ======================== End of Review comment section ================================ -->



    <!-- ========================= Brand Section ========================== -->

    <section class="brands grid">
      <div>
          <img src="image/br-1.png">
      </div>
      <div>
          <img src="image/br-2.png">
      </div>
      <div>
          <img src="image/br-3.png">
      </div>
      <div>
          <img src="image/br-4.png">
      </div>
      <div>
          <img src="image/br-5.png">
      </div>
      <div>
          <img src="image/br-6.png">
      </div>
    </section>
    
    <!-- ========================= End of Brand Section ========================== -->
    
    
    <!-- ========================= footer Section ========================== -->
    
    <section class="footer grid">
      <div class="footer-logo grid">
        <a href="index.jsp"><img src="image\logo.png.png" alt="" id="log"></a>
                <p class="fs-montserrat fs-100"> Connect with us</p>
                    <div class="social-media flex">
                        <i class="uil uil-facebook-f"></i>
                        <i class="uil uil-instagram"></i>
                        <i class="uil uil-twitter"></i>
                        <i class="uil uil-linkedin"></i>
                        <i class="uil uil-telegram"></i>
                        <i class="uil uil-github"></i>
                    </div>
        </div>
            <div class="footer-menu grid">
                 <h3> Quick Links </h3>
                 <ul>
                    <li><a class="fs-montserrat text-black fs-100" href="index.jsp">Home</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="shop.jsp">Shop</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="about.jsp">About</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="blog.jsp">Blogs</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="contactus.jsp">Contact</a></li>
                 </ul>
            </div> 
            <div class="contact grid">
                <h3 class="fs-poppins fs-200 bold-800">Contact</h3>
                <p class="fs-montserrat">+99 (0) 101 0000 888 ______________________ 40 , cross road , jhilbagan , dumdum , kolkata - 7000030 , west bengal , india</p>
            </div>
            <div class="emails grid">
            <h3 class="fs-poppins fs-200 bold-800"> Subscribe and connect </h3>
            <p class="updates fs-poppins fs-300 bold-800"> For latest News & updates </p>
            
            <div class="inputfield flex bg-gray"> 
            <input type="email" placeholder="Enter Your Email" class="fs-montserrat bg-gray">
                <button class="bg-red text-white fs-poppins fs-50"> Subscribe </button>
            </div>
            </div>
    </section>
    <!-- ========================= End of footer Section ========================== -->
    
    <!-- ========================= Copyright Section ========================== -->
    
    <section class="copyright">
        <!-- <p class="c-font fs-montserrat fs-100">2024 Store. All rights reserved </p> -->
        <p class="fs-montserrat fs-100 text-align p-top">&#169 Privacy Policy reserved to The Arcade Team 2024. Terms & Conditions applied. </p>
        </section>
    <!-- ========================= End of Copyright Section ========================== -->
   
   
  </body>
</html>

