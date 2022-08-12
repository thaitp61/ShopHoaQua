/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaitp.controller;

import java.io.IOException;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author THAI
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SIGN_UP = "Sign Up";
    private static final String SIGN_UP_CONTROLLER = "SignupController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String INSERT = "Insert";
    private static final String INSERT_CONTROLLER = "InsertController";
    private static final String ADD_TO_CART = "Add To Cart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String UPDATE_CART = "Update Cart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String DELETE_CART = "Delete Cart";
    private static final String DELETE_CART_CONTROLLER = "RemoveCartController";
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (Objects.isNull(action)) {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "Function is not avaiable");
            } else {
                switch (action) {
                    case LOGIN:
                        url = LOGIN_CONTROLLER;
                        break;
                    case SIGN_UP:
                        url = SIGN_UP_CONTROLLER;
                        break;
                    case SEARCH:
                        url = SEARCH_CONTROLLER;
                        break;
                    case LOGOUT:
                        url = LOGOUT_CONTROLLER;
                        break;
                    case DELETE:
                        url = DELETE_CONTROLLER;
                        break;
                    case UPDATE:
                        url = UPDATE_CONTROLLER;
                        break;
                    case INSERT:
                        url = INSERT_CONTROLLER;
                        break;
                    case ADD_TO_CART:
                        url = ADD_TO_CART_CONTROLLER;
                        break;
                    case UPDATE_CART:
                        url = UPDATE_CART_CONTROLLER;
                        break;
                    case DELETE_CART:
                        url = DELETE_CART_CONTROLLER;
                        break;
                    case CHECKOUT:
                        url = CHECKOUT_CONTROLLER;
                        break;
                    default:
                        HttpSession session = request.getSession();
                        session.setAttribute("ERROR_MESSAGE", "Function is not avaiable");
                        break;
                }
            }
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
