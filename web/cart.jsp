<%-- 
    Document   : cart
    Created on : Mar 12, 2022, 8:26:50 PM
    Author     : THAI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>
        <h1>Your cart</h1>
        <a href="HomeController">Back to home</a><br/>
        <br/>
        <c:if test="${empty sessionScope.CART}">
            Your cart is empty
        </c:if>
        <c:if test="${not empty sessionScope.CART}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Unit price</th>
                        <th>Sub total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <form action="MainController">
                    <c:set value="${sessionScope.CART}" var="cartEntity" />
                    <c:forEach items="${cartEntity.items}" var="item" varStatus="counter">
                        <form action="MainController">
                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    ${item.value.name}
                                </td>
                                <td>
                                    <input type="number" min="0" name="cartAmount" value="${item.value.amount}" />
                                    <br/>${item.value.cartErr}
                                </td>
                                <td>
                                    ${item.value.price}
                                </td>
                                <td>
                                    ${item.value.subTotal}
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Update Cart"/>
                                    <input type="submit" name="action" value="Delete Cart"/>
                                    <input type="hidden" name="productId" value="${item.key}"/>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </form>
                <tr>
                    <th colspan="2">Total</th>
                    <th>${cartEntity.amount}</th>
                    <th colspan="2">${cartEntity.total}</th>
                    <th colspan="2"></th>
                </tr>
            </tbody>
        </table>
        <br/>
        <c:if test="${not empty sessionScope.LOGIN_USER}">
            <form action="MainController">
                Full Name: ${sessionScope.LOGIN_USER.fullName}<br/>
                Address: ${sessionScope.LOGIN_USER.addreess}<br/>
                Email: ${sessionScope.LOGIN_USER.email}<br/>
                Phone: ${sessionScope.LOGIN_USER.phone}<br/>
                <input type="radio" id="shipMethod" name="shipMethod" value="cod" checked="checked"/>
                <label for="shipMethod">Ship COD</label><br>
                <input type="submit" name="action" value="Checkout"/>
            </form>
        </c:if>
        <c:if test="${ empty sessionScope.LOGIN_USER}">
            <h2>Please login to checkout</h2>
            <a href="login.jsp">Login</a>
        </c:if>
    </c:if>
</body>
</html>
