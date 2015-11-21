/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.AdminDAO;
import fx.network.http.WebApplication;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

        init(request, response);
        
        String action = getString("action");
        int id = getInt("id");

        if(Auth.isValid(request)) {

            if(action.equalsIgnoreCase("create")) {
                forward("admin_create.jsp");
            }
            else if(action.equalsIgnoreCase("edit")) {
                setAttribute("data", new AdminDAO().findById(id));
                forward("admin_edit.jsp");
            }
            else if(action.equalsIgnoreCase("delete")) {
                new AdminDAO().delete(id);
                redirect("Admin");
            }
            else {
                setAttribute("list", new AdminDAO().findAll());
                forward("admin.jsp");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);
        
        String action = getString("action");

        if(action.equalsIgnoreCase("create_save")) {
            AdminDAO admin = new AdminDAO();
            admin.set("name", getString("name"));
            admin.set("email", getString("email"));
            admin.set("password", getString("password"));
            admin.set("status", getInt("status"));
            admin.save();
            redirect("Admin");
        }
        else if(action.equalsIgnoreCase("edit_save")) {
            String oldPassword = getString("password");
            String newPassword = getString("new_password");
            String password = "";
            
            if(newPassword.equalsIgnoreCase("")) {
                password = oldPassword;
            }
            else {
                password = md5(newPassword);
            }
            
            AdminDAO admin = new AdminDAO();
            admin.set("id", getInt("id"));
            admin.set("name", getString("name"));
            admin.set("email", getString("email"));
            admin.set("password", password);
            admin.set("status", getInt("status"));
            admin.update();
            redirect("Admin");
        }
    }

}
