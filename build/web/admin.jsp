<%-- 
    Document   : admin
    Created on : Mar 8, 2022, 12:21:59 PM
    Author     : THAI
--%>

<%@page import="thaitp.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="thaitp.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <h1> Wellcome  <%= loginUser.getFullName()%></h1>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
    </form>
    <form action="MainController">
        Search<input type="text" name="search" value="<%= search%>" />
        <input type="submit" name="action" value="Search"/>
    </form>
    <c:url var="insert" value="PreInsertController">
        <c:param name="search" value="${param.search}" />
    </c:url>
    <a href="${insert}">Thêm mới</a>
    <%
        List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
        if (list != null) {
            if (!list.isEmpty()) {
    %>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>productID</th>
                <th>producctName</th>
                <th>image</th>
                <th>price</th>
                <th>quantity</th>
                <th>catagoryID</th>
                <th>Description</th>
                <th>importDate</th>
                <th>usingDate</th>
                <th>Delete</th>
                <th>Update</th>

            </tr>
        </thead>

        <tbody>
            <%
                int count = 1;
                for (ProductDTO user : list) {
            %>
            <form action="MainController" method="POST">
            <tr>
                <td><%= count++%></td>
                <td>
                    <%= user.getProductId()%>
                </td>
                <td>
                    <input type="text" name="productName" value="<%= user.getProductName()%>"/>
                </td>
                <td>
                    <input type="hidden" name="image" value="<%= user.getImage()%>"/>
                    <img width="120" src="<%= user.getImage()%>" />
                </td>
                <td>
                    <input type="text" name="price" value="<%= user.getPrice()%>"/>
                </td>
                <td>
                    <input type="text" name="quantity" value="<%= user.getQuantity()%>"/>
                </td>
                <td>                 
                    <input type="text" name="catagoryName" value="<%= user.getCategory().getName()%>"/>
                    <input type="hidden" name="catagoryID" value="<%= user.getCategory().getId()%>"/>
                </td>
                <td>
                    <input type="text" name="description" value="<%= user.getDescription()%>"/>
                </td>
                <td>
                    <input type="text" name="importDate" value="<%= user.getImportDate()%>"/>
                </td>
                <td>
                    <input type="text" name="usingDate" value="<%= user.getUsingDate()%>"/>
                </td>
                <td>
                    <a href="MainController?&productID=<%= user.getProductId()%>&action=Delete&search=<%= search%>">Delete</a>
                </td>
                <td>
                    <input type="submit" name="action" value="Update"/>
                    <input type="hidden" name="productID" value="<%= user.getProductId()%>"/>
                    <input type="hidden" name="search" value="<%= search%>"/>
                </td>
            </tr>
        </form>
        <%
            }
        %>

    </tbody>
</table>

<%
    String error = (String) request.getAttribute("ERROR_MASSAGE");
    if (error == null) {
        error = "";
    }
%>

<%= error%>

<%
        }
    }
%>

</body>
</html>
