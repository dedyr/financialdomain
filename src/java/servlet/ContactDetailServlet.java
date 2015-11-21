/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.CountryDAO;
import dao.MemberDAO;
import dao.MemberRequestDAO;
import dao.MemberTypeDAO;
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
@WebServlet(name = "ContactDetailsServlet", urlPatterns = {"/ContactDetails"})
public class ContactDetailServlet extends WebApplication {

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
        Auth auth = new Auth(request);

        if(Auth.isValid(request)) {

            int memberId = auth.getId();

            request.setAttribute("member", new MemberDAO().findById(memberId));
            request.setAttribute("count_order", new MemberRequestDAO().countOrder(memberId));
            request.setAttribute("list_member_type", new MemberTypeDAO().findAll());
            request.setAttribute("list_country", new CountryDAO().findAll());
            request.getRequestDispatcher("contact_details.jsp").forward(request, response);

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
        Auth auth = new Auth(request);

        if(action.equalsIgnoreCase("complete_register")) {
            MemberDAO member = new MemberDAO();
            member.set("id", auth.getId());
            member.set("first_name", Str.get(request.getParameter("first_name")));
            member.set("middle_name", Str.get(request.getParameter("middle_name")));
            member.set("last_name", Str.get(request.getParameter("last_name")));
            member.set("full_name", Str.get(Str.get(request.getParameter("first_name")) + " " + Str.get(request.getParameter("middle_name") + " " + Str.get(request.getParameter("last_name")))).replace("  ", " "));
            member.set("company_name", Str.get(request.getParameter("company_name")));
            member.set("email", Str.get(request.getParameter("email")));
            member.set("phone", Str.get(request.getParameter("phone")));
            member.set("address", Str.get(request.getParameter("address")));
            member.set("country", Str.get(request.getParameter("country")));
            member.set("province", Str.get(request.getParameter("province")));
            member.set("city", Str.get(request.getParameter("city")));
            member.set("postal_code", Str.get(request.getParameter("postal_code")));
            member.set("privacy_protection", Int.get(request.getParameter("privacy_protection")));
            member.update();
            
            response.sendRedirect("ReviewAndPurchase");
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
