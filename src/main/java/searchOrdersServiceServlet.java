/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Business.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/searchOrdersServiceServlet"})
public class searchOrdersServiceServlet extends HttpServlet {

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
            Service service = new Service();
            ArrayList<Order> orderList = new ArrayList();
            service.selectService("title", request.getParameter("service"));
            orderList = service.getOrdersList(String.valueOf(service.getId()));
            
            ArrayList installersOrdersSearchedByService = new ArrayList();
            for (Order order : orderList) {
                Installer installer = new Installer();
                installer.selectInstaller("id", String.valueOf(order.getInstallerId()));
                installersOrdersSearchedByService.add(installer.getName());
            }
            ArrayList subsOrdersSearchedByService = new ArrayList();
            for (Order order : orderList) {
                Subdivision sub = new Subdivision();
                sub.selectSubdivision("id", String.valueOf(order.getSubdivision()));
                subsOrdersSearchedByService.add(sub.getName());
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("orderList", orderList);
            session.setAttribute("installersOrdersSearchedByService", installersOrdersSearchedByService);
            session.setAttribute("subsOrdersSearchedByService", subsOrdersSearchedByService);
            
            RequestDispatcher rd = request.getRequestDispatcher("orderSearchByServiceResult.jsp");
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
