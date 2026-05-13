<%-- 
    Document   : processUser
    Created on : 12 May 2026, 3:53:34 pm
    Author     : AIZAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<body>
    <%
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/CSF3107", "root", "");
            
            String sql = "INSERT INTO userprofile VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, fname);
            ps.setString(4, lname);
            
            int status = ps.executeUpdate();
            if(status > 0) {
                out.println("<h3>Registration Successful!</h3>");
                out.println("<a href='login.jsp'>Go to Login</a>");
            }
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if(conn != null) conn.close();
        }
    %>
</body>
</html>