/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import category.CategoryDAO;
import com.google.gson.Gson;
import course.CourseDAO;
import course.CourseDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import level.LevelDAO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author 15tha
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    private final String CREATE_COURSE = "/WEB-INF/views/adminCreateCourse.jsp";
    private final String UPDATE_COURSE = "/WEB-INF/views/adminUpdateCourse.jsp";

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
            /* TODO output your page here. You may use following sample code. */
            UserDAO uDAO = new UserDAO();
            CourseDAO courseDAO = new CourseDAO();
            try {
                HttpSession session = request.getSession();
                UserDTO currentUser = (UserDTO) session.getAttribute("user");
                if (currentUser == null || !currentUser.getRole().equals("AD")) {
                    throw new NullPointerException("Not admin user");
                }
                String func = request.getParameter("func");
                if(func == null) {
                    func = "showCreate";
                }
                if (func.equals("showCreate") || func.equals("showUpdate")) {
                    
                    List<UserDTO> teacherList = uDAO.getAll().stream().filter(teacher -> teacher.getRole().equals("TC")).collect(Collectors.toList());
                    request.setAttribute("teacherList", teacherList);
                    request.setAttribute("cateList", new CategoryDAO().getAll());
                    request.setAttribute("levelList", new LevelDAO().getAll());
                    if(func.equals("showCreate")){
                        request.getRequestDispatcher(CREATE_COURSE).forward(request, response);
                        return;
                    }else if(func.equals("showUpdate")){
                        request.setAttribute("courseList", new Gson().toJson(courseDAO.getAll()));
                        request.getRequestDispatcher(UPDATE_COURSE).forward(request, response);
                    }
                } else {
                    CourseDTO c = new CourseDTO();
                    String[] duration = request.getParameter("duration").split(" - ");
                    SimpleDateFormat clientFormat = new SimpleDateFormat("dd/MM/yyyy");
                    Date startDate = clientFormat.parse(duration[0]);
                    Date endDate = clientFormat.parse(duration[0]);
                    String teacherIDStr = request.getParameter("teacherID");
                    c.setCourseName(request.getParameter("courseName"));
                    c.setTeacherID(Integer.parseInt(teacherIDStr));
                    c.setCategoryID(Integer.parseInt(request.getParameter("cateID")));
                    c.setDescription(request.getParameter("courseDesc"));
                    c.setSlot(Integer.parseInt(request.getParameter("slot")));
                    c.setTuitionFee(Double.parseDouble(request.getParameter("price")));
                    c.setImageUrl(request.getParameter("courseImg"));
                    c.setStartDate(startDate);
                    c.setEndDate(endDate);
                    c.setStatus("active");
                    c.setLevelID(Integer.parseInt(request.getParameter("levelID")));
                    c.setLastUpdateUser(currentUser.getUserID());
                    c.setLastUpdateDate(new Date());
                    
                    
                    
                    
                    
                    c.setCreatedAt(new Date());
                    switch (func) {
                        case "create": {
                            c.setSoldCount(0);
                            c.setCreatedBy(currentUser.getUserID());
                            c.setCreatedAt(new Date());
//                            courseDAO.create(c);
                            System.out.println(c);
                            response.sendRedirect("MainController?btnAction=admin&func=showCreate");
                            
                            break;
                        }
                        case "update": {
                            int courseID = Integer.parseInt(request.getParameter("courseID"));
                            CourseDTO oldCourse = courseDAO.find(courseID);
                            
                            c.setCourseID(courseID);
                            c.setSoldCount(oldCourse.getSoldCount());
                            c.setCreatedBy(oldCourse.getCreatedBy());
                            c.setCreatedAt(oldCourse.getCreatedAt());
//                            System.out.println(c);
//                            out.print(c);
                            courseDAO.upadte(c);
                            response.sendRedirect("MainController?btnAction=admin&func=showUpdate");
                            break;
                        }
                        default:
                            throw new AssertionError();
                    }
                }

            } catch (SQLException ex) {
                Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NullPointerException ex) {
                Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("login.jsp");
            } catch (ParseException ex) {
                Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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
