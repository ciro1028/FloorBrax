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
@WebServlet(urlPatterns = {"/installerSearchOrdersServlet"})
public class installerSearchOrdersServlet extends HttpServlet {

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
            Installer installer = new Installer();
            Subdivision sub = new Subdivision();
            ArrayList<Order> orderList = new ArrayList();
            ArrayList orderSubs = new ArrayList();
            installer = (Installer)session.getAttribute("installer");
            
            int id = installer.getId();
            String date = request.getParameter("reportrange");
            String[] dateArray = date.split(" - ");
            
            String[] startArray = dateArray[0].split("/");
            String start = startArray[2] + "/" + startArray[0] + "/" + startArray[1];
            String[] endArray = dateArray[1].split("/");
            String end = endArray[2] + "/" + endArray[0] + "/" + endArray[1];
            
            orderList = installer.getOrdersByDate(id, start, end);
            
            for (int i = 0; i < orderList.size(); i++) {
                sub.selectSubdivision("id", orderList.get(i).getSubdivision());
                orderSubs.add(sub.getName());
            }
            
            int total = 0;
            for (Order order : orderList) {
                total += order.getToPay();
            }
            session.setAttribute("orderSubs", orderSubs);
            session.setAttribute("installer", installer);
            session.setAttribute("orderList", orderList);
            session.setAttribute("rangeSelected", date);
            session.setAttribute("total", total);
            
            RequestDispatcher rd = request.getRequestDispatcher("installer/InstallerView.jsp");
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
