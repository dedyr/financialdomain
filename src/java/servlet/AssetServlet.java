/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.AssetDAO;
import fx.lang.Dbl;
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
@WebServlet(name = "AssetServlet", urlPatterns = {"/Asset"})
public class AssetServlet extends WebApplication {

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
                request.getRequestDispatcher("asset_create.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("edit")) {
                request.setAttribute("data", new AssetDAO().findById(id));
                request.getRequestDispatcher("asset_edit.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("delete")) {
                new AssetDAO().delete(id);
                response.sendRedirect("Asset");
            }
            else if(action.equalsIgnoreCase("")) {
                request.setAttribute("list", new AssetDAO().findAll());
                request.getRequestDispatcher("asset.jsp").forward(request, response);
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
            AssetDAO asset = new AssetDAO();
            asset.set("name", Str.get(request.getParameter("name")));
            asset.set("address", Str.get(request.getParameter("address")));
            asset.set("phone", Str.get(request.getParameter("phone")));
            asset.set("fax", Str.get(request.getParameter("fax")));
            asset.set("email", Str.get(request.getParameter("email")));
            asset.set("website", Str.get(request.getParameter("website")));
            asset.set("note", Str.get(request.getParameter("note")));
            asset.set("bits", Dbl.get(request.getParameter("bits")));
            asset.set("status", Int.get(request.getParameter("status")));
            asset.save();
            response.sendRedirect("Asset");
        }
        else if(action.equalsIgnoreCase("edit_save")) {
            AssetDAO asset = new AssetDAO();
            asset.set("id", Int.get(request.getParameter("id")));
            asset.set("name", Str.get(request.getParameter("name")));
            asset.set("address", Str.get(request.getParameter("address")));
            asset.set("phone", Str.get(request.getParameter("phone")));
            asset.set("fax", Str.get(request.getParameter("fax")));
            asset.set("email", Str.get(request.getParameter("email")));
            asset.set("website", Str.get(request.getParameter("website")));
            asset.set("note", Str.get(request.getParameter("note")));
            asset.set("bits", Dbl.get(request.getParameter("bits")));
            asset.set("status", Int.get(request.getParameter("status")));
            asset.update();
            response.sendRedirect("Asset");
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
