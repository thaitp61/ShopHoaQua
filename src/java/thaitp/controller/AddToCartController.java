/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaitp.cart.CartEntity;
import thaitp.product.ProductDAO;
import thaitp.product.ProductDTO;

/**
 *
 * @author THAI
 */
public class AddToCartController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String productId = request.getParameter("productId");
        String searchText = request.getParameter("search");

        String url = "MainController?action=Search&search=" + searchText;

        boolean result = false;

        try {
            if (productId != null && productId.trim().length() != 0) {
                HttpSession session = request.getSession();

                CartEntity cart = (CartEntity) session.getAttribute("CART");
                if (cart == null) {
                    cart = new CartEntity();
                }
                ProductDAO dao = new ProductDAO();
                ProductDTO dto = dao.getProductInfo(productId);
                if (dto != null) {
                    result = cart.addItemToCart(dto.getProductId(), dto.getProductName(), dto.getPrice(), dto.getQuantity());
                    session.setAttribute("CART", cart);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            log("Error at AddToCartController:" + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(url);
            } else {
                request.setAttribute("ERROR_ADD", "Fail to add selected cake to cart");
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
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
