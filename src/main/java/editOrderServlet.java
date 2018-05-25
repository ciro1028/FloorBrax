/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Business.Installer;
import Business.Order;
import Business.Service;
import Business.Subdivision;
import Business.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/editOrderServlet"})
public class editOrderServlet extends HttpServlet {

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
            Installer installer = new Installer();
            installer.selectInstaller("name", request.getParameter("installer"));
            Subdivision subdivision = new Subdivision();
            subdivision.selectSubdivision("name", request.getParameter("subdivision"));
            
            String orderNum = request.getParameter("orderNum");
            int installerId = installer.getId();
            String description = request.getParameter("details");
            String date = request.getParameter("datepicker");
            String[] dateArray = date.split("/");
            
            String formattedDate = dateArray[2] + "-" + dateArray[0] + "-" + dateArray[1];
            
            int extraPrice = Integer.parseInt(request.getParameter("ec"));
            String status = request.getParameter("status");
            String subdivisionId = String.valueOf(subdivision.getId());
            String pic = "";
            
            String services = request.getParameter("servicesPlaceholder");
            String[] svcArray = services.split("%");
            
            int total = 0;
            int toPay = 0;
            String serviceList = "";
            
            int sqf = Integer.parseInt(request.getParameter("sftPH"));
            int sqfDitra = Integer.parseInt(request.getParameter("sftDPH"));
            int sqfHardwood = Integer.parseInt(request.getParameter("sftHPH"));
            
            for (int i = 0; i < svcArray.length; i++) {
                Service service = new Service();
                service.selectService("title", svcArray[i]);
                if(service.getId() == 6){
                    toPay += service.getPricePerSquareFootPaid() * sqf + service.getPriceperSquareFootDitraToPay() * sqfDitra;
                    total += service.getPricePerSquareFoot()* sqf + service.getPriceperSquareFootDitra() * sqfDitra;
                } else if (service.getId() == 7){
                    toPay += service.getPricePerSquareFootPaid() * sqfHardwood;
                    total += service.getPricePerSquareFoot() * sqfHardwood;
                } else {
                    total += service.getPrice();
                    toPay += service.getToPay();
                }
                
                serviceList += service.getId() + " ";
            }
            
            toPay += extraPrice;
            User user = new User();
            
            user = (User)session.getAttribute("user");
            String userId = String.valueOf(user.getId());
            
            toPay += extraPrice;
            order.updateOrder(orderNum, installerId, description, formattedDate, status, subdivisionId, pic, total, toPay, serviceList, sqfHardwood, userId, extraPrice, sqfDitra, sqfHardwood);
            
            order.selectOrder("order_num", orderNum);
            
            session.setAttribute("order", order);
            session.setAttribute("subEdited", subdivision.getName());
            session.setAttribute("installerEdited", installer.getName());
            
            RequestDispatcher rd = request.getRequestDispatcher("orderAdded.jsp");
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
