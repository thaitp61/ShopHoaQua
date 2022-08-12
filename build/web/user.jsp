<%-- 
    Document   : user
    Created on : Mar 8, 2022, 12:26:00 PM
    Author     : THAI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="thaitp.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER Page</title>
    </head>   
    <body>
        <c:if test="${not empty sessionScope.LOGIN_USER}">
            <h1> Welcome ${sessionScope.LOGIN_USER.fullName},</h1> 
            <form action="MainController">
                <input type="submit" name="action" value="Logout"/>
            </form>
        </c:if>
        <c:if test="${ empty sessionScope.LOGIN_USER}">
            <a href="login.jsp">Login</a><br/>
        </c:if>
        Cart
        <c:if test="${empty sessionScope.CART}">
            (0)
        </c:if>
        <c:if test="${not empty sessionScope.CART}">
            (${sessionScope.CART.amount})
        </c:if>
        <a href="cart.jsp">View Cart</a>
        <h2 style="color:green;">${INFO_MSG}</h2>
        <form action="MainController">
            Search<input type="text" name="search" value="${param.search}" />
            <input type="submit" name="action" value="Search"/>
        </form>
        <c:if test="${not empty LIST_PRODUCT}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${LIST_PRODUCT}" var="product" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>
                                ${product.productName}
                            </td>
                            <td>
                                <img width="120" src="${product.image}" />
                            </td>
                            <td>
                                ${product.price}
                            </td>
                            <td>
                                ${product.quantity}
                            </td>
                            <td>                 
                                ${product.category.name}
                            </td>
                            <td>
                                ${product.description}
                            </td>
                            <td>
                                <form action="MainController">
                                    <input type="submit" name="action" value="Add To Cart"/>
                                    <input type="hidden" name="productId" value="${product.productId}"/>
                                    <input type="hidden" name="search" value="${param.search}"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${empty LIST_PRODUCT and not empty param.search}">
                Not Found
            </c:if>
    </body>
</html>
