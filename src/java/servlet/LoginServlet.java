/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDAO;
import fx.lang.Str;
import fx.security.cryptography.Cryptography;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**

 @author LENOVO
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends WebApplication {

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

        if(request.getParameter("action") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else if(request.getParameter("action").equalsIgnoreCase("logout")) {
            HttpSession session = request.getSession(false);
            session.invalidate();
            response.sendRedirect("Login?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da");
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
        //processRequest(request, response);

        String email = "";
        String password = "";
        try {
            email = Str.get(request.getParameter("email"));
            password = new Cryptography().md5(Str.get(request.getParameter("password")));
            
            Map data = new MemberDAO().login(email, password);

            if(data != null) {
                if(data.size() > 0) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("id", data.get("id"));
                    session.setAttribute("full_name", data.get("full_name"));
                    session.setAttribute("email", data.get("email"));
                }
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            response.sendRedirect("Dashboard?.auth=d56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252dad56b699830e77ba53855679cb1d252da");
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
