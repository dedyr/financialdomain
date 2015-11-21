/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.MemberPaymentBTCDAO;
import dao.MemberPaymentCCDAO;
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
@WebServlet(name = "PaymentMethods", urlPatterns = {"/PaymentMethods"})
public class PaymentMethodsServlet extends WebApplication {

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
        Auth auth = new Auth(request);

        if(Auth.isValid(request)) {

            int memberId = auth.getId();

            // Credit Card
            if(action.equalsIgnoreCase("create_cc")) {
                request.setAttribute("member_id", memberId);
                request.getRequestDispatcher("payment_methods_create_cc.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("edit_cc")) {
                request.setAttribute("member_id", memberId);
                request.setAttribute("member_payment_cc", new MemberPaymentCCDAO().findById(id));
                request.getRequestDispatcher("payment_methods_edit_cc.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("delete_cc")) {
                new MemberPaymentCCDAO().delete(id);
                response.sendRedirect("PaymentMethods");
            }
            else if(action.equalsIgnoreCase("make_cc_default")) {
                new MemberPaymentCCDAO().makeDefault(memberId, id);
                response.sendRedirect("PaymentMethods");
            }
            // Bitcoin
            if(action.equalsIgnoreCase("create_btc")) {
                request.setAttribute("member_id", memberId);
                request.getRequestDispatcher("payment_methods_create_btc.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("edit_btc")) {
                request.setAttribute("member_id", memberId);
                request.setAttribute("member_payment_btc", new MemberPaymentBTCDAO().findById(id));
                request.getRequestDispatcher("payment_methods_edit_btc.jsp").forward(request, response);
            }
            else if(action.equalsIgnoreCase("delete_btc")) {
                new MemberPaymentBTCDAO().delete(id);
                response.sendRedirect("PaymentMethods");
            }
            else if(action.equalsIgnoreCase("make_btc_default")) {
                new MemberPaymentBTCDAO().makeDefault(memberId, id);
                response.sendRedirect("PaymentMethods");
            }
            // Default
            else {
                request.setAttribute("list_member_payment_cc", new MemberPaymentCCDAO().findByMemberId(memberId));
                request.setAttribute("list_member_payment_btc", new MemberPaymentBTCDAO().findByMemberId(memberId));
                request.getRequestDispatcher("payment_methods.jsp").forward(request, response);
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

        // Credit Card
        if(action.equalsIgnoreCase("create_cc_save")) {
            int is_default = Int.get(request.getParameter("is_default"));
            int memberId = Int.get(request.getParameter("member_id"));
            
            MemberPaymentCCDAO memberCC = new MemberPaymentCCDAO();
            
            if(is_default == 1) {
                memberCC.makeAllNoDefault(memberId);
            }
            
            memberCC.set("member_id", memberId);
            memberCC.set("credit_card", Str.get(request.getParameter("credit_card")));
            memberCC.set("name_on_card", Str.get(request.getParameter("name_on_card")));
            memberCC.set("expires_on", Str.get(request.getParameter("expires_on")));
            memberCC.set("is_default", is_default);
            memberCC.save();
            
            response.sendRedirect("PaymentMethods");
        }
        else if(action.equalsIgnoreCase("edit_cc_save")) {
            int is_default = Int.get(request.getParameter("is_default"));
            int memberId = Int.get(request.getParameter("member_id"));
            
            MemberPaymentCCDAO memberCC = new MemberPaymentCCDAO();
            
            if(is_default == 1) {
                memberCC.makeAllNoDefault(memberId);
            }
            
            memberCC.set("id", Int.get(request.getParameter("id")));
            memberCC.set("member_id", memberId);
            memberCC.set("credit_card", Str.get(request.getParameter("credit_card")));
            memberCC.set("name_on_card", Str.get(request.getParameter("name_on_card")));
            memberCC.set("expires_on", Str.get(request.getParameter("expires_on")));
            memberCC.set("is_default", is_default);
            memberCC.update();
            response.sendRedirect("PaymentMethods");
        }
        // Bitcoin
        if(action.equalsIgnoreCase("create_btc_save")) {
            int is_default = Int.get(request.getParameter("is_default"));
            int memberId = Int.get(request.getParameter("member_id"));
            
            MemberPaymentBTCDAO memberBTC = new MemberPaymentBTCDAO();
            
            if(is_default == 1) {
                memberBTC.makeAllNoDefault(memberId);
            }
            
            memberBTC.set("member_id", memberId);
            memberBTC.set("btc_address", Str.get(request.getParameter("btc_address")));
            memberBTC.set("name_on_address", Str.get(request.getParameter("name_on_address")));
            memberBTC.set("current_ballance", Dbl.get(request.getParameter("current_ballance")));
            memberBTC.set("is_default", is_default);
            memberBTC.save();
            
            response.sendRedirect("PaymentMethods");
        }
        else if(action.equalsIgnoreCase("edit_btc_save")) {
            int is_default = Int.get(request.getParameter("is_default"));
            int memberId = Int.get(request.getParameter("member_id"));
            
            MemberPaymentBTCDAO memberBTC = new MemberPaymentBTCDAO();
            
            if(is_default == 1) {
                memberBTC.makeAllNoDefault(memberId);
            }
            
            memberBTC.set("id", Int.get(request.getParameter("id")));
            memberBTC.set("member_id", memberId);
            memberBTC.set("btc_address", Str.get(request.getParameter("btc_address")));
            memberBTC.set("name_on_address", Str.get(request.getParameter("name_on_address")));
            memberBTC.set("current_ballance", Dbl.get(request.getParameter("current_ballance")));
            memberBTC.set("is_default", is_default);
            memberBTC.update();
            response.sendRedirect("PaymentMethods");
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
