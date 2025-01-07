<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	
	response.setHeader("Expires", "0"); //proxies

	if(session.getAttribute("pemail")==null ){
		response.sendRedirect("login.jsp");
	}
	//else {
        // User is logged in, display content
        //out.println("Welcome, " + session.getAttribute("peamil"));
    //}
	//else if(session.getAttribute("peamil")!=null && session.getAttribute("pw")!=null){
		//response.sendRedirect("index.jsp");
	//}
	

%>
	<form  method="post"  action="File_search" >
     
                    <label for="name"><b>PRODUCT NAME: </b></label>
                    <input  name="pdname" type="text" placeholder="Name of the Product" required/>


        <button type="submit" class="btn btn-primary btn-block text-uppercase">Download Product image</button>
	</form>
</body>
</html>