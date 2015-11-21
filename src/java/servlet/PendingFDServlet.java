/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.Auth;
import dao.DomainDAO;
import fx.network.http.WebApplication;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "PendingFDServlet", urlPatterns = {"/PendingFD"})
public class PendingFDServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

        init(request, response);
        
        String action = getString("action");

        if(Auth.isValid(request)) {
            Auth auth = new Auth(request);
            setAttribute("list", new DomainDAO().findAllPendingRequestDomainByMemberId(auth.getId()));
            forward("pending_fd.jsp");

        }
        else {
            Auth.doLogin(response);
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }

}
