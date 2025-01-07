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
    <title>The ARCADE - Edit Products </title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body>
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
        <a class="navbar-brand" href="product.jsp">
          <h1 class="tm-site-title mb-0"><img src="image\logo.png.png" alt=""></h1>
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
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                <form action="Update_pd" method="post" enctype='multipart/form-data' class="tm-edit-product-form">
                <%
					
	
					String pid = request.getParameter("pid");
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String uid = "root";
			String pwd = "Binit.1234";
					
			Connection con = DriverManager.getConnection(databaseurl,uid,pwd);
			String sql = "select * from product where pid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, pid);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			%>
			
				<input type="hidden" value=<%=pid%> name='pid'>
		
                  <div class="form-group mb-3">
                    <label
                      for="pdname"
                      >Product Name
                    </label>
                    <input
                      id="name"
                      name="pdname"
                      type="text"
                      value='<%=rs.getString("pdname")%>'
                      class="form-control validate"
                    />
                  </div>

                  <div class="form-group mb-3">
                    <label
                      for="pdprice"
                      >Product Price
                    </label>
                    <input
                      id="name"
                      name="pdprice"
                      type="text"
                      value='<%=rs.getString("pdprice")%>'
                      class="form-control validate"
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="pddetails"
                      >Description</label>
                    <input
                      id="name"
                      name="pddetails"
                      type="text"
                      value='<%=rs.getString("pddetails")%>'
                      class="form-control validate"
                    />
                  </div>
                  
                  
                   <div class="form-group mb-3">
                    <label
                      for="pdcat"
                      >Category</label>
                    <input
                      id="name"
                      name="pdcat"
                      type="text"
                      value='<%=rs.getString("pdcat")%>'
                      class="form-control validate"
                    />
                  </div>
                  
                  
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-edit mx-auto">
                 <img class="img-fluid d-block mx-auto"  src='File_search?pid=<%=rs.getString("pid")%>' >   
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"
                  ></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input name="image" id="fileInput" type="file" style="display:none;" />
                  <input
                    type="button"
                    class="btn btn-primary btn-block mx-auto"
                    value="CHANGE IMAGE NOW **{Should be in 945x760}"
                    onclick="document.getElementById('fileInput').click();"
                  />
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
              </div>
            </form>
            
            <%		
						
		} catch (Exception e) {
			e.printStackTrace();
		}		

	%>
            </div>
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
    <!-- https://jquery.com/download/ -->
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    
  </body>
</html>