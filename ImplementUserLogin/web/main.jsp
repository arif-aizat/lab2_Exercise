<%-- 
    Document   : main
    Created on : 12 May 2026, 3:56:03 pm
    Author     : AIZAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <%
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if(username == null) {
            response.sendRedirect("login.jsp");
        } else {
    %>
        <h2>Welcome to the Main Page</h2>
        <p><b>Username:</b> <%= username %></p>
        <p><b>First Name:</b> <%= session.getAttribute("fname") %></p>
        <p><b>Last Name:</b> <%= session.getAttribute("lname") %></p>
        
        <br>
        <a href="logout.jsp">Logout</a>
    <% } %>
</body>
</html>