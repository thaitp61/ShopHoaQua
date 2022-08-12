<%-- 
    Document   : signup
    Created on : Mar 12, 2022, 11:03:08 PM
    Author     : THAI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
    </head>
    <body>
        <form action="MainController" method="post" class="form-signup">
            Username: <input name="user" type="text" required="" autofocus="" value="${param.user}"><br/>
            Password: <input name="pass" type="password" placeholder="Password" required autofocus="" value="${param.pass}"><br/>
            Repass: <input name="repass" type="password" placeholder="Repeat Password" required autofocus=""><br/>
            Full name <input name="name" type="text" required="" autofocus="" value="${param.name}"><br/>
            Email <input name="email" type="email" required="" autofocus="" value="${param.email}"><br/>
            Phone <input name="phone" type="text" required="" autofocus="" value="${param.phone}"><br/>
            Address <input name="address" type="text" required="" autofocus="" value="${param.address}"><br/>
            <input type="hidden" name="action" value="Sign Up" />
            <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i>Sign Up</button>
            <a href="login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i>Back</a>
        </form>
    </body>
</html>
