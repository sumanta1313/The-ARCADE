
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


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
      href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
      
      <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <!-- icon -->

    <!-- Google fonts End -->

    <!-- custon style Sheet & JavaScript -->
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/shop.css" />
    <link rel="stylesheet" href="css/bl-sh.css" />
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
      
      
      
      .det{
      		width:580px;
			height:40px;
          text-wrap: wrap;
    		overflow: hidden;           
    		display: block;       
      }
  
  
  
  
  </style>
  
  
  
  
  </head>
  <body class="home">

    <!-- ========================== Header Section ============================== -->

    <header class="primary-header container flex">
      <div class="header-inner-one flex">
          <div class="logo">
              <a href="index.html"><img src="image\logo.png.png" alt=""></a>
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
                    <!-- <i class="uil text-black uil-search"></i> -->
                </div>
          </div>


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
   
        <i id="cart-box" aria-controls="cart-icon" class="uil uil-shopping-bag" onclick="togcart()" style="text-decoration: none;"></i>
        
   
</div>


            <!-- ============= Cart Box ============ -->
            
            

            <div id="cart-icon" data-visible="false" class="cart-icon">
              
        </div>

        <div class="mobile-open-btn">
            <i class="uil uil-align-right"></i>
        </div>

  <div class="sub-cart-wrap" id="subcart">
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
<a href="#" class="sub-pro">
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

           <a href="cart.jsp" style="text-decoration: none; color: black;  margin-left:41%;">   <button class="navbut bg-red text-white fs-100 fs-montserrat bold-500" style="text-decoration: none; transform:scale(0.7); " >Cart</button> </a>
          </div>
      </div>

      </div>



  </header>

  <!-- ======================== End header section ================================ -->

<!-- ======================== Main section ================================ -->



<%
    String bid = request.getParameter("bid"); 

    String DB_URL = "jdbc:mysql://localhost:3306/user";
    String DB_USER = "root";
    String DB_PASSWORD = "Binit.1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        PreparedStatement pst = connection.prepareStatement("select * from blog where bid = ?");
        pst.setString(1, bid);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) { 
%>

  <div class="container">
    <div class="video-section">
      <img src='Blog_search?bid=<%= rs.getString("bid") %>' alt="">
    </div>

    <div class="content">
        <div class="main-content">
            <h2><%= rs.getString("bname") %></h2>
            <p>
                <%= rs.getString("bdetails1") %>
            </p>
            <p>
               <%= rs.getString("bdetails2") %>
            </p>
           
        </div>

        <div class="sidebar">
            <h4>Share this Post</h4>
            <a href="https://www.facebook.com/">Facebook</a>
            <a href="https://x.com/i/flow/login?lang=en">Twitter</a>
            <a href="https://www.instagram.com/accounts/login/?hl=en">Instagram</a>
            <div class="author"><b>Author: </b> Team Arcade</div>
            <div class="likes"><%= rs.getString("bdate") %></div>
            <a href="blog.jsp" class="download-btn">See More</a>
        </div>
    </div>


<%
        } else {
            out.println("<p>Product not found.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


    <div class="related-videos">
        <h3 class="fs-400">Related Blogs for You</h3>
        <div class="video-thumbnails">
<table border="0px">


  <tr>
  
  
  <%
	
	
    
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		PreparedStatement pst=connection.prepareStatement("select * from blog");
		ResultSet rs=pst.executeQuery();
		
		   int counterh = 0; 

	        while (rs.next() && counterh < 2) { 

	        	counterh++;

	%>
  
    <td>
          <!-- ======================================================================================= -->
          <div class="blog grid">
            <img src='Blog_search?bid=<%= rs.getString("bid") %>' alt="">
        <div class="fs-montserrat fs-100 flex">
            <p><%= rs.getString("bdate") %></p>
            <p>by Team Arcade</p>
        </div>
            <h2 class="fs-poppins  fs-200 bold-500"><%= rs.getString("bname") %>
            </h2>
           
        </div>
        <!-- ======================================================================================= -->

      </td>
      
     <%
	        }
	    }
	    catch(Exception e)
	    {
	        e.printStackTrace();        
	    }
	%>
      </tr>
</table>



              
        </div>
    </div>
</div>


<!-- ======================== End main section ================================ -->



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
        <a href="index.html"><img src="image\logo.png.png" alt="" id="log"></a>
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
                    <li><a class="fs-montserrat text-black fs-100" href="index.html">Home</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="shop.html">Shop</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="about.html">About</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="blog.html">Blogs</a></li>
                    <li><a class="fs-montserrat text-black fs-100" href="contactus.html">Contact</a></li>
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

