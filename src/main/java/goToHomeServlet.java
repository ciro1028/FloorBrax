/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Business.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/goToHomeServlet"})
public class goToHomeServlet extends HttpServlet {

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
            Order order = new Order();
            Installer installer = new Installer();
            Subdivision sub = new Subdivision();
            ArrayList<Order> todayOrders = new ArrayList();
            todayOrders = order.getTodayOrders();
            
            ArrayList todayInstallers = new ArrayList();
            for (Order ord : todayOrders) {
                installer.selectInstaller("id", String.valueOf(ord.getInstallerId()));
                todayInstallers.add(installer.getName());
            }
            ArrayList todaySubs = new ArrayList();
            for (Order ord : todayOrders) {
                sub.selectSubdivision("id", String.valueOf(ord.getSubdivision()));
                todaySubs.add(sub.getName());
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("todayOrders", todayOrders);
            session.setAttribute("todayInstallers", todayInstallers);
            session.setAttribute("todaySubs", todaySubs);
            
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
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
