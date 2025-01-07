<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    <!-- custon style Sheet & JavaScript -->

    <link rel="stylesheet" href="css/shop.css" />
    <link rel="stylesheet" href="css/index.css" />
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
      
        
        

    
    
    
    /* ----- utility class for shop ------*/

.margin{padding-inline: 0.5rem ;}
button{cursor: pointer;}
.uil{cursor: pointer;}

/* ____________________  Shop feature Section  ____________________ */

.shop-feature{
    width: 100vw;
    place-items: center;
    padding: 3rem 0;
}

.shop-feature{
    background-color: hsl(var(--clr-gray));
}

/* ____________________  Section 2  ____________________ */


.shop-main-container{
width: 90vw;
margin-inline: auto;
margin-block: 2rem;
}

.shop-title{
justify-content: space-between;
align-items: center;
}

.shop-title select{
padding: 0.5rem;
border-radius: 2rem;
}

/* ____________________  Shop product  ____________________ */


.shop-product {
grid-template-columns:repeat(1fr);
margin-block: 2rem;
}

.product-list{
overflow: hidden;
cursor: pointer;
margin-bottom: 1em; 
position: relative;
animation: sco linear;
animation-timeline: view();
animation-range: entry 0% cover 40%;
}


.pdn{
	width:87%;
	height:69%;
	overflow:hidden;
}


.product-list:hover , .product-list:focus{ 
    color: hsl(var(--clr-red));
    text-shadow: 0 0 12 hsl(var(--clr-red));
}

.product-list img{
    width: 385px; 
    height: 300px; 
    object-fit: contain;
    border-radius: 1.3rem;
}


.shop-btn{
align-items: center;
--flex-gap: 3rem;
transform: translateX(-38.3%);
transition: transform 250ms ease-in-out;
cursor: pointer;
}

.product-list:hover .shop-btn{
transform: translateX(0%);
}

.shop-btn button{
border: 0;
padding: 0.5rem 1rem;
border-radius: 2rem;
}

/* =============== POP UP =============== */
.pup-up{
    position: absolute;
    background-color: hsl(var(--clr-red));
    top: 1rem;
    left: 1rem;
    border-radius: 50%;
    padding: 1rem;
    color: hsl(var(--clr-white));
}

.pup-up:hover{
    box-shadow: 0px 0px 20px hsl(var(--clr-red));
}


/* ==========Grid Section======= */

.shop-product:nth-child(1){
grid-area: one;
}
.shop-product:nth-child(2){
grid-area: two;
}
.shop-product:nth-child(3){
grid-area: three;
}
.shop-product:nth-child(4){
grid-area: four;
}
.shop-product:nth-child(5){
grid-area: five;
}
.shop-product:nth-child(6) {
grid-area: six;
}
.shop-product:nth-child(7) {
grid-area: seven;
}
.shop-product:nth-child(8) {
grid-area: eight;
}
.shop-product:nth-child(9) {
grid-area: nine;
}


/* =========================== Media Quaries for DESKTOP ================================ */


@media (min-width: 59em){ 
    
    .shop-main-container{ 
        --grid-gap: 2rem;
        grid-auto-columns: 1fr;
        grid-template-columns: auto 20vw;
                        }

.shop-main-container >*:first-child{
            grid-column: 1;
                                   }

.shop-main-container >*:last-child{
            grid-column: 2;
                                  }



.shop-product{
    grid-template-areas: 'one two three' 'four five six' 'seven eight nine';
}

.sidebar-search{
    padding-inline: 1rem;
}

.shop-product >h3{
    font-size: 1rem;
}

.product-list .shop-btn{
    transform: translateX(-40%);
}

}

/* =========================== Media Quaries for IPAD ================================ */


@media (min-width: 35em) and (max-width: 59em){ 
  .shop-product{
        grid-template-areas:
    'one two'
    'three four'
    'five six'
    'seven eight';
               }

.product-list .shop-btn{
transform: translateX(-45%);
                        }



}


/* =============== Sidebar Section =============== */


.sidebar-search {
    border-radius: 2rem;
    align-items: center;
    margin-bottom: 2rem; 
    margin-top: 0.4rem;
}

.sidebar-search input{

    padding: 1rem 0.5rem;
    width: 75%;
    border-radius: 2rem;
    border: 0;
    margin-right: 0.5rem;
}

.sidebar-search input:focus{
    outline: none;
}

.sidebar-search input[type="text"]{
    padding-inline: 2rem;
}

.sidebar-search >* i{
    padding: 0.9rem;
    font-size: 1rem;
    border-radius: 10rem;
    padding-left: 2rem;
    padding-right: 2rem;
    box-shadow: -2px -0px 13px hsl(var(--clr-white) );
    transition: box-shadow 500ms ease-in-out;
}

.sidebar-search >* i:hover{
    text-shadow: 0px 0px 20px hsl(var(--clr-white));
    box-shadow: 0px 0px 18px hsl(var(--clr-red));
}

/* _________________________ Category List ___________________________ */

.category-list{
    justify-content: space-between;
    align-items: center;
    padding-inline: 1rem;
    padding-bottom: 2rem;
}

.category-list > i{
    font-size: 2rem;
    transform: rotate(0deg);
    transition: transform 300ms ease-in-out;

}

.category-list > i[data-category="true"]{
        transform: rotate(90deg);
}

.shop-category-list{
    overflow-y: hidden;
}

.sidebar-nav{
    margin: 0;
    padding: 0;
    padding-inline: 2.5rem;
    list-style: none;
    --grid-gap:0.8rem;
    transform: translateY(-100%);
       transition: transform 300ms ease-in-out;
}

.sidebar-nav[data-category="true"]{
    transform: translateY(0%);
}

.sidebar-nav a{
    text-decoration: none;
}



.shop-category-list a:hover{
color:#ff3131;
text-shadow:0px 0px 10px hsl(var(--clr-red));

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
                  <li><a class="active  fs-100 fs-montserrat bold-500" href="shop.jsp">Shop</a></li>
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


    <!-- ================================= Shop section =================================== -->

    <!-- ================================= Feature section =================================== -->
    
    <section class="shop-feature bg-gray grid">
      <div>
      <p class="fs-montserrat text-black">Home <span aria-haspopup="true" class="margin">></span>Shop</p>
      </div>
      <h2 class="fs-poppins fs-300 bold-800">Products</h2>
    </section>
    <!-- ================================= End feature section =================================== -->

 <!-- ================================= Shop section 2 =================================== -->

<main class="shop-main-container grid">
    <div>
        <div class="shop-title flex">
            <div>
              <h2 class="fs-poppins fs-300">Shop</h2>
              <p class="fs-montserrat">Here is all products that we have</p>
            </div>
          <div>
                <select name="text" class="fs fs-poppins bg-black text-white">
                    <option value="text"> Default sorting </option>
                    <option value="text"> sort by Popularity </option>
                    <option value="text"> sort by Rating </option>
                    <option value="text"> sort by latest </option>
                    <option value="text"> sort by Price </option>
                    <option value="text"> sort by Low to High </option>
                    <option value="text"> sort by High to low </option>
                </select>
            </div>
        </div>
        <!-- =============================  End of inner section  ================================= -->

        <!-- =============================  Shop product section  ================================= -->
        
       	<section class="shop-product grid">
       	
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
		
		while (rs.next()) { 
			%>
			        <div class="product-list grid">
			            <!-- Pass the product id (pid) as a query parameter -->
			            <a href='product-show.jsp?pid=<%= rs.getString("pid") %>'>
			                <img src='File_search?pid=<%= rs.getString("pid") %>'>
			            </a>
			            <p class="fs-montserrat bold-500 pdn"><%= rs.getString("pdname") %></p>
			            <div class="shop-btn flex">
			                <a href='product-show.jsp?pid=<%= rs.getString("pid") %>'>
			                <button class="bg-red text-white fs-montserrat">Add to cart</button>
			                </a>
			                 
			                <p class="fs-montserrat bold-800">&#8377;<%= rs.getString("pdprice") %></p>
			            </div>
			            <!-- Pop-up section -->
			            <div class="pup-up">
			                <p class="fs-poppins">Sell</p>
			            </div>
			        </div>
			<%
			        }
	}
	catch(Exception e)
	{
		e.printStackTrace();		
	}
	
	%>

        

           
<!-- ______________ END OF PRODUCT SECTION _____________________ -->


        </section>
    </div>

<!-- ______________________________ SIDEBAR SECTION ______________________________________ -->

<section>
    <div class="sidebar-search text-black bg-grey flex">
    <input type="text" placeholder="search" class="fs-montserrat bg-grey">
      <div>
          <i class="uil bg-red text-white uil-search"></i>
      </div>
    </div>
      <aside class="sidebar-category">
          <div id="cat" class="category-list flex">
            <h3 class="fs-poppins bold-800 fs-200">Product Categories </h3>
              <i id="arrow" class="uil uil-angle-right" data-category="false"></i>
          </div>

<!-- -------------------------------------------------- Category List ------------------------------------------------ -->

             <div class="shop-category-list">
              <ul id="side-nav" class="sidebar-nav grid" data-category="false">
                <li><a class="fs-montserrat text-black bold-500"href='shop-cat.jsp?pdcat=earphone'>Earphones</a></li>
                <li><a class="fs-montserrat text-black bold-500"href='shop-cat.jsp?pdcat=headphone'>Headphones</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=watch'>Smartwatches</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=laptop'>Laptops</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=console'>Consoles</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=vr'>VR Headset</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=mouse'>Mouse</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=pc'>Gaming PC</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=controlers'>Controlers</a></li>
                <li><a class="fs-montserrat text-black bold-500" href='shop-cat.jsp?pdcat=keyboard'>Keyboard</a></li>
                <li><a class="fs-montserrat text-black bold-800"href='shop.jsp'>ALL</a></li>

              </ul>
            </div>

      </aside>
</section>

<!-- ______________________________ END OF SIDEBAR SECTION ______________________________________ -->

 </main>

 <!-- ================================= End of Shop section 2 =================================== -->

    <!-- ============================= End of Shop section ================================= -->



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
