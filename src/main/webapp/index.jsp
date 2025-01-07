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
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

    <!-- Icon -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

    <!-- custon style Sheet & JavaScript -->
    <link rel="stylesheet" href="css/index.css" />
    
    <script src="js/index.js" defer></script>
    <!-- custon style Sheet & JavaScript -->
    <title>Arcade Store</title>
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
      
      
      
  
    

  
  
   .cart-count {
           
            position: absolute;
            top: -2px;
            right: -8px;
            background-color: red;
            color: white;
            font-size: 0.8rem;
            font-weight: bold;
            border-radius: 50%;
            width: 23.5px;
            height: 22.5px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
          }
  
  
  
  

  
  
        
</style>




<script>
        function sct(pd) {
            const targetElement = document.getElementById(pd);
            if (targetElement) {
                targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
    </script>




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
                    <li><a class="active  fs-100 fs-montserrat bold-500" href="index.jsp">Home</a></li>
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
                  </div>
            </div>

<!-- ================================ login ======================================== -->
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
    <!-- =================================== Hero Section ====================================== -->
    <main class="hero-section">
        <div>
            <h1 class="fs-200 fs-poppins" id="hd1">Beats solo <span class="big-wireless block lineheight fs-300 bold-900 fs-poppins" id="hd2">Wireless</span><span class="text-white uppercase lineheight2 bold-bolder fs-poppins fs-900" id="hd3">Headphone</span></h1>
            <img src="image/image1.png" alt="" id="hed">
        </div>
        <div class="hero-inner flex">
            <div id="bt1">
                 <button class="product-btn large-btn bg-black text-white  fs-poppins fs-50 bold-500" id="fbtn"  onclick="sct('pd')" >  Explore categories </button>
            </div>
            <div class="hero-info">
                <h4 class="fs-montserrat fs-500" id="dsc">Description</h4>
                <p class="fs-montserrat" id="hd4" > Delivers crisp, immersive sound with superior comfort and a minimalist design. Featuring long battery life.</p>
            </div>
        </div>
    </main>

    <!-- =========================== End of Hero Section ========================== -->
    <!-- =========================== Product Section ========================== -->

    <section id="pd" class="product-section">
        <!-- =========================== 1 ========================== -->
        <div class="category bg-black grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="earphone uppercase fs-500 fs-montserrat bold-900 lineheight" id="earphone"> Earphone </span> </h3>
                <a href='shop-cat.jsp?pdcat=earphone'><button class="product-btn large-btn text-white bg-red fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img1">
                <img src="image/h.png" alt="">
            </div>
        </div>
        <!-- =========================== 2 ========================== -->
        <div class="category bg-yellow grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="Smartwatch uppercase fs-500 fs-montserrat bold-900 lineheight" id="watch"> Smartwatch </span> </h3>
                <a href='shop-cat.jsp?pdcat=watch'><button class="product-btn large-btn text-yellow bg-white fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img2">
                <img src="image/w.png" alt="">
            </div>
        </div>
        <!-- =========================== 3 ========================== -->
        <div class="category bg-red grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="Laptop uppercase fs-500 fs-montserrat bold-900 lineheight" id="laptop"> Laptop </span> </h3>
                <a href='shop-cat.jsp?pdcat=laptop'><button class="product-btn large-btn text-red bg-green fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img3">
                <img src="image/Laptop.png" alt="">
            </div>
        </div>

        <!-- =========================== 4 ========================== -->

        <div class="category bg-grey grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="Console uppercase fs-500 fs-montserrat bold-900 lineheight"> Console </span> </h3>
                <a href='shop-cat.jsp?pdcat=console'><button class="product-btn large-btn text-gray bg-blue fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img4">
                <img src="image/gam.png" alt="">
            </div>
        </div>
        <!-- =========================== 5 ========================== -->
        <div class="category bg-green grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="vr uppercase fs-500 fs-montserrat bold-900 lineheight" id="vr"> VR headset </span> </h3>
                <a href='shop-cat.jsp?pdcat=vr'><button class="product-btn large-btn text-green bg-light-gray fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img5">
                <img src="image/man2.png" alt="">
            </div>
        </div>
        <!-- =========================== 6 ========================== -->
        <div class="category bg-blue grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="earphone uppercase fs-500 fs-montserrat bold-900 lineheight"> Mouse </span> </h3>
                <a href='shop-cat.jsp?pdcat=mouse'><button class="product-btn large-btn text-blue bg-yellow fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img6">
                <img src="image/mouse.png" alt="">
            </div>
        </div>


        <!-- =========================== 7 ========================== -->
        <div class="category bg-grey grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="pc uppercase fs-500 fs-montserrat bold-900 lineheight"> Gaming PC </span> </h3>
                <a href='shop-cat.jsp?pdcat=pc'><button class="product-btn large-btn text-gray bg-blue fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img7">
                <img src="image/gmpc.png" alt="">
            </div>
        </div>


        <!-- =========================== 8 ========================== -->
        <div class="category bg-yellow grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="earphone uppercase fs-500 fs-montserrat bold-900 lineheight" id="control"> Controlers </span> </h3>
                <a href='shop-cat.jsp?pdcat=controlers'><button class="product-btn large-btn text-yellow bg-white fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img8">
                <img src="image/gmc.png" alt="">
            </div>
        </div>


        <!-- =========================== 9 ========================== -->
        <div class="category bg-green grid">
            <div>
                <h3 class="text-white fs-50 fs-montserrat"> Enjoy <span class="block fs-300 fs-poppins "> With </span> <span class="earphone uppercase fs-500 fs-montserrat bold-900 lineheight" id="peri"> Keyboard </span> </h3>
                <a href='shop-cat.jsp?pdcat=keyboard'><button class="product-btn large-btn text-green bg-grey fs-montserrat"> Browse </button></a>
            </div>

            <div class="product-img9">
                <img src="image/peri.png" alt="">
            </div>
        </div>

    </section>

    <!-- =========================== End of Product Section ========================== -->

 <!-- =========================== Service Section ========================== -->
 
 <section class="service-section">
    <div class="Service">
        <img src="image/free.svg">
        <div class="service-info">
            <h3 class="fs-poppins fs-200">Free shipping</h3>
            <p class="fs-montserrat fs-50">Free Shipping above ₹300</p>
        </div>
    </div>
    <div class="Service">
        <img src="image/sett.svg">
        <div class="service-info">
            <h3 class="fs-poppins fs-200">100% Authenticity</h3>
            <p class="fs-montserrat fs-50">30 days refund gauranted</p>
        </div>
    </div>
    <div class="Service">
        <img src="image/supt.svg">
        <div class="service-info">
            <h3 class="fs-poppins fs-200">24/7 Support</h3>
            <p class="fs-montserrat fs-50">Online Tech Support 24/7</p>
        </div>
    </div>
    <div class="Service">
        <img src="image/pay.svg">
        <div class="service-info">
            <h3 class="fs-poppins fs-200">Secure Payment</h3>
            <p class="fs-montserrat fs-50">Accepts all Payment Methods</p>
        </div>
    </div>
    
 </section>

 <!-- =========================== End of Service Section ========================== -->



 <!-- =========================== Feature Section ========================== -->
  
<section class="feature-section bg-red">
    <div class="feature-one grid">
        <img src="image/p-1.png">
        <p class="text-white uppercase">20% OFF</p>
        <p class="font-size lineheight fs-600 lineheight2 text-white fs-poppins bold-900 uppercase">Feel <span> sound</span></p>
        <p class="text-white fs-poppins fs-50">15 Nov to 1 Dec</p>
    </div>
    <div class="feature-info" >
         <h2 class="fs-200  text-white fs-poppins bold-500">Beats Solo Air</h2>
         <p class="fs-poppins fs-300 bold-800 text-white">Summer Sale</p>
         <p class="fs-montserrat text-white fs-50"> The Headset that not only sounds good but also feels good is now more affordable </p>
        <a  href="shop.jsp"> <button class="product-btn large-btn text-red bg-white fs-poppins">Shop</button>  </a>
    </div>
</section>

 <!-- =========================== End of Feature Section ========================== -->

 <!-- =========================== Best seller Section ========================== -->

 <!-- +++++++++++++++++++++++++++ Heading ++++++++++++++++++++++++++++++  -->




 <section class="best-product container">
    <h2 class="letter-spacing bold-bolder fs-300 fs-poppins">Best Seller Products</h2>
    <p class="fs-montserrat fs-100">Here are the top most selling product at our shop.</p>
</section>

 <section id="bs" class="best-seller">
 
 
 <%
	
	String DB_URL = "jdbc:mysql://localhost:3306/user";
    String DB_USER = "root";
    String DB_PASSWORD = "Binit.1234";
    
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		PreparedStatement pst=connection.prepareStatement("select * from product");
		ResultSet rs=pst.executeQuery();
		
		   int counter = 0; 

	        while (rs.next() && counter < 12) { 

	        	counter++;

	%>
	
	            <div class="product grid">
	                <a href='product-show.jsp?pid=<%= rs.getString("pid") %>'>
	                    <img src='File_search?pid=<%= rs.getString("pid") %>' style="border-radius:25px;">
	                </a>
	                <p class="fs-poppins bold-500"><%= rs.getString("pdname") %></p> 
	                <p class="fs-poppins bold-500" id="price"><%= rs.getString("pdprice") %></p>

	                <!-- =========================================================== -->
	                <div class="product-details grid bg-red">   
	                    <a href='product-show.jsp?pid=<%= rs.getString("pid") %>'>
	                        <i class="uil text-black uil-shopping-cart-alt" style="z-index: 10;"></i>
	                    </a>
	                    <i class="uil text-black uil-heart-alt" style="z-index: 10;"></i>
	                </div>
	                <!-- =========================================================== -->
	            </div>
	  
	<%
	        }
	    }
	    catch(Exception e)
	    {
	        e.printStackTrace();        
	    }
	%>
	</section>
 <!-- =========================== End of Best seller Section ========================== -->


 <!-- ============================ Feature Section 2 =============================== -->

 <section class="feature-section bg-green">
    <div class="feature-one grid">
        <img src="image/p-con.png   ">
        <p class="text-white uppercase">30% OFF</p>
        <p class="font-size lineheight fs-600 lineheight2 text-white fs-poppins bold-900 uppercase">Total<span> Control</span></p>
        <p class="text-white fs-poppins fs-50">15 Nov to 7 Dec</p>
    </div>
    <div class="feature-info" >
         <h2 class="fs-200  text-white fs-poppins bold-500">Red Dragon controllers</h2>
         <p class="fs-poppins fs-300 bold-800 text-white">Summer Sale</p>
         <p class="fs-montserrat text-white fs-50"> Take total control with the new and best looking gaming controllers for botj consoles and PC.</p>
        <a  href="shop.jsp"> <button class="product-btn large-btn text-green bg-white fs-poppins">Shop</button> </a>
    </div>
</section>

 <!-- ============================ End of Feature Section 2 =============================== -->

<!-- ============================ Heading Recent News =============================== -->

 <section class="recent-news grid">
    <h2 class="letter-spacing bold-bolder fs-300 fs-poppins">Recent News</h2>
    
 </section>

<section class="recent-news grid">




<%
	
	
    
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		PreparedStatement pst=connection.prepareStatement("select * from blog");
		ResultSet rs=pst.executeQuery();
		
		   int counterh = 0; 

	        while (rs.next() && counterh < 3) { 

	        	counterh++;

	%>





    <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
    <div class="news grid">
    <a href='blog-show.jsp?bid=<%= rs.getString("bid") %>'>
    <img src='Blog_search?bid=<%= rs.getString("bid") %>' alt="" style="border-radius: 25px;">
    </a>
  <div class="fs-montserrat fs-100 flex">
    <p><%= rs.getString("bdate") %></p>
    
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500"><%= rs.getString("bname") %>
    </h2>
    <p class="fs-montserrat padding-inline fs-100 det"> <%= rs.getString("bdetails1") %>
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->



<%
	        }
	    }
	    catch(Exception e)
	    {
	        e.printStackTrace();        
	    }
	%>


</section>

<!-- ============================ End of Heading Recent News =============================== -->

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
        <img src="image/br-6.png">
    </div>
    <div>
        <img src="image/br-4.png">
    </div>
    <div>
        <img src="image/br-5.png">
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