/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import course.CourseDAO;
import course.CourseDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.OrderDAO;
import order.OrderDTO;
import order_item.OrderItemDTO;
import password.PasswordGenerator;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author 15tha
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    private final String SHOW_CART_PAGE = "/WEB-INF/views/showCart.jsp";
    private final String LOGIN_PAGE = "login.jsp";

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            OrderDTO cart = (OrderDTO) session.getAttribute("cart");
            if (cart == null) {
                cart = new OrderDTO();
                List<OrderItemDTO> newList = new ArrayList<>();
                cart.setItems(newList);
                session.setAttribute("cart", cart);
                System.out.println("1");
            }

            String action = request.getParameter("func");
            if (action != null) {
                switch (action) {
                    case "add": {
                        OrderItemDTO newItem = new OrderItemDTO();
                        String courseIDStr = request.getParameter("id");
                        if (courseIDStr == null) {
                            return;
                        }
                        int courseID = Integer.parseInt(courseIDStr);
                        newItem.setCourseID(courseID);
                        double price = new CourseDAO().find(courseID).getTuitionFee();
                        newItem.setPrice(price);
                        newItem.setQuantity(1);
                        ArrayList tmpList = (ArrayList) cart.getItems();
                        tmpList.add(newItem);
                        cart.setItems(tmpList);
                        System.out.println(cart.getItems());
                        break;
                    }
                    case "showCart": {
                        System.out.println("1");
                        request.setAttribute("cartList", cart.getItems());
                        ArrayList<CourseDTO> courseList = new ArrayList<>();
                        ArrayList<UserDTO> teacherList = new ArrayList<>();
                        CourseDAO courseDAO = new CourseDAO();
                        UserDAO userDAO = new UserDAO();
                        for (OrderItemDTO item : cart.getItems()) {
                            CourseDTO currentCourse = courseDAO.find(item.getCourseID());
                            courseList.add(currentCourse);
                            teacherList.add(
                                    userDAO.find(
                                            Integer.toString(
                                                    currentCourse.getTeacherID()
                                            )
                                    )
                            );
                        }
                        System.out.println(cart.getItems());
                        request.setAttribute("courseList", courseList);
                        request.setAttribute("teacherList", teacherList);
                        request.getRequestDispatcher(SHOW_CART_PAGE).forward(request, response);
                        break;
                    }
                    case "delete": {
                        String courseIdStr = request.getParameter("id");
                        int courseId = 0;
                        if (courseIdStr != null) {
                            courseId = Integer.parseInt(courseIdStr);
                        }
                        if (cart == null) {
                            return;
                        }
                        List<OrderItemDTO> itemList = cart.getItems();
                        for (OrderItemDTO item : itemList) {
                            if (item.getCourseID() == courseId) {
                                itemList.remove(item);
                            }
                        }
                        session.setAttribute("cart", cart);
                        break;
                    }
                    case "pay": {

                        String email = request.getParameter("email");
                        String fullName = request.getParameter("fullName");
                        String phone = request.getParameter("phone");
                        int userID = 0;
                        if (email.isEmpty() || fullName.isEmpty() || phone.isEmpty() || email == null) {
                            UserDTO user = (UserDTO) session.getAttribute("user");
                            if (user == null) {
                                response.sendRedirect(LOGIN_PAGE);
                                return;
                            }
                            cart.setUserID(user.getUserID());
                            userID = user.getUserID();
                        } else {
                            UserDAO userDAO = new UserDAO();
                            UserDTO u = new UserDTO();
                            u.setEmail(email);
                            u.setFullName(fullName);
                            u.setPhone(phone);
                            u.setUsername(UUID.randomUUID().toString());
                            PasswordGenerator passwordGenerator = new PasswordGenerator.PasswordGeneratorBuilder()
                                    .useDigits(true)
                                    .useLower(true)
                                    .useUpper(true)
                                    .build();
                            u.setPassword(passwordGenerator.generate(16));
                            userDAO.create(u);
                            userID = userDAO.findID(u);
                        }
                        System.out.println("1123123");
                        cart.setTotalPrice(Integer.parseInt(request.getParameter("total")));
                        cart.setUserID(userID);
                        cart.setPaymentMethod(request.getParameter("paymentMethod"));
                        cart.setPaymentStatus("1");
                        cart.setBuyDate(new Date());
                        OrderDAO oDAO = new OrderDAO();
                        boolean result = oDAO.createOrder(cart);
                        if (result) {
                            cart = null;
                            out.print(result);
                        }
                        break;
//                        cart.setPaymentMethod(action);

                    }
                }
            }
//            request.getRequestDispatcher("/MainController?id=36&btnAction=detail").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
