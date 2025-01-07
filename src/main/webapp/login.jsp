<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login form</title>
    
     <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> 
    <link rel="stylesheet" href="Style.css">
    
    
    
    
    <style>
   



input[type="checkbox"] {
  height: 40px;
  width: 40px;
  -webkit-appearance: none;
  box-shadow: 
    -10px -10px 15px rgba(255, 255, 255, 0.5),
    10px 10px 15px rgba(70, 70, 70, 0.12);
  position: absolute;
  transform: translate(-50%, -50%);
  top: 63.5%;
  left: 50%;
  border-radius: 50%;
  border: 5px solid linear-gradient(145deg, #f1f4fa, #cbcdd3);
  outline: none;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index:0;
  font-size:1.7rem;
  color:#717171;
}

input[type="checkbox"]:checked{
  box-shadow: 
  -10px -10px 15px rgba(255, 255, 255, 0.5),
  10px 10px 15px rgba(70, 70, 70, 0.12),
  inset -10px -10px 15px rgba(255, 255, 255, 0.5),
  inset 10px 10px 15px rgba(70, 70, 70, 0.12);
}


.button:hover{
    transform: scale(1.15);
    text-shadow:0px 0px 15px #1F51FF;
}

    
    </style>
    
    
    
    
   
  </head>
<body>
    <form action="Login" method="post">
        <span class="title">Sign In</span>
        <input type="email" name="pmail" id="mail" placeholder="Email Address">
        <input type="password" name="pwd" id="password" placeholder="Password">
        <div class="button">
            <input type="submit" value="Login" class="submit">
            <span class="rip1"></span>
            <span class="rip2"></span>
        </div>
        <div id="chak" class="button">
        <input type="checkbox" class="uil uil-user-circle" onclick="red()">
        </div>
        <%
        String error = request.getParameter("error");
        if (error != null && error.equals("1")) { 
    %>
        <p style="color: red;">Invalid Email/Password</p> 
    <%
        } 
    %>
        <div class="links">
            <a href="registration.jsp"><p>Create a New Account / Sign Up</p></a>
            <a href="forpp.jsp"><p>Forgot Your Password?</p></a>
        </div>
    </form>
    <script>
        function red() {
            window.location.href = "admin-login.jsp";
        }
    </script>
    
</body>
</html>