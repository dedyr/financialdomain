/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.AssetDAO;
import dao.DomainDAO;
import fx.network.http.WebApplication;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);

        String action = getString("action");
        int id = getInt("id");

        if(Auth.isValid(request)) {

            if(action.equalsIgnoreCase("create")) {
                setAttribute("list_asset", new AssetDAO().findAll());
                forward("domain_create.jsp");
            }
            else if(action.equalsIgnoreCase("edit")) {
                setAttribute("list_asset", new AssetDAO().findAll());
                setAttribute("data", new DomainDAO().findById(id));
                forward("domain_edit.jsp");
            }
            else if(action.equalsIgnoreCase("delete")) {
                new DomainDAO().delete(id);
                redirect("Domain");
            }
            else {
                Auth auth = new Auth(request);
                setAttribute("list", new DomainDAO().findAllRequestDomainByMemberId(auth.getId()));
                forward("domain.jsp");
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
            DomainDAO domain = new DomainDAO();
            domain.set("asset_id", getInt("asset_id"));
            domain.set("domain", getString("domain"));
            domain.set("privacy_protection", getString("privacy_protection"));
            domain.set("expire_date", getString("expire_date"));
            domain.set("auto_renewal", getInt("auto_renewal"));
            domain.set("transfer_lock", getInt("transfer_lock"));
            domain.set("price_per_month", getString("price_per_month"));
            domain.set("price_per_year", getString("price_per_year"));
            domain.set("price_forever", getString("price_forever"));
            domain.set("status", getInt("status"));
            domain.save();
            redirect("Domain");
        }
        else if(action.equalsIgnoreCase("edit_save")) {
            DomainDAO domain = new DomainDAO();
            domain.set("id", getInt("id"));
            domain.set("asset_id", getInt("asset_id"));
            domain.set("domain", getString("domain"));
            domain.set("privacy_protection", getString("privacy_protection"));
            domain.set("expire_date", getString("expire_date"));
            domain.set("auto_renewal", getInt("auto_renewal"));
            domain.set("transfer_lock", getInt("transfer_lock"));
            domain.set("price_per_month", getString("price_per_month"));
            domain.set("price_per_year", getString("price_per_year"));
            domain.set("price_forever", getString("price_forever"));
            domain.set("status", getInt("status"));
            domain.update();
            redirect("Domain");
        }
    }

}
