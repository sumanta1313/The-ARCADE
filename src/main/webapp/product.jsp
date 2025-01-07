<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Product Page - Admin HTML Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body id="reportsPage">
  
  <%

	
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	
	response.setHeader("Expires", "0"); //proxies

	if(session.getAttribute("aemail")==null ){
		response.sendRedirect("admin-login.jsp");
	}	

%>
    <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="products.jsp">
          <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button
          class="navbar-toggler ml-auto mr-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto h-100">
           
         <li class="nav-item">
              <a class="nav-link active" style="background-color: white; color: black; width:85%;" href="product.jsp">
                 <img style="width:40px; " src="image/drop.gif" > <b>PRODUCTS</b> 
                <span class="sr-only">(current)</span>
              </a>
            </li>
            
             <li class="nav-item">
              <a class="nav-link active" style="background-color: beige; color: black;" href="blog-li.jsp">
                 <img style="width:40px; " src="image/edit-info.png" > <b>BLOGS</b> 
                <span class="sr-only">(current)</span>
              </a>
            </li>

         
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link d-block" href="Admin_logout">
                <img style="width:40px; " src="image/out.gif" ><b>Logout</b>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
     <div class="container mt-5">
      <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-products" style="border-radius:25px;">
            <div class="tm-product-table-container">
              <table class="table table-hover tm-table-small tm-product-table" border="3" style="justify-content:center; text-align:center; backdrop-filter:blur(20px);">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">NAME</th>
                    <th scope="col">PRICE</th>
                    <th scope="col">DETAILS</th>
                    <th scope="col">IMAGE</th>
                    <th scope="col">CATEGORY</th>
                    <th scope="col">DELETE</th>
                    <th scope="col">EDIT</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <%
                    try {
                      // Set up the connection
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      String databaseurl = "jdbc:mysql://localhost:3306/user";
                      String uid = "root";
                      String pwd = "Binit.1234";
                      Connection con = DriverManager.getConnection(databaseurl, uid, pwd);
                      String sql = "SELECT pid, pdname, pdprice, pddetails, image, pdcat FROM product"; // Ensure 'pdcat' is included
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                    
                      while (rs.next()) {
                  %>
                        <tr>
                          <td class="tm-product"><%= rs.getInt("pid") %></td>
                          <td class="tm-product"><%= rs.getString("pdname") %></td>
                          <td class="tm-product"><%= rs.getString("pdprice") %></td>
                          <td class="tm-product"><%= rs.getString("pddetails") %></td>
                          <td class="tm-product">
                            <img style="width:100px;" src='File_search?pid=<%= rs.getString("pid") %>' />
                          </td>
                          <td class="tm-product"><%= rs.getString("pdcat") %></td>
                          <td>
                            <a href="Delete?pid=<%= rs.getString("pid") %>" class="tm-product-delete-link">
                              <i><img alt="" class="bin" style="width:22px;" src="image/recycle-bin.png"></i>
                            </a>
                          </td>
                          <td>
                            <a href="edit-product.jsp?pid=<%= rs.getString("pid") %>" class="tm-product-delete-link">
                              <i><img alt="" class="bin" style="width:22px;" src="image/edit.png"></i>
                            </a>
                          </td>
                        </tr>
                  <%
                      }
                    } catch (Exception e) {
                      e.printStackTrace();
                    }
                  %>
                </tbody>
              </table>
            </div>
            <a href="add-product.jsp" class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
          </div>
        </div>
      </div>
    </div>

   <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          <p class="text-center text-white mb-0 px-4 small">
            Copyright &copy; <b>2024</b> All rights reserved to team ARCADE. 
            
            Design: <a rel="nofollow noopener" href="https://www.instagram.com/p/DCMP6LEy1xl/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" class="tm-footer-link">US</a>
        </p>
        </div>
    </footer> 

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
      $(function() {
        $(".tm-product-name").on("click", function() {
          window.location.href = "edit-product.jsp";
        });
      });
    </script>
  </body>
</html>