<%-- 
    Document   : login
    Created on : Mar 8, 2022, 1:32:27 PM
    Author     : THAI
--%>


<%@page import="thaitp.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser != null) {
                response.sendRedirect("HomeController");
                return;
            }
        %>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required="" value="admin"/></br>
            Password<input type="password" name="password" required="" value="1"/></br>
            <input type="submit" name="action"  value="Login"/>
            <input type="reset" value="Reset"/>
        </form>
        <a href="signup.jsp">Sign Up</a>
        <a href="user.jsp">Shopping</a>
        ${requestScope.ERROR}
    </body>
</html>