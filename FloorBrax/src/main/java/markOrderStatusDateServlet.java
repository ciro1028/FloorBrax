/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Business.*;
import Business.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.security.pkcs11.wrapper.Functions;

/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/markOrderStatusDateServlet"})
public class markOrderStatusDateServlet extends HttpServlet {

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
            Order order = new Order();
            Service service = new Service();
            String num = request.getParameter("id");
            order.selectRawOrderData("order_num", num);
            String checkStatus = order.getStatus();

            String newStatus = (checkStatus.equals("Pending")) ? "Completed" : "Pending";
            String services = "";
            
            String[] strSvcArray = order.getServices();
            for (int i = 0; i < strSvcArray.length; i++) {
                service.selectService("title", strSvcArray[i]);
                services += service.getId() + " ";
            }
            
            order.updateOrder(order.getOrderNum(), order.getInstallerId(), order.getDescription(), order.getDate(), 
                    newStatus, order.getSubdivision(), order.getPic(), order.getTotal(), order.getToPay(), services,
                    order.getSquareFootage(), order.getUser(), order.getExtraPrice(), order.getSqfDitra(), order.getSqfHardwood());
            
            ArrayList<Order> orderList = new ArrayList();
            String date = (String)session.getAttribute("rangeSelected");
            String[] dateArray = date.split(" - ");
            
            String[] startArray = dateArray[0].split("/");
            String start = startArray[2] + "/" + startArray[0] + "/" + startArray[1];
            String[] endArray = dateArray[1].split("/");
            String end = endArray[2] + "/" + endArray[0] + "/" + endArray[1];
            orderList = order.getOrdersByDate(start, end);
            
            session.setAttribute("orderList", orderList);
            
            response.sendRedirect("orderSearchByDateResult.jsp");
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
