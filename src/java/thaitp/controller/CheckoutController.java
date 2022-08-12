/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.Objects;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaitp.cart.CartDetails;
import thaitp.cart.CartEntity;
import thaitp.order.OrderDAO;
import thaitp.order.OrderDTO;
import thaitp.orderdetail.OrderDetailDAO;
import thaitp.product.ProductDAO;
import thaitp.product.ProductDTO;
import thaitp.user.UserDTO;

/**
 *
 * @author THAI
 */
public class CheckoutController extends HttpServlet {

    private final String SUCCES_PAGE = "HomeController";
    private final String ERROR_PAGE = "cart.jsp";
    private final String OUT_STOCK_PAGE = "cart.jsp";

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
        String url = ERROR_PAGE;

        try {
            HttpSession session = request.getSession(false);
            if (Objects.nonNull(session)) {
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (Objects.nonNull(user)) {
                    CartEntity cart = (CartEntity) session.getAttribute("CART");
                    if (Objects.nonNull(cart)) {
                        // Check all amount of products
                        Map<String, CartDetails> items = cart.getItems();
                        ProductDAO productDao = new ProductDAO();
                        boolean isAllValid = true;
                        if (items != null) {
                            for (String key : items.keySet()) {
                                CartDetails detail = items.get(key);
                                ProductDTO dto = productDao.getProductInfo(key);
                                int maxAmount = 0;
                                if (Objects.nonNull(dto) && dto.isStatus()) {
                                    maxAmount = dto.getQuantity();
                                }
                                detail.setMaxAmount(maxAmount);
                                if (maxAmount < detail.getAmount()) {
                                    detail.setCartErr("Only " + maxAmount + " product(s) left");
                                    cart.updateItem(key, detail);
                                    isAllValid = false;
                                }
                            }
                            if (isAllValid) {
                                OrderDAO orderDao = new OrderDAO();
                                Timestamp date = new Timestamp(new Date().getTime());
                                OrderDTO orderDto = new OrderDTO(user.getUserID(), cart.getTotal(), date, false);
                                int orderId = orderDao.addNewOrder(orderDto);
                                if (orderId != -1) {
                                    OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                                    boolean result = orderDetailDao.addProductToOrder(orderId, items);
                                    if (result) {
                                        orderDao.updateOrderStatus(orderId, true);
                                        url = SUCCES_PAGE;
                                        session.removeAttribute("CART");
                                    } else {
                                        url = OUT_STOCK_PAGE;
                                    }
                                }
                            } else {
                                url = OUT_STOCK_PAGE;
                                request.setAttribute("CHECKOUT_ERR", "Out of stock product");
                            }
                        }
                    }
                } else {
                    request.setAttribute("CHECKOUT_ERR", "Please login to checkout");
                }
            }
            if (ERROR_PAGE.equals(url)) {
                request.setAttribute("CHECKOUT_ERR", "Error while checking out your cart, please try again");
            } else if (SUCCES_PAGE.equals(url)) {
                request.setAttribute("INFO_MSG", "Checkout successfully");
            }
        } catch (SQLException | ClassNotFoundException e) {
            log("Error at CheckoutController:" + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
