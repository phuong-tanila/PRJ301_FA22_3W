/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import category.CategoryDAO;
import course.CourseDAO;
import course.CourseDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import level.LevelDAO;
import order.OrderDTO;
import order_item.OrderItemDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author 15tha
 */
@WebServlet(name = "CourseDetailController", urlPatterns = {"/CourseDetailController"})
public class CourseDetailController extends HttpServlet {

    private final String DETAIL_PAGE = "/WEB-INF/views/detail.jsp";
    private final String INVALID_PAGE = "404.html";

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
        String url = INVALID_PAGE;
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String idStr = request.getParameter("id");
            int courseID = 0;
            if (idStr != null) {
                courseID = Integer.parseInt(idStr);
                CourseDTO course = new CourseDAO().find(courseID);
                OrderDTO cart = (OrderDTO) session.getAttribute("cart");
                boolean inCart = false;
                if (cart != null) {
                    for (OrderItemDTO item : cart.getItems()) {
                        if (item.getCourseID() == courseID) {
                            inCart = true;
                        }
                    }
                }
                request.setAttribute("inCart", inCart);
                request.setAttribute("course", course);
                request.setAttribute("level", new LevelDAO().find(course.getLevelID()));
                request.setAttribute("category", new CategoryDAO().find(course.getCategoryID()));
                UserDTO user = new UserDAO().find(Integer.toString(course.getTeacherID()));
                UserDTO user2 = new UserDAO().find(Integer.toString(course.getCreatedBy()));
                request.setAttribute("teacherName", user.getFullName());
                request.setAttribute("createdBy", user2.getFullName());
                url = DETAIL_PAGE;
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CourseDetailController.class.getName()).log(Level.SEVERE, null, ex);
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
