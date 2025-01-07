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
HttpSession s = request.getSession();

s.invalidate();

%>
	
<%--
    // Get the session object
    HttpSession s = request.getSession(false); // Use false to avoid creating a new session if none exists.

    // Example condition
    boolean shouldInvalidate = request.getParameter("logout") != null; // Example condition: logout parameter in the request

    if (shouldInvalidate) {
        if (s != null) {
            // Invalidate the session
            s.invalidate();
            out.println("Session invalidated successfully.");
        } else {
            out.println("No session to invalidate.");
        }
    } else {
        out.println("Session is still active.");
    }
--%>
		
		
		

</body>
</html>