/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.AdminDAO;
import fx.lang.Int;
import fx.lang.Str;
import fx.security.cryptography.Cryptography;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/Admin"})
public class AdminServlet extends WebApplication {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     Handles the HTTP <code>GET</code> method.

     @param request servlet request
     @param response servlet response
     @throws ServletException if a servlet-specific error occurs
     @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = Str.get(request.getParameter("action"));
        int id = Int.get(request.getParameter("id"));

        if(Auth.isValid(request)) {

            if(action.equalsIgnoreCase("create")) {
                request.getRequestDispatcher("admin_create.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("edit")) {
                request.setAttribute("data", new AdminDAO().findById(id));
                request.getRequestDispatcher("admin_edit.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("delete")) {
                new AdminDAO().delete(id);
                response.sendRedirect("Admin");
            }
            else {
                request.setAttribute("list", new AdminDAO().findAll());
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }

        }
        else {
            Auth.doLogin(response);
        }

    }

    /**
     Handles the HTTP <code>POST</code> method.

     @param request servlet request
     @param response servlet response
     @throws ServletException if a servlet-specific error occurs
     @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = Str.get(request.getParameter("action"));

        if(action.equalsIgnoreCase("create_save")) {
            AdminDAO admin = new AdminDAO();
            admin.set("name", Str.get(request.getParameter("name")));
            admin.set("email", Str.get(request.getParameter("email")));
            admin.set("password", Str.get(request.getParameter("password")));
            admin.set("status", Int.get(request.getParameter("status")));
            admin.save();
            response.sendRedirect("Admin");
        }
        else if(action.equalsIgnoreCase("edit_save")) {
            String oldPassword = Str.get(request.getParameter("password"));
            String newPassword = Str.get(request.getParameter("new_password"));
            String password = "";
            
            if(newPassword.equalsIgnoreCase("")) {
                password = oldPassword;
            }
            else {
                password = new Cryptography().md5(newPassword);
            }
            
            AdminDAO admin = new AdminDAO();
            admin.set("id", Int.get(request.getParameter("id")));
            admin.set("name", Str.get(request.getParameter("name")));
            admin.set("email", Str.get(request.getParameter("email")));
            admin.set("password", password);
            admin.set("status", Int.get(request.getParameter("status")));
            admin.update();
            response.sendRedirect("Admin");
        }
    }

    /**
     Returns a short description of the servlet.

     @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
