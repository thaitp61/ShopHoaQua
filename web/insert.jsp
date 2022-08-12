<%-- 
    Document   : insert
    Created on : Mar 11, 2022, 12:52:32 AM
    Author     : THAI
--%>

<%@page import="thaitp.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <c:url var="back" value="MainController">
            <c:param name="search" value="${param.search}" />
            <c:param name="action" value="Search" />
        </c:url>
        <a href="${back}">Trở lại</a><br/>
        ${requestScope.ERROR_MASSAGE}
        <form action="MainController" method="POST">
            <input type="hidden" name="search" value="${param.search}" />
            ID: <input type="text" name="productID" value="${param.productID}" /><br/>
            Name: <input type="text" name="productName" value="${param.productName}" /><br/>
            Price: <input type="text" name="price" value="${param.price}" /><br/>
            Quantity: <input type="text" name="quantity" value="${param.quantity}" /><br/>
            Category:
            <select name="catagoryID">
                <c:forEach items="${LIST_CATEGORY}" var="category">
                    <option value="${category.id}" 
                            <c:if test="${category.id eq param.catagoryID}">selected</c:if>>${category.name}</option>    
                </c:forEach>
            </select><br/>
            Description: <input type="text" name="description" value="${param.description}" /><br/>
            Import date: <input type="date" name="importDate" value="${param.importDate}" /><br/>
            Using date: <input type="date" name="usingDate" value="${param.usingDate}" /><br/>
            <input type="submit" value="Insert" name="action" />
        </form>
    </body>
</html>
