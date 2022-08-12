/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thaitp.category.CategoryDTO;
import thaitp.product.ProductDAO;
import thaitp.product.ProductDTO;

/**
 *
 * @author THAI
 */
public class UpdateController extends HttpServlet {

    private static final String ERROR = "SearchController";
    private static final String SUCCESS = "SearchController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String errMsg = "";
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            if ("".equals(productName.trim())) {
                errMsg += "Product name cannot be blank.<br/>";
            }
            String priceTxt = request.getParameter("price");
            if ("".equals(priceTxt.trim())) {
                errMsg += "Price cannot be blank.<br/>";
            }
            String quantityTxt = request.getParameter("quantity");
            if ("".equals(quantityTxt.trim())) {
                errMsg += "Quantity cannot be blank.<br/>";
            }
            String catagoryID = request.getParameter("catagoryID");
            if ("".equals(catagoryID.trim())) {
                errMsg += "Category must be selected.<br/>";
            }
            String description = request.getParameter("description");
            if ("".equals(description.trim())) {
                errMsg += "Description cannot be blank.<br/>";
            }
            String importDateTxt = request.getParameter("importDate");
            if ("".equals(importDateTxt.trim())) {
                errMsg += "Import date cannot be blank.<br/>";
            }
            String usingDateTxt = request.getParameter("usingDate");
            if ("".equals(usingDateTxt.trim())) {
                errMsg += "Using date cannot be blank.<br/>";
            }
            long price = 0;
            try {
                price = Long.parseLong(priceTxt);
            } catch (NumberFormatException ex) {
                errMsg += "Invalid price.<br/>";
            }
            int quantity = 0;
            try {
                quantity = Integer.parseInt(quantityTxt);
            } catch (NumberFormatException ex) {
                errMsg += "Invalid quantity.<br/>";
            }
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date parsedDate;
            Timestamp importDate = null;
            try {
                parsedDate = dateFormat.parse(importDateTxt);
                importDate = new Timestamp(parsedDate.getTime());
            } catch (ParseException ex) {
                errMsg += "Invalid import date.<br/>";
            }
            Timestamp usingDate = null;
            try {
                parsedDate = dateFormat.parse(usingDateTxt);
                usingDate = new Timestamp(parsedDate.getTime());
            } catch (ParseException ex) {
                errMsg += "Invalid using date.<br/>";
            }
            if ("".equals(errMsg)) {
                ProductDAO dao = new ProductDAO();
                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.setId(catagoryID);
                String image = request.getParameter("image");
                ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, description, categoryDTO);
                boolean checkUpdate = dao.update(product);
                if (checkUpdate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR_MASSAGE", errMsg);
            }
        } catch (ClassNotFoundException | SQLException e) {
            log("Error at UpdateController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
