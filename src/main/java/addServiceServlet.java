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
import Business.Service;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/addServiceServlet"})
public class addServiceServlet extends HttpServlet {

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
            String title = request.getParameter("title");
            String description = request.getParameter("desc");
            int price = Integer.parseInt(request.getParameter("price"));
            int pricePay = Integer.parseInt(request.getParameter("pricePay"));
            double priceSqf = Double.parseDouble(request.getParameter("priceSqf"));
            double priceSqfPay = Double.parseDouble(request.getParameter("pricePaySqf"));
            double priceDitra = Double.parseDouble(request.getParameter("priceDitra"));
            double pricePayDitra = Double.parseDouble(request.getParameter("pricePayDitra"));
            
            service.deleteService(title);
            
            service.insertService(title, description, price, pricePay, priceSqf, priceSqfPay, priceDitra, pricePayDitra);
            
            service.selectService("title", title);
            HttpSession session = request.getSession();
            session.setAttribute("service", service);
            ArrayList<Service> listOfServices = new ArrayList();
            listOfServices = service.selectAllServices();
            
            session.setAttribute("listOfServices", listOfServices);
            RequestDispatcher rd = request.getRequestDispatcher("service/serviceAdded.jsp");
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
