<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registration form</title>
    <link rel="stylesheet" href="Style.css">
    <style>
    
        .image-upload-button {
            position: relative;
            margin-top: 2px;
            margin-bottom: 25px;
             
  		     cursor: pointer;
             font-weight: 800;
             letter-spacing: 0.8px;
             border-radius:20px;
             background: linear-gradient(to bottom right, #fff 0%, #c8d0e7 100%);
        }
        .image-upload-button input[type="file"] {
            display: none;
        }
        .image-upload-button label {
            display: inline-block;
            background: linear-gradient(to bottom right, #fff 0%, #c8d0e7 100%);
            color: #5a5a5a;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition:all 0.3s ease-in-out;
            box-shadow: var(--primary-box-shadow);
        }
        .image-upload-button label:hover {
            transform:scale(1.2);
            
        }
    </style>
</head>
<body>
    <form action="Reguser" method="post" enctype='multipart/form-data'>
        <span class="title">Create an Account</span>
        <input type="text" name="pname" id="name" placeholder="Full Name">
        <input type="email" name="pmail" id="mail" placeholder="Email Address">
        <input type="password" name="pwd" id="password" placeholder="password">
        <div class="image-upload-button">
            <input type="file" name="photo" id="profileImage" accept="image/*">
            <label for="profileImage">Choose Profile Image</label>
        </div>
        <div class="button">
            <input type="submit" value="Sign Up" class="submit">
            <span class="rip1"></span>
            <span class="rip2"></span>
        </div>
        <div class="links">
            <a href="login.jsp">Already have a Account?</a>
        </div>
    </form>
</body>
</html>