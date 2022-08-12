/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaitp.cart.CartEntity;
import thaitp.product.ProductDAO;
import thaitp.product.ProductDTO;
import thaitp.util.StringUtils;
import thaitp.util.ValidationUtils;

/**
 *
 * @author THAI
 */
public class UpdateCartController extends HttpServlet {

    private final String CART_PAGE = "cart.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String productId = request.getParameter("productId");
        String amountText = request.getParameter("cartAmount");

        int amount = -1;

        String url = CART_PAGE;

        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                CartEntity cart = (CartEntity) session.getAttribute("CART");
                if (cart != null) {
                    if (StringUtils.isNotEmpty(amountText)
                            && ValidationUtils.isValidNumber(amountText)) {
                        amount = Integer.parseInt(amountText);
                    }
                    if (StringUtils.isNotEmpty(productId) && amount != -1) {
                        ProductDAO dao = new ProductDAO();
                        ProductDTO dto = dao.getProductInfo(productId);
                        if (Objects.nonNull(dto)) {
                            int maxAmount = dto.getQuantity();
                            if (maxAmount >= amount) {
                                cart.updateAmount(productId, amount, maxAmount);
                                session.setAttribute("CART", cart);
                            } else {
                                cart.setAmountError(productId, "Only " + maxAmount + " product(s) left");
                            }
                        } else {
                            cart.setAmountError(productId, "Product not found");
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            log("Error at UpdateCartController:" + e.toString());
        } finally {
            response.sendRedirect(url);
            out.close();
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
