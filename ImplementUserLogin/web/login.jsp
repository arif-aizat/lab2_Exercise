<%-- 
    Document   : login
    Created on : 12 May 2026, 3:55:27 pm
    Author     : AIZAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login System</h2>
    <%-- Display error message if redirecting from failed login --%>
    <% if(request.getParameter("msg") != null) { %>
        <p style="color:red;"><%= request.getParameter("msg") %></p>
    <% } %>

    <form action="doLogin.jsp" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>