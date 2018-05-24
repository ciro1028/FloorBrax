/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import Business.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/loginSvlt"})
public class loginSvlt extends HttpServlet {

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
            User user = new User();
            Order order = new Order();
            Installer installer = new Installer();
            Service service = new Service();
            Subdivision sub = new Subdivision();
            ArrayList<Installer> listOfInstallers = new ArrayList();
            ArrayList<Service> listOfServices = new ArrayList();
            ArrayList<Subdivision> listOfSubdivisions = new ArrayList();
            listOfInstallers = installer.selectAllInstallers();
            listOfServices = service.selectAllServices();
            listOfSubdivisions = sub.selectAllSubdivisions();
            HttpSession session = request.getSession();
            String enteredUsername = request.getParameter("username");
            String enteredPassword = request.getParameter("password");
            
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
            
            user.selectUser("username", enteredUsername);

            if(enteredPassword.equals(user.getPassword())){
                session.setAttribute("user", user);
                session.setAttribute("todayOrders", todayOrders);
                session.setAttribute("listOfInstallers", listOfInstallers);
                session.setAttribute("todayInstallers", todayInstallers);
                session.setAttribute("listOfServices", listOfServices);
                session.setAttribute("listOfSubdivisions", listOfSubdivisions);
                session.setAttribute("todaySubs", todaySubs);
                
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            } else {
                out.print("<h1>Wrong Password</h1>");
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
