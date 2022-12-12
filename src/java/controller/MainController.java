/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import category.CategoryDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 15tha
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private final String HOME_CONTROLLER = "HomeController";
    private final String LOGIN_CONTROLLER = "LoginController";
    private final String SEARCH_CONTROLLER = "SearchController";
    private final String CART_CONTROLLER = "CartController";
    private final String PRODUCT_DETAIL_CONTROLLER = "CourseDetailController";
    private final String LOGOUT_CONTROLLER = "LogoutController";
    private final String ADMIN_CONTROLLER = "AdminController";
    private final String AJAX_CONTROLLER = "AjaxController";
    private final String TRACKING_CONTROLLER = "TrackingController";

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
        String action = request.getParameter("btnAction");
        try {
            request.setAttribute("Category", new CategoryDAO().getAll());
        } catch (SQLException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String url = HOME_CONTROLLER;
        if (action == null || action.isEmpty()) {
            action = "home";
        } else {
            action = action.toLowerCase();
        }
        System.out.println("action: " + action);
        switch (action) {
            case "login": {
                url = LOGIN_CONTROLLER;
                break;
            }
            case "home": {
                url = HOME_CONTROLLER;
                break;
            }
            case "search": {
                url = SEARCH_CONTROLLER;
                break;
            }
            case "detail": {
                url = PRODUCT_DETAIL_CONTROLLER;
                break;
            }
            case "cart": {
                url = CART_CONTROLLER;
                break;
            }case "logout": {
                url = LOGOUT_CONTROLLER;
                break;
            }case "admin": {
                url = ADMIN_CONTROLLER;
                break;
            }case "ajax": {
                url = AJAX_CONTROLLER;
            }
            case "tracking": {
                url = TRACKING_CONTROLLER;
            }
        }
        request.getRequestDispatcher(url).forward(request, response);
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
