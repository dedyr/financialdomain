/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.AssetDAO;
import dao.DomainDAO;
import dao.MemberRequestDAO;
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
@WebServlet(name = "DomainSearch", urlPatterns = {"/DomainSearch"})
public class DomainSearchServlet extends WebApplication {

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
        String domain = Str.get(request.getParameter("domain"));
        int asset_id = Int.get(request.getParameter("asset_id"));
        int domain_id = Int.get(request.getParameter("domain_id"));
        Auth auth = new Auth(request);

        if(Auth.isValid(request)) {
            
            if(action.equalsIgnoreCase("add_to_cart")) {
                new MemberRequestDAO().addToCart(auth.getId(), domain_id, fx.date.Date.format("yyyy-MM-dd HH:mm:ss"));
            }

            request.setAttribute("domain", domain);
            request.setAttribute("asset_id", asset_id);
            
            request.setAttribute("list_asset_filter", new AssetDAO().findAll());
            request.setAttribute("list_domain", new DomainDAO().findAndCheckDomain(domain, asset_id, auth.getId()));
            
            request.getRequestDispatcher("domain_search.jsp").forward(request, response);

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

    }

}
