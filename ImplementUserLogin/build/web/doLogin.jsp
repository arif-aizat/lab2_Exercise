<%-- 
    Document   : doLogin
    Created on : 12 May 2026, 3:55:48 pm
    Author     : AIZAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/CSF3107", "root", "");
        
        String sql = "SELECT * FROM userprofile WHERE username=? AND password=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        ps.setString(2, pass);
        
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            // Success: Store user details in session
            session.setAttribute("username", rs.getString("username"));
            session.setAttribute("fname", rs.getString("firstname"));
            session.setAttribute("lname", rs.getString("lastname"));
            response.sendRedirect("main.jsp");
        } else {
            // Failure: Redirect back to login with error message
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(conn != null) conn.close();
    }
%>