<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>The ARCADE Admin Login</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body>
    <div>
      <nav class="navbar navbar-expand-xl">
        <div class="container h-100">
          <a class="navbar-brand" href="#">
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
              
             
            </ul>
          </div>
        </div>
      </nav>
    </div>

    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-12 mx-auto tm-login-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12 text-center">
                <h2 class="tm-block-title mb-4">Welcome to Dashboard, Login</h2>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                
                
                <form action="Admin_log" method="post" class="tm-login-form">
                  <div class="form-group">
                    <label for="username">Email</label>
                    <input
                      name="aemail"
                      type="email"
                      class="form-control validate"
                      id="username"
                      placeholder="Enter your email"
                      required
                    />
                  </div>
                  <div class="form-group mt-3">
                    <label for="password">Password</label>
                    <input
                      name="apwd"
                      type="password"
                      class="form-control validate"
                      id="password"
                      placeholder="Enter your password"
                      required
                    />
                  </div>
                  <div class="form-group mt-4">
                    <button
                      type="submit"
                      class="btn btn-primary btn-block text-uppercase" 
                      style="border-radius: 25px; font-weight: 600; ">
                      Login
                    </button>
                  </div>
                  
    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("1")) { 
    %>
        <p style="color: yellow; text-align: center;">Invalid Email/Password</p> 
    <%
        } 
    %>
                  <div class="text-center mt-4 form-group">
                    <a href="admin-reg.jsp" class="btn btn-secondary text-uppercase" style="border-radius: 25px; font-weight: 600; ">
                      Create a New Account / Sign Up
                    </a>
                  </div>
                  
                  <div class="text-center mt-4 form-group">
                    <a href="login.jsp" class="btn btn-secondary text-uppercase" style="border-radius: 25px; background-color: #E0B589; font-weight: 600; color: black;">
                      If you're a Customer /  Sign in
                    </a>
                  </div>
                </form>
              </div>
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
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
  </body>
</html>
