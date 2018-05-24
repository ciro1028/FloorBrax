/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import Business.HandleFiles;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/FileUpload"})
public class FileUpload extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String path = "";
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> files = sf.parseRequest(req);
            
            for (FileItem fileItem : files) {
                HandleFiles hf = new HandleFiles();
                hf.uploadFile(fileItem.getName(), fileItem.getInputStream());
                path = "https://s3.amazonaws.com/floorbrax/orders/" + fileItem.getName();
            }
            HttpSession session = req.getSession();
            session.setAttribute("path", path);
            
            resp.sendRedirect("addOrder.jsp");
            
        } catch(Exception e){
            System.err.println(e.getMessage());
        }
        
    }
}
