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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADmin
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    private final int COURSE_PER_PAGE = 20;
    private final String SEARCH_PAGE = "/WEB-INF/views/searchResult.jsp";
    private final String DETAIL_PAGE = "/WEB-INF/views/detail.jsp";
    private final String ErroPage = "/WEB-INF/views/Error.jsp";

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
        String url = ErroPage;
        String searchValue = request.getParameter("searchValue");
        if (searchValue != null) {
            int Numpage;
            int page;
            if (request.getParameter("page") == null) {
                page = 1;
            } else {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int skip, limit;
            if (page == 1) {
                skip = 0;
                limit = COURSE_PER_PAGE;
                try {
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
                    request.setAttribute("Category", new CategoryDAO().getAll());
                    request.setAttribute("Numpage", Numpage);
                    request.setAttribute("list", dto);
                    request.setAttribute("searchValue", searchValue);
                    url = SEARCH_PAGE;
                    request.getRequestDispatcher(url).forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                skip = (page - 1) * 20;
                limit = COURSE_PER_PAGE;
                try {
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
                    request.setAttribute("Category", new CategoryDAO().getAll());
                    request.setAttribute("Numpage", Numpage);
                    request.setAttribute("list", dto);
                    request.setAttribute("searchValue", searchValue);
                    url = SEARCH_PAGE;

                } catch (SQLException ex) {
                    Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        if (request.getParameter("cateId") != null) {
            
            int cateId = Integer.parseInt(request.getParameter("cateId"));
            int Numpage;
            int page;
            if (request.getParameter("page") == null) {
                page = 1;
            } else {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int skip, limit;
            System.out.println(page);
            if (page == 1) {
                skip = 0;
                limit = COURSE_PER_PAGE;
                try {
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
                    request.setAttribute("Category", new CategoryDAO().getAll());
                    request.setAttribute("Numpage", Numpage);
                    System.out.println(Numpage);
                    request.setAttribute("list", dto);
                    request.setAttribute("cateId", cateId);
                    url = SEARCH_PAGE;
                    request.getRequestDispatcher(url).forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                skip = (page - 1) * 20;
                limit = COURSE_PER_PAGE;
                try {
                    List<CourseDTO> dto = new CourseDAO().findByCate(cateId, skip, limit);
                    int course = (int) new CourseDAO().CountByCate(cateId);
                    if (course > 20) {
                        Numpage = course / 20;
                        if (course % 20 > 0) {
                            Numpage++;
                        }
                    } else {
                        Numpage = 0;
                    }
                    request.setAttribute("Category", new CategoryDAO().getAll());
                    request.setAttribute("Numpage", Numpage);
                    request.setAttribute("list", dto);
                    request.setAttribute("cateId", cateId);
                    url = SEARCH_PAGE;

                } catch (SQLException ex) {
                    Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
                }
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
