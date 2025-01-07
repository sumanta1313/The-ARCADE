<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="jakarta.servlet.http.HttpSession"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
    />
    <!-- icon -->

    <!-- Google fonts End -->

    <!-- custon style Sheet & JavaScript -->
    <link rel="stylesheet" href="css/shop.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/about.css" />
    <link rel="stylesheet" href="css/blog.css" />
    <link rel="stylesheet" href="css/product.css" />
    <link rel="stylesheet" href="css/contactus.css" />
    <link rel="stylesheet" href="css/cart.css" />
    <script src="js/index.js" defer></script>
    <script src="js/shop.js" defer></script>
    <script src="js/product.js" defer></script>
    <!-- custon style Sheet & JavaScript -->
    <title>The Arcade Store</title>
    <!-- Adds icon to title -->
    <link rel="icon" href="image\title.png" type="image/x-icon" />
    
    
    
    
    
    
    
    
    <style>
    
    @charset "UTF-8";
    
    
#cart{
    margin-top: 30px;
	margin-bottom: 12%;
	z-index: 10;
}



.box {
	display: flex;
	width: 75%;
	height: 250px;
	overflow: hidden;
	margin-bottom: 20px;
	margin-left: 13%;
	margin-right: 15%;
    backdrop-filter: blur(20px);
	transition: all 0.6s ease;
	box-shadow: rgba(0, 0, 0, 0.397) 0px 0px 12px;
    border-radius: 25px;
}




.box:hover {
	box-shadow: rgba(0, 0, 0, 0.70) 0px 0px 20px;
    border-radius: 25px;
	transform: scale(1.03);
}
.box img {
	object-fit:cover;
    height:353px;
    width:700px;
    margin-left:10%;
    
    border-radius: 30px;
	
}
.content {
	padding: 20px;
	width: 100%;
	margin-left:10%;
	
}
.content h3 {
	margin-bottom: 30px;
}
.content h4 {
	margin-bottom: 50px;
}

.content h4 span{
color:#85BB65;
}

.btn-area {
	position: absolute;
	bottom: 33px;
	right: -23%;
	width:30%;
	padding: 10px 25px;
	background-color: hsl(var(--clr-yellow));
	color: white;
	cursor: pointer;
	border:none;
	outline:none;
	border-radius: 5px;
    transition: all 0.5s ease;
}



        a {
    text-decoration: none !important;
}

i {
    text-decoration: none !important;
}



.btn {
	position: absolute;
	bottom: 45%;
	right: -23%;
	width:30%;
	padding: 10px 25px;
	background-color: hsl(var(--clr-red) / 0.8);
	color: white;
	cursor: pointer;
	border-radius: 5px;
	border:none;
	outline:none;
    transition: all 0.5s ease;
}


#pt{
	position: relative;
	top:-40%;
	font-family: montserat;
	font-weight:600;
	
}


.btn:hover {
	background-color:#727171;
	
	text-shadow: 0 0 15px #fff;
	box-shadow: inset 0 0 15px #353535;
    border-radius: 35px;
}

.btn-area:hover {
	background-color:hsl(var(--clr-red));
	text-shadow: 0 0 12px #fff;
	box-shadow: inset 0 0 10px #353535;
    border-radius: 35px;
}
.unit input {
	width: 30%;
	padding: 5px;
	text-align: center;
    border-radius: 25px;
    border-width:1px;
     background-color: hsl(var(--clr-very-light-gray)); 
}
.btn-area i {
	margin-right: 5px;
}
.right-bar {
	flex: 25%;
	margin-left: 18%;
	margin-right: 18%;
	width: 65%;
	padding: 20px;
	height: 460px;
	border-radius: 5px;
	box-shadow: rgba(39, 39, 39, 0.637) 0px 0px 16px 0px;
    border-radius: 25px;
    backdrop-filter: blur(20px);
    
}
.right-bar hr {
	margin-bottom: 25px;
}
.right-bar p {
	display: flex;
	justify-content: space-between;
	margin-bottom: 30px;
	font-size: 20px;
}
.right-bar a {
	background-color: hsl(var(--clr-red) / 0.8);
	color: #fff;
	text-decoration: none;
	display: block;
	text-align: center;
	height: 40px;
	line-height: 40px;
	font-weight: 900;
    transition: all 0.4s ease-in-out;
    border-radius:25px;
}
.right-bar i {
	margin-right: 15px;
}

#home{
    background-color: hsl(var(--clr-yellow));
    
	margin-top:8%;
	
}

.right-bar a:hover {
	backdrop-filter:blur(25px);
	background-color: hsl(var(--clr-green) );
    box-shadow: inset 0 0 10px #353535;
    border-radius: 45px;
}

#home:hover{
    background-color: hsl(var(--clr-blue) / 0.7);
}

@media screen and (max-width: 700px) {
	
	.content{
	margin-top:-17px;
	margin-left:3.6%;
	}

	.content h3 {
		margin-bottom: 15px;
		font-size:15px;
		height:18%;
    overflow: hidden;           
    text-overflow: ellipsis;    
    display: block;
	}
	.content h4 {
		margin-bottom: 20px;
	}
	.btn2 {
		display: none;
	}
	.box {
		height: 175px;
	}
	.box img {
		height: 247px;
		width: 375px;
		margin-left:7%;
		
	}
    .btn-area {
        padding-left:5%;
        transform:scale(0.65);
        width:42%;
        margin-top:7px;
        margin-right:-15%;
    }

.btn{
padding-left:6.6%;
margin-bottom:7px;
width:42%;
transform:scale(0.65);
margin-right:-15%;
}

    .unit input{
        width: 20%;
    }
    #cart{
        margin-top: 8%;
        margin-bottom: 3%;
    }
    
    #home{
	margin-top:-2%;
	margin-bottom: 5%;
	}
	
	.right-bar {
position:relative;
left:1%;
	}
	
	.right-bar hr{
	margin-top:0%;
	}
	
	
	
}
@media  (max-width: 900px) {
	.project {
		flex-direction: column;
	}
	.right-bar {
		margin-left: 18.1%;
		margin-bottom: 20px;
	}
	
	#home{
	margin-top:12%;
	margin-bottom: 12%;
	}
	
	
	.content h3 {
		margin-bottom: 15px;
		font-size:15px;
		height:20%;
    overflow: hidden;           
    text-overflow: ellipsis;    
    display: block;
	}
	
	
	
	
	 .btn-area {
       
        transform:scale(0.8);
        width:42%;
        margin-top:7px;
        margin-right:-15%;
    }

	.btn{
 		transform:scale(0.8);
        width:42%;
        margin-top:7px;
        margin-right:-15%;
}
	
	
}

    
    
    @media  (min-width: 900px) {
    
    
     #home{
	margin-top:5%;
	margin-bottom: 5%;
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


<%


		HttpSession s = request.getSession();
		String uid = (String)s.getAttribute("uid");
		
		String pname = (String)s.getAttribute("pname");	
		
		
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
        
          
      </div>

      <div class="mobile-open-btn">
          <i class="uil uil-align-right"></i>
      </div>


      


  </header>

  <!-- ======================== End header section ================================ -->






 <!-- ================================= Feature section =================================== -->
    
<section class="shop-feature bg-grey grid" style="z-index: 10; margin-bottom: 12%;">
  <div>
  <p class="fs-montserrat text-black">Home <span aria-haspopup="true" class="margin">></span>Cart</p>
  </div>
  <h2 class="fs-poppins fs-300 bold-800">Cart Checkout</h2>
</section >
<!-- ================================= End feature section =================================== -->






<!-- ================================  CART SECTION  ================================================================= -->


<section id="cart">
  <table border="none">
        <% 
       

          try {
            
            String sessionUid = (String) session.getAttribute("uid");

            if (sessionUid != null && !sessionUid.isEmpty()) {
              Class.forName("com.mysql.cj.jdbc.Driver");
              String databaseurl = "jdbc:mysql://localhost:3306/user";
              String un = "root";
              String pwd = "Binit.1234";

              Connection con = DriverManager.getConnection(databaseurl, un, pwd);
              String sql = "SELECT * FROM cart WHERE uid = ?";

              PreparedStatement ps = con.prepareStatement(sql);
              ps.setString(1, sessionUid);

              ResultSet rs = ps.executeQuery();

              while (rs.next()) {
                

        %>
        
        
        
        
        <tr>

        
        
        
        
        
                <form action="Udcart">
                  <div class="box">
                    <a href="product-show.jsp?pid=<%= rs.getString("pid") %>">
                      <img src="File_search?pid=<%= rs.getString("pid") %>">
                    </a>
                    <div class="content">
                      <h3><%= rs.getString("pdname") %></h3>
                      <h4><b>Price: </b><span>&#8377;<%= rs.getString("pdprice") %></span></h4>
                      <p><input type="hidden" name="pid" value="<%= rs.getString("pid") %>"></p>
                      <p class="unit">
                        <b>Quantity:</b>
                        <input type="number" id="input" name="quantity" value="<%= rs.getString("quantity") %>">
                      </p>
                      <input type="submit" value="Update" name="update" class="btn">
                 
                        <input type="submit" value="Delete" name="delete" class="btn-area">
                    </div>
                  </div>
                </form>
                
                
                
                
          </tr>
                
                
                
                
        <%
              }
              rs.close();
              ps.close();
              con.close();
            } else {
              out.println("<p>Please log in to view your cart.</p>");
            }

            
          } catch (Exception e) {
            e.printStackTrace();
          }
        %>
        
        
        <tr>
        
        
      </div>
      <div class="right-bar">
        <p><span>Subtotal</span> <span>&#8377;100</span></p>
        <hr>
        <p><span>Shipping</span> <span>&#8377;70</span></p>
        <hr>
        <p><span>Total</span> <span>&#8377;200</span></p>
        <hr>
        <a href="#"><i class="uil uil-shopping-cart"></i>Checkout</a>
        <a href="shop.jsp"  id="home">
          <i class="uil uil-home"></i>Continue Shopping
        </a>
      </div>
    </div>
  </div>
  
  
  </tr>
  
  </table>
  
</section>

	



				
			

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
            <p class="fs-montserrat">+99 (0) 101 0000 888 ________ 40 , cross road , jhilbagan , dumdum , kolkata - 7000030 , west bengal , india</p>
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
