/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import category.CategoryDAO;
import category.CategoryDTO;
import course.CourseDAO;
import course.CourseDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import level.LevelDAO;
import level.LevelDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author ADmin
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    private final int COURSE_PER_PAGE = 20;
    private final String SEARCH_PAGE = "/WEB-INF/views/searchResult.jsp";
//    private final String DETAIL_PAGE = "/WEB-INF/views/detail.jsp";

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
        int limit = COURSE_PER_PAGE;
        int skip;
        String searchValue = request.getParameter("searchValue");

        if (searchValue != null) {
            int page;
            if (request.getParameter("page") == null) {
                page = 1;
            } else {
                page = Integer.parseInt(request.getParameter("page"));
            }

            if (page == 1) {
                skip = 0;

                getSearchValue(searchValue, skip, limit, request, response);
            } else {
                skip = (page - 1) * 20;
                getSearchValue(searchValue, skip, limit, request, response);
            }
        }

        if (request.getParameter("cateId") != null) {

            int cateId = Integer.parseInt(request.getParameter("cateId"));
            int page;
            if (request.getParameter("page") == null) {
                page = 1;
            } else {
                page = Integer.parseInt(request.getParameter("page"));
            }

            if (page == 1) {
                skip = 0;
                getCourseCate(cateId, skip, limit, request, response);

            } else {
                skip = (page - 1) * 20;
                getCourseCate(cateId, skip, limit, request, response);
            }
        }
    }

    protected void getSearchValue(String searchValue, int skip, int limit, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int Numpage;
            List<UserDTO> teacherList = new ArrayList<>();
            List<LevelDTO> levelList = new ArrayList<>();
            List<CategoryDTO> cateList = new ArrayList<>();
            UserDAO uDAO = new UserDAO();

            List<CourseDTO> dto = new CourseDAO().findByName(searchValue, skip, limit);
            int course = (int) new CourseDAO().CountByName(searchValue);
            if (course > 20) {
                Numpage = course / 20;
                if (course % 20 > 0) {
                    Numpage++;
                }
            } else {
                Numpage = 0;
            }
            for (CourseDTO c : dto) {
                teacherList.add(uDAO.find(Integer.toString(c.getTeacherID())));
                levelList.add(new LevelDAO().find(c.getLevelID()));
                cateList.add(new CategoryDAO().find(c.getCategoryID()));
            }

            request.setAttribute("teacherList", teacherList);
            request.setAttribute("levelList", levelList);
            request.setAttribute("cateList", cateList);

            request.setAttribute("Category", new CategoryDAO().getAll());
            request.setAttribute("Numpage", Numpage);
            request.setAttribute("list", dto);
            request.setAttribute("searchValue", searchValue);

            request.getRequestDispatcher(SEARCH_PAGE).forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void getCourseCate(int cateId, int skip, int limit, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            int Numpage;
            List<UserDTO> teacherList = new ArrayList<>();
            List<LevelDTO> levelList = new ArrayList<>();
            List<CategoryDTO> cateList = new ArrayList<>();
            UserDAO uDAO = new UserDAO();

            List<CourseDTO> dto = new CourseDAO().findByCate(cateId, skip, limit);
            int course = (int) new CourseDAO().CountByCate(cateId);
            System.out.println(cateId);
            System.out.println(course);
            if (course > 20) {
                Numpage = course / 20;
                if (course % 20 > 0) {
                    Numpage++;
                }
            } else {
                Numpage = 0;
            }

            for (CourseDTO c : dto) {
                teacherList.add(uDAO.find(Integer.toString(c.getTeacherID())));
                levelList.add(new LevelDAO().find(c.getLevelID()));
                cateList.add(new CategoryDAO().find(c.getCategoryID()));
            }
            request.setAttribute("teacherList", teacherList);
            request.setAttribute("levelList", levelList);
            request.setAttribute("cateList", cateList);
            
            request.setAttribute("Category", new CategoryDAO().getAll());
            request.setAttribute("Numpage", Numpage);
            request.setAttribute("list", dto);
            request.setAttribute("cateId", cateId);
            request.getRequestDispatcher(SEARCH_PAGE).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
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
