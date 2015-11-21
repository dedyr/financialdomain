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
import fx.network.http.WebApplication;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 @author LENOVO
 */
@WebServlet(name = "DomainSearch", urlPatterns = {"/DomainSearch"})
public class DomainSearchServlet extends WebApplication {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        
        init(request, response);

        String action = getString("action");
        String domain = getString("domain");
        int asset_id = getInt("asset_id");
        int domain_id = getInt("domain_id");
        Auth auth = new Auth(request);

        if(Auth.isValid(request)) {
            
            if(action.equalsIgnoreCase("add_to_cart")) {
                new MemberRequestDAO().addToCart(auth.getId(), domain_id, date("yyyy-MM-dd HH:mm:ss"));
            }

            setAttribute("domain", domain);
            setAttribute("asset_id", asset_id);
            
            setAttribute("list_asset_filter", new AssetDAO().findAll());
            setAttribute("list_domain", new DomainDAO().findAndCheckDomain(domain, asset_id, auth.getId()));
            
            forward("domain_search.jsp");

        }
        else {
            Auth.doLogin(response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }

}
