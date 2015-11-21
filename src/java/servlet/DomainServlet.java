/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.AssetDAO;
import dao.DomainDAO;
import fx.lang.Int;
import fx.lang.Str;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "DomainServlet", urlPatterns = {"/Domain"})
public class DomainServlet extends WebApplication {

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
                request.setAttribute("list_asset", new AssetDAO().findAll());
                request.getRequestDispatcher("domain_create.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("edit")) {
                request.setAttribute("list_asset", new AssetDAO().findAll());
                request.setAttribute("data", new DomainDAO().findById(id));
                request.getRequestDispatcher("domain_edit.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("delete")) {
                new DomainDAO().delete(id);
                response.sendRedirect("Domain");
            }
            else {
                Auth auth = new Auth(request);
                request.setAttribute("list", new DomainDAO().findAllRequestDomainByMemberId(auth.getId()));
                request.getRequestDispatcher("domain.jsp").forward(request, response);
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
            DomainDAO domain = new DomainDAO();
            domain.set("asset_id", Int.get(request.getParameter("asset_id")));
            domain.set("domain", Str.get(request.getParameter("domain")));
            domain.set("privacy_protection", Str.get(request.getParameter("privacy_protection")));
            domain.set("expire_date", Str.get(request.getParameter("expire_date")));
            domain.set("auto_renewal", Int.get(request.getParameter("auto_renewal")));
            domain.set("transfer_lock", Int.get(request.getParameter("transfer_lock")));
            domain.set("price_per_month", Str.get(request.getParameter("price_per_month")));
            domain.set("price_per_year", Str.get(request.getParameter("price_per_year")));
            domain.set("price_forever", Str.get(request.getParameter("price_forever")));
            domain.set("status", Int.get(request.getParameter("status")));
            domain.save();
            response.sendRedirect("Domain");
        }
        else if(action.equalsIgnoreCase("edit_save")) {
            DomainDAO domain = new DomainDAO();
            domain.set("id", Int.get(request.getParameter("id")));
            domain.set("asset_id", Int.get(request.getParameter("asset_id")));
            domain.set("domain", Str.get(request.getParameter("domain")));
            domain.set("privacy_protection", Str.get(request.getParameter("privacy_protection")));
            domain.set("expire_date", Str.get(request.getParameter("expire_date")));
            domain.set("auto_renewal", Int.get(request.getParameter("auto_renewal")));
            domain.set("transfer_lock", Int.get(request.getParameter("transfer_lock")));
            domain.set("price_per_month", Str.get(request.getParameter("price_per_month")));
            domain.set("price_per_year", Str.get(request.getParameter("price_per_year")));
            domain.set("price_forever", Str.get(request.getParameter("price_forever")));
            domain.set("status", Int.get(request.getParameter("status")));
            domain.update();
            response.sendRedirect("Domain");
        }
    }

}
