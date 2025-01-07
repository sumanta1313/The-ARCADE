
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
      href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
    />
    <!-- icon -->

    <!-- Google fonts End -->

    <!-- custon style Sheet & JavaScript -->
    <link rel="stylesheet" href="css/shop.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/about.css" />
    <link rel="stylesheet" href="css/blog.css" />
    <link rel="stylesheet" href="css/contactus.css" />
    <script src="js/index.js" defer></script>
    <script src="js/shop.js" defer></script>
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
      
        
        
.contact-us{
     width: 90vw;
    margin-inline: auto; 
    align-items: center; 
    --grid-gap: 4rem;
    margin-block: 3rem; 
    grid-auto-columns: 1fr; 
    grid-template-areas:
    'one'
    'two';
}

.contact-us:nth-child(1){
    grid-area: one;
}

.contact-us:nth-child(2){
    grid-area: two;
}

.contact-form{
    margin-block: 2rem;
    --gridgap:1rem;
}

#texto{
    animation: appr 0.5s ease-in-out;
}


.contact-us input{ 
    border: 0;
    padding: 1rem 2rem; 
    border-radius: 2rem;
    animation: sco 0.6s ease-in-out;
    }


    .contact-us textarea{  
        animation: sco 0.6s ease-in-out;
       }

.contact-us input:focus{
    outline: none;
    }


.contact-us textarea{ 
    width: 100%; 
    border: 0;
    border-radius: 2rem;
}

.contact-us textarea:focus{
        outline: none;
}

.contact-btn > button{
        padding: 1rem 3rem;
        font-size: 1rem;
        margin-top: 1.5rem;
        animation: sco 0.7s ease-in-out;
}


.map{
    background-color: hsl(var(--clr-red)/0.3); 
    padding: 1rem 2rem;
    margin-block: 2rem;
    position: relative;
    animation: appry 0.6s ease-in-out;
    }

.map::before{
    content: '';
    width: 5px;
    top: 0;
    left: 0;
    height: 100%;
    background-color: hsl(var(--clr-red));
    position: absolute;
    }


.support-info{
    animation: sco  ease-in-out;
    animation-timeline: view();
    animation-range: entry 0% cover 40%;
}

/*=========Media Quaries========== */
@media (min-width: 45em) {
    .contact-us{
    grid-template-areas:
    'one two';
    }
    .contact-us h1 {
    font-size: 1rem;
    }
.map h4{
    font-size: 1rem;
}

}


.support-container{ 
    width: 90vw;
    margin-inline: auto;
    margin-bottom: 7rem; 
    place-items: center; 
    --grid-gap: 3rem; 
    grid-auto-columns: 1fr; 
    grid-template-areas:
    'one'
    'two'
    'three';
    }

.support-container:nth-child(1){
    grid-area: one;
    }
    .support-container:nth-child(2){
        grid-area: two;
        }
        .support-container:nth-child(3){
            grid-area: three;
            }

.support-info{
    --grid-gap:1rem;
    place-items: center;
}
.support-img{
    place-items: center;
}


@media (min-width: 45em) {
    .support-container{
    grid-template-areas: 'one two three';
}
    .support-info > P,
    .support-info span{
    font-size: 1rem
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
                  <li><a class="active  fs-100 fs-montserrat bold-500" href="contactus.jsp">Contact Us</a></li>
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


<!-- ================================= Feature section =================================== -->
    
<section class="shop-feature bg-grey grid">
  <div>
  <p class="fs-montserrat text-black">Home <span aria-haspopup="true" class="margin">></span>Contacts</p>
  </div>
  <h2 class="fs-poppins fs-300 bold-800">Contacts</h2>
</section>
<!-- ================================= End feature section =================================== -->


<!-- ========================= Contact Section ========================== -->



<section class="contact-us grid">
  <div class="contact-info">
  <div id="texto">
    <h1 class="fs-poppins text-red fs-200">Contact Us</h1>
    <h3 class="fs-poppins text-black fs-400">Get In Touch</h3>
      <p class="fs-montserrat fs-100">If you ever face any problem with using this site or any other issues related to us, let us know . </p>
  </div>
  <form action="#" class="contact-form grid"> 
    <div class="grid">
      <input type="email" class="bg-grey text-black fs-poppins" placeholder="Your Email">
    </div>
  <div class="grid">
      <input type="text" class="bg-grey  text-black- fs-poppins" placeholder="Phone Number">
    </div>
      <div>
          <textarea class="bg-grey text-black fs-poppins" rows="10" placeholder="       Your Message"></textarea>
      </div>
      <div class="contact-btn">
          <button class="large-btn bg-red text-white fs-poppins"> Submit </button>
      </div>
  </form>
  </div>

<!-- ======================== MAP ============================= -->

<div>
    <div class="map">
      <h4 class="fs-poppins fs-200 text-red"> Google Maps API key is missing </h4>
      <p class="fs-montserrat fs-100"> In order to use google maps on your website , you have to create an api key and insert it in customizer "Google Maps API key" field</p>
    </div>
</div>
</section>


<!-- ============================= Support Section ================================== -->


<section class="support-container grid">
  <!-- ========================= 1 ============================== -->
  <div class="support-info grid">
  <div class="support-img grid">
  <img src="image/sup-1.svg" alt="">
  </div>
  <div>
  <p class="fs-100 fs-poppins">
  </p>
  <span class="fs-200 fs-poppins
  bold-700">Email:</span> Info@yourdomain.com
  <p class="fs-poppins fs-100">info@samplemail.com </p>
  </div>
  </div>

 <!-- ========================= 2 ============================== -->
 <div class="support-info grid">
  <div class="support-img grid">
  <img src="image/sup-2.svg" alt="">
  </div>
  <div>
  <p class="fs-100 fs-poppins">
  </p>
  <span class="fs-200 fs-poppins
  bold-700">Phone:</span> 7076494138
  <p class="fs-poppins fs-100">info@samplemail.com </p>
  </div>
  </div>

 <!-- ========================= 3 ============================== -->
 <div class="support-info grid">
  <div class="support-img grid">
  <img src="image/sup-3.svg" alt="">
  </div>
  <div>
  <p class="fs-100 fs-poppins">
  </p>
  <span class="fs-200 fs-poppins
  bold-700">Adress:</span> Heaven,over the head
  <!-- <p class="fs-poppins fs-100">info@samplemail.com </p> -->
  </div>
  </div>

  </section>


<!-- ========================= End of Contact Section ========================== -->


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
