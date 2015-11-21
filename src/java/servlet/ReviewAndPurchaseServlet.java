/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.MemberDAO;
import dao.MemberRequestDAO;
import fx.network.http.WebApplication;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "ReviewAndPurchaseServlet", urlPatterns = {"/ReviewAndPurchase"})
public class ReviewAndPurchaseServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);
        
        String action = getString("action");
        Auth auth = new Auth(request);

        if(Auth.isValid(request)) {

            int memberId = auth.getId();

            setAttribute("member", new MemberDAO().findById(memberId));
            setAttribute("list_order", new MemberRequestDAO().findAllOrder(memberId));
            forward("review_and_purchase.jsp");

        }
        else {
            Auth.doLogin(response);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        
    }

}
